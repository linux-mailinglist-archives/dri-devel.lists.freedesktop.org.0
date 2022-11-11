Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63631625AAE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0DD10E18B;
	Fri, 11 Nov 2022 12:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7A810E170;
 Fri, 11 Nov 2022 12:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXcZVlyzyER8RMbnJF8v/+bqxUdzws261OwdDQF9iN6eROefh7LcbpMr1SB6+oopWGqjmOfzxRoZM4jZHAUf0ZbSGzAOsiPLGcxbGWUAVRJPtCN5WFemA37iE2LfAT+2LNFbU7+ogzryvqAntKrRx3LbI2ZbNwmq3PbFy1fq1QwT6dgCJgZaFkk9Gv2HkI9EdpcL+FcpyUcQ37rAAK4ZEG/9/4+YeT9sEnbWS9rLt5sk00N8FK/QCckSjNzVjr8i6JZcWyJcILJ8OqAgziP0Im5Z7IEQNvvtKox/wqdQ2enmFRe9kkUBRer7NmfrKzKq+6UwOwmVh3DhOJwM49Jyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJLNPcFWzS5LAsaAXKd+bnp5iG4de7O6aWUVA6YX2Xw=;
 b=mhEPt3f6r52Xge5dEn/iIJFYIFG8XnIgw3xGj5xFTgA1rXn6F7PHV/31/QzvYyvO/XldhiLpAnxwaeOr8lSaTTpPa0lIaRqXT/D/SNOYNPx/sjlmPrqUN3fAxBwiJFHZcH6u7hbWAJ3m0eIbUys1HAH5pFRiQZv+PYXTn9h/9KUlC4zfcb4CIgxlV/hmR5LmKtOP4kHpp678QZZw7GFjukxMCEvWpgS9Nzl9YVfIJmd4MEqiOsJCygwiQonE15YA38N4rUxIMsUNmLxOj1fvJLsCfC/yfiyvjbwoEIf+HitMeM7Qg1dMhvQAqEx4ZDJ1P4nSrD4oG64eZE4ToQM+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJLNPcFWzS5LAsaAXKd+bnp5iG4de7O6aWUVA6YX2Xw=;
 b=2yY6LRc3CYF+JZbSIR8m9lssrVBW8kIMFdUQ5X8qfmLJwlxWibpEHPZ1xu8EgyZH1N6wgizoSKpwu81s2h9VR7PrLRL31wn/SUUOd2+Yr1APd8Y8/TrMewDmSb0j5cFGmne/Dm19TN6XPjEZpilzw2Yd5RX5izno5UPD9v5yljA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 12:47:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 12:47:40 +0000
