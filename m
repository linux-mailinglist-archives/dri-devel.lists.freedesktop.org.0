Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706932A337
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 16:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F91C6E0C2;
	Tue,  2 Mar 2021 15:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ACC6E0C2;
 Tue,  2 Mar 2021 15:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+nHPxUHcVtV895KsVS2Tl/5reco8Kq4jngdQpatxU3nc6IRegDGYpqilzr0nN3rqZeiBrMa7zQuIyKWb2MCo1t74jVCCxaZfVxPkYeruyE9CnjgiJPdH6lc3G3gK9nqFcMY46yqOldzr+nKXmoa3+NiXmjaevWRX5sneQhprd0/5ftFCUdMzDZnQcGkM/8tk74jLor42fP9qOKg1Xud0TE2yhTRJVeF3tc6Nevajn2x8pLMUNpxhglBKRVhy4yNWyeVnMUqYYm5gr7Jtf3WV4bhK9Lx7dhym9AKIoN5ydUanI2ZwYOLZPFnkUGWjrT0cG8g/i+/kx3/cyieePY9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhs/2kh4QWEojycmrbvQR9n49jtJ3eV3rratgmup9Go=;
 b=PX0hmyqkd65Xuj3gY+ciIEhgqobiElGJsFUZA5tRFwxxeHrzxIXiakkWnCwz8iaK9OolVnWhCnztLhuzNBOBlRIGXL4eWZYy4jFOiTP01FN/noiXgi9CqBi9AZemVmJ32LtyYnchKQjY/lBgyUxCmgzNaolYA9a0qM4S4VwpmpXGZxvM4cSdzXq8eugvxdKMJ4OFNioH86Bz3NWe666ZdX19de9NdBYchFoMk+td+p6cRpF9TaSapNBvLqEZUxf7jq+2Ua2O213Cyk91PtvDF0WMLLFveRKpWIjhTeLdmNfZMleU0HdyslKDFymS8n23I2/paF8DnH4u8ItEVADU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhs/2kh4QWEojycmrbvQR9n49jtJ3eV3rratgmup9Go=;
 b=db3CeuCO+s/Z/YWzBBNSP6ozUTltaiB/xYDynTIiHhcJUDp/ZmYkLiUfwA7DGm6moGA0lwgVEN6bNagWUcxYwUm4ZSWwNeinS7WHedy/AiT+k8eKki0Pwun8y7mhARAckbPFyqFj+c1smzokbonwFHzHV8CE26+HbXZwiYPF2bY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2540.namprd12.prod.outlook.com (2603:10b6:907:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 15:03:17 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3912.017; Tue, 2 Mar 2021
 15:03:17 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix the return of the
 uninitialized value in ret
To: Colin King <colin.king@canonical.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Anson Jacob <Anson.Jacob@amd.com>, Mikita Lipski <Mikita.Lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210302140509.8466-1-colin.king@canonical.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <b9a11c62-f469-8f5b-9585-74b73cd5a9db@amd.com>
Date: Tue, 2 Mar 2021 10:03:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210302140509.8466-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Tue, 2 Mar 2021 15:03:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb1dce5e-9fe8-46bc-5f32-08d8dd8c4f5f
X-MS-TrafficTypeDiagnostic: MW2PR12MB2540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2540BACE034BF77F073FCFB98C999@MW2PR12MB2540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T8jXZkuocYpUw/NYKWP1XnWMLhHwT9yOO845A/bB9FN2nD3jvmKoZLugHxNMwEx1ZwnYe949P6+JH6s/NVxA1XIUQaMC+akTB9thCfIJBQBgkFhBAI3/+It+txYnvF1tC5vAfajyU8Rc52u7jDInk78tU05fZlmlV1JdpnUkOn8DgCXMdTStF4cbEf77iCym+bjErsv3LaTqaHYZj185jGx8C5WlljYudRrYZxOellZvJGjANym97Q9sGE6bYfhM2DEm3kFKCY4xVp4I0yjvGRPkE9In8lqsW0Q/MsNup1OGPepcZh5m8XdV9PPdT3fm43exeWoIdNrbSlLCMyezNJ6/WYTG9Bq4iXkxSV0fyFznAIQ4wu2VEEJklrfRjT8cnw3vmt8glVsyoITFuvYTg5aOcewDHA5ySHDnDBl8BJgu7C5KBcCXCxtzWq0FZIXpOXstdqjfjsxYyBs08Veplt9GKsIOnWqGjfeWBL0I4sif1EulvWrhnRwaFY5x7FRb9Fu4o20n//4l2y/biRTKXqcuo4m213Xj9IAv5y8OCkKpjHQfnoXohWS2ktLcviH2iZ0sfQTWeGdMFDBlzTjmVx6v7VkH4OujCOa1aNa6pq//uscvHtgVylQaJVGdEtca
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(5660300002)(16576012)(6486002)(44832011)(8676002)(316002)(478600001)(31686004)(8936002)(16526019)(66556008)(921005)(956004)(36756003)(26005)(83380400001)(2906002)(52116002)(86362001)(53546011)(186003)(2616005)(4326008)(66946007)(31696002)(66476007)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWhTc3krMUZWWDcxVkRDMk5BancyQkU0bW1sRVlUckI4YW80eGJYQnRzaHkx?=
 =?utf-8?B?RWVMcFNjeHorVEFKaWJmVjBVK1BoVWJtQ3VPVU15L0czK2t5OGkzeGcvZmZO?=
 =?utf-8?B?S1VmMWtXMk04dWlmT2NGZHZhamtSSXYvR2gxaUdxM0VnbkM5ZDZ6aVJRU0hp?=
 =?utf-8?B?SE9VdSsvSWpGQTRsMEZWbis5Uk5MekxlMGhoNHcwMWw1NFlldHJjYkh1NHJJ?=
 =?utf-8?B?N0VZOVNyTWU0Ujlaa1ZEUk1Wbmxlclo4dmg4NGVCZzdrbFlhbVFoTzVaaFMx?=
 =?utf-8?B?N3gzRlc5MVJnRW40N0xta1ZVcGs0TFlJNnhYZ0dxdmRLQjZudkhMaFhWUDE0?=
 =?utf-8?B?S0NKb2FKOEptRDBOcHoxR2ZjOUtWOExnclpqWUg4STUySjVGVlp4S2hiYzAw?=
 =?utf-8?B?d3cyeTJ4Z1czakdaWGkrR2l3cFZnTk0yc2JnZjk4YUFBdEw0QWZ2eXZjZ2Z0?=
 =?utf-8?B?UjduTlVnSlhlMkp0MEsrcmYzQnYwdHdWMkNsODAvY21mUHF1VnY4Q3BzYzNJ?=
 =?utf-8?B?MTZ1SW5OMzBZeDBoenpiUUdQck9GbG0xTWh5c0dTTS84RExXU1AyUXAyWVhV?=
 =?utf-8?B?M1JZSWhKUjlsNjdLOTN5bDVmeWhRNTRKcERSVFJoZG94dEFPOVJWaGltWC9Y?=
 =?utf-8?B?TnFSeDhuVk1qN2s3T0lweEU2M1M3WUMvNzBPQ1F3czk1RmNsODRMMHZKb0NE?=
 =?utf-8?B?Mis5Q01jNnliSGs0ZmlOSzk1VG1GWGx2RWg2MHBXUFBaWWtUTGd2R2ZMU0RL?=
 =?utf-8?B?UXNSekFiWHRaYUlvOG9EU3JUaGxBcmVHaVN4VjgwVjNZMitFRUtxUjRUL2l6?=
 =?utf-8?B?Ym0rRUZPSmo3dXdxMVdqQU55SjFCdkY4RG9iRmFsb05WaHZScmMxS0xnaFdE?=
 =?utf-8?B?MEFlNDI0WEpCUFJZRHpHOUhBSmh5MGNtbFJxaFF1TnpzV2Nsa3VVcXBwSzlZ?=
 =?utf-8?B?Z1RnZVRwbzMwcjRCNzlEMXdsQThwWUUwRVFxb2Zod09LSnBtQW5oWUx0ZEN6?=
 =?utf-8?B?bkhDR3hvZGZUUkU4dzE1T1BYLzMwQlQ3cXZ3aDhpU1RzVEZsQXhZSnIwOTc0?=
 =?utf-8?B?OGYyUm04bVo4L1lLWUxnQmpwYU1OYW1DeDdWQmxjMWV1UDFicDR5Ujk3VnVp?=
 =?utf-8?B?YXo0cGZhL0dSSHVaRk1uNytOUTBSM29SRVdiUE5mVnpjbE5RcGV5ZWYvV1lS?=
 =?utf-8?B?R0ZZd1NHdlluTm5vb2VkTndLL3JtL2xpUFZJMXp1T3VOZ0htQU9jdnR3VHdY?=
 =?utf-8?B?QlFVSFVTYk5pV3ZwWXczQ28vb1FhZVd6R2R2aG81NjUxZU8zMjVuUzBFYnZr?=
 =?utf-8?B?S3FBeERPK1AvNExMV0tzWHlPZUNUczYxQ1RGdE9lZUJTaE1iS1c1anM0V3N2?=
 =?utf-8?B?SHBlVVVwZW1lN3RlVHNrY2RvYUh3ZlBPaHBtTE1xOHVtZXFWN0U5MkZQeitF?=
 =?utf-8?B?cVZENldYSE4xOWVtS2JwREZ4eEx5cC8rMU1nQ0J1aUdIVGJRUzJPWFdpY25p?=
 =?utf-8?B?VU56RnlGOW5RdmpraEJVc1ZqdmN6TFFaemFWQ25pQW5VQ3Brb21FSDlTWmQ5?=
 =?utf-8?B?UE1jSVFGZnV0ZGNNaFVVRk5TcXRIVGgxZGtVTGZmaGJjWVIrRUNGSTcwZFRN?=
 =?utf-8?B?ZG9VY0NiclBrSnpRQkNhTysyR3Fkb0RYU1JOV3gvblhZbnpXVHNDazNheGdT?=
 =?utf-8?B?Vkk2YXZTQWVFYzhhbnQ2bjJQRjc5T25CakF1M1o2Wm5PY1E0eUJuSmVSeHpX?=
 =?utf-8?Q?DTLXfr+SjFEuSUqhxFRnute/uMPKyi1mwgKV6hs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1dce5e-9fe8-46bc-5f32-08d8dd8c4f5f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 15:03:17.2035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc0XOq0cG++lM7lvkZjChzy7aUxvGrpBPPCITK8Q94qRn9UxbCMuVeKWqpGS50d3b8lZyA3oM1RRBV0gbsKmdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2540
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-02 9:05 a.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if stream->signal is neither SIGNAL_TYPE_DISPLAY_PORT_MST or
> SIGNAL_TYPE_DISPLAY_PORT then variable ret is uninitialized and this is
> checked for > 0 at the end of the function.  Ret should be initialized,
> I believe setting it to zero is a correct default.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: bd0c064c161c ("drm/amd/display: Add return code instead of boolean for future use")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 5159399f8239..5750818db8f6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -530,7 +530,7 @@ bool dm_helpers_dp_write_dsc_enable(
>   {
>   	uint8_t enable_dsc = enable ? 1 : 0;
>   	struct amdgpu_dm_connector *aconnector;
> -	uint8_t ret;
> +	uint8_t ret = 0;
>   
>   	if (!stream)
>   		return false;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
