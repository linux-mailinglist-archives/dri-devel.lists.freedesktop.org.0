Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAEA80DB50
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 21:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B89F10E4DE;
	Mon, 11 Dec 2023 20:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5831610E138;
 Mon, 11 Dec 2023 20:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/KN99QQq/ZeDpsr/rE7s3Qu6/PyguMQDYJ6gcAxj+fs6PmDKQiPDdqh/HRC2fG52/7cki2vDR7XN5id24IWI5/it0RTEA5cLe8ACemY9BspN77KtsdUQQxJpws2IDGuPhUGEEDknLsJjfWCanZh78hlKUInbYd/BlfdvwKC5duhRgINr0tE9nLVjvha2mP5X+sUzhsyYdBjOOcNQvIchMBCY6v3B/TqGSUTcMgJmEMbu9QJG1U0rGW55uT8E1w5prh10Rx/KCe0QEsZaLdM3ZNtlUtkSihXYCLNAv0uzmCxrZN7wQL5066IwSE9QTq5siIlmpv67aUqDHwN0hG99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV6gzpPkV9jfagsTjyDjLHJKzMTseXESaqu/BC1BJ8w=;
 b=M0JHaXqglJNkX7oCIxHOk8qaEfNfqo2l/aO75rawxLbtqxX0LiUx6UqSoL3pFjcWPk6XcAlSyBHdyZIBviuBFrAxgBV1v196EDHzRY6xNxyUSkSG+IjHnGWCbJ6iN5DJdCo4f1TOMSXcd6moMGfhBx4nC8XWzd0l+0rL6Ktma07u7DF3AoRzRa5jtCjGvcCynz7s+xuzz9OgvofXR7qUN2jH/ouUDzMvn8iY7eSlWBMjSPbx559slQVZAuoM3yxP1DA+oT43oH4RpQChF3Mm+PNlosiKLENG5FPI2FDeoFBbXka17i9fC6veUppB7osaGgxKi7wD5ceP1K36f+Sz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV6gzpPkV9jfagsTjyDjLHJKzMTseXESaqu/BC1BJ8w=;
 b=S+45fr21S43pLSJVR82CcjoYs+UfQCM0/SwurPSXLcqx0n0Yn3Wl8h/xBoq8KYYwBCFinCj1RmR5DD7Svtt8LOZUi6yra56OHQxmbvWLQ+sJCmHQ+n0a9IzNaZ1tpl6+nJSUUorFdhVGhK8LfM3Bhc6qrqnWZr+OfJ2rgYIkmjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:312::14)
 by MW4PR12MB6754.namprd12.prod.outlook.com (2603:10b6:303:1eb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 20:12:45 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::2881:460d:76e3:c2bd]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::2881:460d:76e3:c2bd%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 20:12:45 +0000