Message-ID: <ea11a25a-51cf-fbc8-bcd0-004ec47ff582@amd.com>
Date: Fri, 11 Nov 2022 13:47:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 1/6] dma-buf: Move dma_buf_mmap_internal() to dynamic
 locking specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com>
 <20221110201349.351294-2-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221110201349.351294-2-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: f89c8762-41b6-4bc3-f266-08dac3e2eaec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwCY2YXDKaT4SOcSZ2Hlh9R1/2lM21XVJ4WgHHqI9s8fILGmlu5cedKcumDnyn0euxgBZEg+bjLiP8cVGNn0+7vXQZtcNBx8Q8rPTgJGmHT9qGdXJ/wYdOV7KLaIw3Xpe/z6T8obSCUxVFj+DSVKNcIrsBkLOLeFYJuPRubBvnmaNR5FybzwpdtOacYizNjNfYVW7KtPKbmMKrW5S7wKeAX5szs4+6UTNC3+Kw1isz0uV9jfe7rcKmd6vdkbileIHQWGSfTzD3JdoD32R/PWuxP31C0n4xBtICIDUj9yCpq7FYV6vfNZJ7V48+S+YhUb1oDCnYutnlZm3cqtXIERSyU43GHqsGXYBhMLLQZKxuvPryhIWW/Znb7vxkjXuxCo1egzP/ey50XNdlA9T5X0JjEe3opgLPq6xfRnVZFwRHcpXbFq4oeZy1H4o/fE5IeZu6ehqAesELoU4ttXDE2/G48Ekw7f1i6rlVJZdzY/FALGwRET4R8rFVnwhNquTyzTM1uKO6sTnpk/BafEZ6o9Hn2MFbc+dLrvB22jgrjAAYHbnCa3TAHUd7+1YB+tzYpLuaDQQ/fhYX1mRfM67YAYv/QctVYv/GwJ2rij/twEFg3luRyCkSuGc0GULh7Ir8YuQhS/IMasboIZU1kl+l8URw6ZcUaLn9QOtPNAEG5/9hJvZpBL8AzjubPT0i333IckQdSkmG1HtK2Z+RbyVwo915E3EAwCJVBaQ97NXTnd/PzJY3iwlV+qyJg7SLaRVOV2FlPig1hEpWTZPhkuMDEL/ISt7TWgRjqNxh9/pcdBOYGTWCO0ybf1UPs/60iaRyVh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(2616005)(83380400001)(66574015)(38100700002)(186003)(6512007)(6506007)(66556008)(5660300002)(7416002)(2906002)(6486002)(8936002)(41300700001)(110136005)(6666004)(478600001)(4326008)(66946007)(66476007)(316002)(8676002)(31686004)(921005)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhCeTdMc2FMZ1JCcWlSSkJjTlRKR3NKRkswMmFSUzB5OHVrTzI0ZzVPNXhM?=
 =?utf-8?B?ak96N1R6YStnY1FaS1RkektpSzVhbFg5bUtVbXZEbGM1ZHNrNHBWQ0ZoK2Zp?=
 =?utf-8?B?cXlzKytjSXFkUTF0Q04wSDU2V0orUG9LTjVNdzl4T3I4Q3hvQ0o0a0dCSnYz?=
 =?utf-8?B?cTJreVRpUWFETFFveW5LNVF0QkUzT0R3bld1NUlWQ3FVUXhGMzdGRCt0amhY?=
 =?utf-8?B?NU1zc2hGWExacGVsYlpieTRkWENjSWY0U0pKTWl4aFN5dFpDUkxiSXhQQ3BK?=
 =?utf-8?B?dTNKV2dUT3gvaDJZTVVDNXNLQVFEbXZhWUVCZDlmWHRDTGU1a1hSb2RBMUZG?=
 =?utf-8?B?b2NyM255WEJlNEJ5Unk0aHR6M2lGelV2Y05GUDJtUXVWQVI2OWI3WVA4MWhP?=
 =?utf-8?B?aDFMT3JsN0k4bE5Tc1ZuTkViUThpWEJiV1Y4bE5BTXNtcVNneEQrT2ZFTW55?=
 =?utf-8?B?YlZ3SGZ3bVZWNnFnREh5UlZnTGxtWjkyc0JiakRyNm1QUnVIU3dZL3M3dVBF?=
 =?utf-8?B?TjBCNmdodHZvSWgrRmNpUU04QjZ3NlNNd1JMQnIraTFtaWthZkpVZjJCVFBJ?=
 =?utf-8?B?ZDZmK0hOaVA4RTFvYmZYa09HTHZsSk5YRW0yb1FMMVV3WVRFUzVVczNzeGp0?=
 =?utf-8?B?eFExUjBIZmhCR0pCbXFNR1labG5vRkRUUGZnS3dDRWxrY29DdU9VaHd1T3VP?=
 =?utf-8?B?UUs4NEVXdmFpN0tJTFFEbnA4VHg1cEdEM0RVeDFDamhqM3VtOTljWlJvS3BW?=
 =?utf-8?B?NTd5b3FDWnpDS0I5dWpvSG55RXV6VlZwSGErZEVaQjJOUEUzbXZtMDJ3dHhs?=
 =?utf-8?B?ZHd6UjdDNmtrOGZ2S3hpWERIOEdoSjFOc2pxQy9XanRLUzJBQTl6MmZNdXYv?=
 =?utf-8?B?amk3ckh4Q2wzOWtoajlZOFJqellpWTZlaFd4Y3E3K2hkRGQ4aHpIWkM1a1Ir?=
 =?utf-8?B?TkRlMFRMd3BmY1ZPWC9GZ1gwekliWmYrMUtxbDVKQm5rV2JOUUl6UXd3ekhQ?=
 =?utf-8?B?WXpxRzh5V1p3eXo3Sll0Njd5eGEwM09iSFk3N0Qxa1NoSkM3b3c1RXd1UWd0?=
 =?utf-8?B?Q0NNdmFTQm1vQ1oxd3VyOEl4clZrbXRYKzNyK2FJME5lY3krV2I3S3VFTVpU?=
 =?utf-8?B?VUYxbGdKY3A2MGxUK245SFN0Q0hDSmh0UFJzSFJERmxtcmkra1hXMHBQRlJE?=
 =?utf-8?B?WTI5dDZJcUYxWDZPVGFWL3ZNQnFyMSt0aTgrWEVOa3JLOVZiR2xSZjlDWk5v?=
 =?utf-8?B?a0pUTlFHQW96c3RHb3VYTHhXR0YwblRjQ3dadUpnbFRsaklWWUtjSlVXMzJ4?=
 =?utf-8?B?ek9WNkR3K2t2Ym9mYndxM2hTYnUydzdSTmo0MzlFUFlFdzBiellrNzlZTWN0?=
 =?utf-8?B?dDZkNUpRUzI1cXpZaVR2RVZBV3VZZDV5QnVHTHFzbFBPeXcySElkcEZVL3B0?=
 =?utf-8?B?WE4wUWd1anlnRUhieE9ZSExMa2hibldPbm5OUDF2UGxSVlhINEhRK0wyY0JN?=
 =?utf-8?B?WTRua2lnOTM3YUhMMmlVWGFwNHVsYTZzVitWWFp4ZjlZeCtqNHYwbDQwVGk0?=
 =?utf-8?B?ZWlBaTNxcUNQbXorSVRDSFBjOTNkSGhqT29QU2t2RzVzeWRFUTVJRW1kc3dl?=
 =?utf-8?B?V251OWZ0Wmk2Q1lQRzByVDNDN2IrbmQxdjVEa0RDSEYrcVhLbGowVkZhY2F2?=
 =?utf-8?B?U0FaRGZFSFFNWFF6d2FQRHhWbGI4S204amlwdEJrb0xwVkNxZWRWNG1zYnhp?=
 =?utf-8?B?djQ4ZkFiSXdnQmlRVi9CdVRTUWRwdkhwaHIwNHhISVNtWWtvM3F0TzlheGsz?=
 =?utf-8?B?SDJ2Nk9jZUZWak95cm1wUkJxNUwzU0wzVjdSd3JEOGpEaEdBb29uaUQ4bmwz?=
 =?utf-8?B?ZVpDSUUzKy9wZVdzUmVCbzRiYzZKQzBOZVNtYzFjNFRpRHVUTFJ0ZXpJMk1j?=
 =?utf-8?B?VWNHLyt4YzVGc3lldE1CUEJXV1MwZXFXMERFenNkb0FvMWVxOEJmaUYzUjEw?=
 =?utf-8?B?QURJRXFReUNSK0Y3cURaMDZnVFFCOWJIcThXcUR3N1RuVjZseXpVdnVrYWhs?=
 =?utf-8?B?cTFCcGhhNk1ScHI0UFNMQ1hGMjVwSjV5QjdJd2xaMHkxWDArd3o1ellVRURE?=
 =?utf-8?B?VHFjSDNVM1JmdFMxSlFrbm9rcmpKaERPdENzdUczQXpndytVTG1ZMUJuRWJP?=
 =?utf-8?Q?MPcLhqYbqPcewTTcAh5Hkm7qPbL9eMIyXZ/YdVEPqCON?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89c8762-41b6-4bc3-f266-08dac3e2eaec
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 12:47:40.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Lcrb/9myqqM+nDq2DY5EPNWQbX1d3ePsRW/zGwcyIpIw7VZvzKozkyUn02f43xl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.11.22 um 21:13 schrieb Dmitry Osipenko:
> All dma-buf functions has been moved to dynamic locking specification
> The dma_buf_mmap_internal() was missed out by accident. Take reservation
> lock around file mapping operation to adhere the common locking convention.
>
> Reported-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for this patch here.

Acked-by: Christian König <christian.koenig@amd.com> for the rest of the 
series.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 13bfd2d09c56..b809513b03fe 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -129,6 +129,7 @@ static struct file_system_type dma_buf_fs_type = {
>   static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct dma_buf *dmabuf;
> +	int ret;
>   
>   	if (!is_dma_buf_file(file))
>   		return -EINVAL;
> @@ -144,7 +145,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   	    dmabuf->size >> PAGE_SHIFT)
>   		return -EINVAL;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	ret = dmabuf->ops->mmap(dmabuf, vma);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	return ret;
>   }
>   
>   static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)