Message-ID: <04d3806d-7d45-4166-917d-7250a2f5456f@amd.com>
Date: Mon, 11 Dec 2023 13:12:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix memory leak in dm_set_writeback()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sherry Yang <sherry.yang@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Roman Li <roman.li@amd.com>,
 Claudio Suarez <cssk@net-c.es>, hongao <hongao@uniontech.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231208095825.1291730-1-harshit.m.mogalapalli@oracle.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20231208095825.1291730-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::23) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:312::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|MW4PR12MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 071ac3c3-351c-426c-ad40-08dbfa8589a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUcMhNH5z6Q+xq/DRvYI1GsptZpfTXj+5JU/V65/IxiRJk8Uaxl/xNoevuxcZxxzwUqC4ROXfJMsce71fSNlVAmiHfPIBCc48h5CVktRwEOT5B7HadeAbChUlrw5FHqmB8+U3FdO6JsylJqFuV3i2mIAKN5MXpTMWfX0dHvm0ysv4bABq1eDtqMBbBny47shevjGgA+lI8gHqlh41msyiJRXdhM0lRVyqElQe5WQvzsjSSNiFOc4C0UgndjLEKZZKeIJIpABKxz/0/AhVlKhHHaddnFdulYJd9pNgRzGCuua+S8oYIxbjG8IgBSa9vxMIRHL+UiF2aC05tnOkd3YR2Lun2LRvignTZ+nwg9eMM4kjMulT/oOM9Q9DdrFF0xpto9mjaIaX0yTfTV06Vpkr23MHxnghWsiKA9zbYj2NDHl5b1TuLB132yX1C3PfXULUAlcw3LGJS8QboaQOxdhnXmApGh+ZkwHWOocT66H5WrqmbDHZq5OGfCVdERODz25k1gt86ROYx89y9LK9mPB9u62xnVumzWJ3cYuoNJzSzdaMn14nREzUV5/IzcmaN8EFyr2Jad8Uus80EjhEctyqpift75aYZ1Cfr0L/SvxBoOB9oBtn9kCCaYg1u/s+PH4vXPCtHXY3aHKlUoXqYYnU/DbMT37FYLkm+xUL1NiiBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(36756003)(53546011)(6506007)(478600001)(2906002)(6666004)(83380400001)(26005)(6512007)(2616005)(6486002)(4326008)(8936002)(8676002)(5660300002)(44832011)(7416002)(921008)(66946007)(110136005)(316002)(38100700002)(31696002)(31686004)(86362001)(66476007)(66556008)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmI5SUh1cm1OM2NqcTVzbWFXdkNpWmtLQ3lvOHdLa0g5YkJBT1dzS0czQTJS?=
 =?utf-8?B?akZFNHBQUitsU1pGeUdWY2xJNE5JNEt0THJIVjlRaTNkdG1wNzNtL2MrVlFl?=
 =?utf-8?B?V1pTYXhRbnlOYUxCV2Rpb2pSQnBhSGZEZ1JCR04zQ3NsV2tGMlNFNkZOQmJv?=
 =?utf-8?B?Y3dWWThPYWdjWmZ1OURUTVY3blJqL3J4eGt1SjhPNDVsdTY4ek1OTTdzd1Jj?=
 =?utf-8?B?U2M5S3poYnNmV1JqaDA0bm9obkt1MURidm9iQUE2UFlsaThjQWhZWS9XTmxU?=
 =?utf-8?B?aE9GYkR0eFg0TGR0T2RRQnBRMFA4cHZ5NzAzVzZ2SG05NlVmOGpmQTJKb0Zh?=
 =?utf-8?B?ZUwydnhDblZvSGJUQTNpUVpmVEU3L0FSSmNUbXNxWFBqWXpJRXZJT3RvR2pU?=
 =?utf-8?B?QTBRN25xWFg5aEtqVHBLRGRiV2s4dkFoYitXb0lhQUpDNWI2NWIyQXNVdXQ0?=
 =?utf-8?B?cEF1YXZHZWphYW1oTW1PZjhqOFlXOXNKbTFjclgzM2hwQ245RVFpM3Rwb01m?=
 =?utf-8?B?cU5DeTFVWnNBdHE2OWJKQ1g1Z1l2VjRhRDB1c2hoeC9yRkVrNXF0ZGdrY1Yv?=
 =?utf-8?B?elU1MlFDMDFJQmpma0dSV0pWL1A0U0J1M1NLQnRKSmR5QzhtK1NqTG9xTUNs?=
 =?utf-8?B?V1RDV1REL2VDS2lrK3VtVnh2dUNoeldtcVZtaWNOKzNkWU90Qkt5T0F4MGRo?=
 =?utf-8?B?b0M4b09pQ3FYQWNxOWt1MXlOdGw5M1dvVUdRcDZsZGlxTzM2aGN6UWFCUVd2?=
 =?utf-8?B?QnQ5cW4remM4ckMwTzRmZGlGU1kvRks2b1AvMkxlQ0d2M25hYTd1MTNLRVNG?=
 =?utf-8?B?akRudjlyWlhaZU1tbndsWG0wR3RZa2JzV1plK1k4M0JhellRS1AySEltUGJu?=
 =?utf-8?B?QlRwUnhjdmI2K0tQN0hkcmJwRFFZRHIxTWl0L3BzVXJnZUFHRnhzaS9IRHRj?=
 =?utf-8?B?ZUlVdW43WDhJY1BWNlRSRitrK2ZTcS9JZ2JCWVFHQStoQXgvYVNlN2dJSmE5?=
 =?utf-8?B?YzFabmk3eWRVVGdjbEcvU3hsdzRkZ2dVV3RDQ0M1aGVadVh1NitpUndNMEtR?=
 =?utf-8?B?V2s0NUQrY1M2ekNWZlgwdUgrd05YRzNUclF4MlVIdUU1b3lNZ2FEbGZrTjlS?=
 =?utf-8?B?T3dXUjVKVnVNeHl3Y1NSajRDdU54eDFwOFFCenRMcE4vWVV1NitYT3pJRnl4?=
 =?utf-8?B?cFY3bklUQWd4ZUVpRk85Z3B0UmpPRjRpUmhpMVl1bUhmVWdFZU5nMG5Pei9x?=
 =?utf-8?B?V1ZBRUJlOXFqdk1acUdmQ24reXQyb1JuMUpQenZ0UThXK2RXVGpoQU50VnNZ?=
 =?utf-8?B?YTFVTXFBdjdxemlIRUlnVFpVNGtOQjhiS0FTd3VrTGl3eWZVUm5adnYzSUxE?=
 =?utf-8?B?L1kyaDh3ZG9GL3J2V2ZkdVVBZUhvYVA2K0NWbHJ5SXE4WTROUWRhK1pGZVR3?=
 =?utf-8?B?cVFvelBEaGQya2ZkaTF1YkZMclNRTVRJL3JkSDU3WnRBRU1nSjgrQWRUYTBy?=
 =?utf-8?B?UmgwS0tXT1A3a1JvTmV1dXRsd1Bkb1dsRkZ1eEJwWlpuRDZ1bW8xZjFtbnhL?=
 =?utf-8?B?MVJlcitVV0RrcFhxVUhOSzlmMFE3Q2FtajUwM3d5WHBHclAvL1BpeHkrTXJO?=
 =?utf-8?B?bGs2ZEg3cW93a0ZLUVhIZmk0WGJ1VEJ3UXlOY1cyalgwRmtmMCtPVUxwdzFk?=
 =?utf-8?B?aGNqSkZPVUlkNmIyK3pqZ2pwVWliazlKb0VtaGcyQjZTVVdhT0EyQUliV2Rq?=
 =?utf-8?B?Z0s0T3R1d3BPQnRxdE9rMkpnTzR3Y055QXhuVUZFelJad0l2TDBIOGtySzVo?=
 =?utf-8?B?b0hqaG5PTmdzdkdvTldlV2FpT2Exc3hXWVhoNGtXZWhBZDNVTW9KekpIWHZZ?=
 =?utf-8?B?bVZqZEJLeC9LSkthT3VTazVNeWFaYnVCZnpzeHpLMUdZL1VXUTlqQVlkMXhT?=
 =?utf-8?B?VW4vc2N6WDQrOEJyQitBbEdKaEwvRVJvV2RaYzVnMVA3VGl6Z25PR29LS21G?=
 =?utf-8?B?clV1ZktUSUFQNFdtZTZYQjJJb0xDVGlYelcrTkRLR1JlYVVJMXJWc2JTZ0Vx?=
 =?utf-8?B?d2kyVG1IcWpSeEdhaEt4amVVZy9sRDhVL0Y1SUVnY0ZlODBSQldFejI1K1pu?=
 =?utf-8?Q?WiLaXQOICKcOYb2a8YqvAy11F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071ac3c3-351c-426c-ad40-08dbfa8589a7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 20:12:45.1811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSQvuIEn5JBwgP2Gm+0hbL+vn3ctFVUD7Kirt2rCVijjN4s3hF1wbnYVWZCwy7AUSuFopJnYfcgsIVggC4j5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6754
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for catching this.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-12-08 02:58, Harshit Mogalapalli wrote:
> 'wb_info' needs to be freed on error paths or it would leak the memory.
> 
> Smatch pointed this out.
> 
> Fixes: c81e13b929df ("drm/amd/display: Hande writeback request from userspace")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis and only compile tested
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index afdcc43ea06c..333995f70239 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8871,12 +8871,14 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>   	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
>   	if (!acrtc) {
>   		DRM_ERROR("no amdgpu_crtc found\n");
> +		kfree(wb_info);
>   		return;
>   	}
>   
>   	afb = to_amdgpu_framebuffer(new_con_state->writeback_job->fb);
>   	if (!afb) {
>   		DRM_ERROR("No amdgpu_framebuffer found\n");
> +		kfree(wb_info);
>   		return;
>   	}
>   
