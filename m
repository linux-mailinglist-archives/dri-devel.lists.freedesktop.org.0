Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD724B66C0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 09:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8220089F75;
	Tue, 15 Feb 2022 08:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2C789E5A;
 Tue, 15 Feb 2022 08:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXNIhFOE4+JldicQ3HQFZgvENNihF4cOKZMJpromugLdVana8N3cUYWJKBMovnYiJMJ5D5fZQlZXuzhSkrwqEayLMTs9z3mv44XNwbzbyJf1D94q6duCudt8mUjiREIEuaaUSKHLd8bUH2qVotzye6NUR1mGUz/mN3YGM29Bvz7RGvfxtz7oaLN6PqqiNjZQrPYMoqOdTxZnMPwwY6JVNLIU4IuU/sL9ljyALNPyFu2e/QXu+HtB8YKAny8Hm4jM1gVwqwunHYDR3g3GTQtOdAd5/CkYxsOonPVTkz8LLF0yUa3PYANbtwA2nvLRT6gx84wq/D3EWsZ6WwlNRlPYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTTWqNZa5K27zov5W9P1kpMttGqaAKrAJB4uB/gtecA=;
 b=MswqnFg7mphQrRSZ4SKFJX1QcN/hesane3tvTJRlGd2cs0Po7blpH+juOKFAWGLOztDvQtIOV3aKeNoSIjzu28tBbFljTvXadCXti58sAys9Di4bT6fxzVXbzsWch1I1tc6KltlvWf7lXoXDkch2X8tOk+a2mF2cRjD2sR7QFqALQUyvpK+Zjn3jnTQ07JlVtpnJpURbcubbNabM42HWKqI6O9YD19BM7Wmge68J3r7ACjDrPQX47B4o2tNgP6jIJg8x1Ia6PQT0gZjXoVZxqq4oS6duNoCR2jjdZob6ipZ2jnrHYCzOTGoHx7vAmSDOYPzlDB8teGUAxo0EEaJyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTTWqNZa5K27zov5W9P1kpMttGqaAKrAJB4uB/gtecA=;
 b=GXHr9pYtgIwawyx0e6EcqyyMJlKUNujUJVtpn0VWu0az2fftqRvwUNoU412hAl0JzSQmORFwagVW/w2X/qTueSTJtNCgOeFVW5vXMKGVaZhHEkTqyOiqa0T4OYqUnuwUQhyv/wwUL+Uty+V0iH6klmeQv3zsfqt18d1OhocgbeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 08:58:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:58:23 +0000
Message-ID: <85da792e-d3c7-689f-e56a-9ec2cd7d9464@amd.com>
Date: Tue, 15 Feb 2022 09:58:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] amdgpu: assign adev after null check
Content-Language: en-US
To: Qing Wang <wangqing@vivo.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1644890361-65071-1-git-send-email-wangqing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1644890361-65071-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0027.eurprd03.prod.outlook.com
 (2603:10a6:206:14::40) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 159a936c-910e-4093-dfa0-08d9f06151f7
X-MS-TrafficTypeDiagnostic: DM6PR12MB4201:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42017F5CF18E12729A10ACB583349@DM6PR12MB4201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkvKqI/29jviREQL+4t1axOlyeWCoOlO+/VOEKw7KB0oRpxMODCsdyDqofvMrlvey5uf75zp5mSOTh+qhjds6OD7jAAYzsgTUr5Xi2AUuWbTeVbzApNuEcfk2Np64pLxRhsx/4qqwbBy6JkMGaJGXwCJjaXkl8MP1NtktOfZEbbryVU7LCD3dQ4raIiXnlpMOPVQNTbEnjKUG43/OKI25O8YAIULQc43ibTJeQ2nWmYcD4JMJZwKHPQn+CdmEFFEJubfazNX04uihvOmul4k/ANNIxs9GJdFnLEi8hhxsoKSFCSFxqRBzYESDVUgyEN7UnFhnNnJs03g4Z8BNuS9gst+VIH0WoZsJpFk44f8k3wzNL3+2qXJVCS9JHxI4zvNDw5IRGxUGzNXWjheC+T3CZV5yyK+lcuXLym9N9pZPc1p+uqofF4RfPQOIUxMux9HLg7ULdZszcXNuj3FDOE4kuRVCHd9MEefCgfoKD1WTef7a1bpsToB9XHTsAkBS3F81v9TJqrgUnlngGt+qNbQBXyL8G68iX+sPuDq/0CtF6HMK18aZpz3VMg2LJjgiMDIv3xyDXoyS9So+E+MruZnqgHPkbUe4YAHKW7UwqDgEMeWvwGqyKOKdP3J+xJ12m8RF7GYH7LKGO33v79quR05ecVdZ07GtHwOCZYT1liNKBKEVVSjtbv1mqxB3LQx2oo3rxtE2Vemvn6Memh1XKXwudd+bYMaY9rQTLz8Ij8lztI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(31696002)(83380400001)(31686004)(86362001)(5660300002)(6506007)(6666004)(36756003)(110136005)(2616005)(66556008)(66476007)(38100700002)(2906002)(508600001)(186003)(6512007)(316002)(8676002)(6486002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxWMXowcXkrL3EzVFg4L25SbXNSUWJlMlZyOXlwVzVTK3A1VmROVVcxNVNz?=
 =?utf-8?B?dU83M3d5RmVvVE1kK05SK21OSWR5NytvcndUSlF3YlM5UHE4YXNPbEVQc3g2?=
 =?utf-8?B?SENIS2w1c0JhdS8vbktCd1hwNVR0YkxiWFJERkpGUzVKcGZXTFMvd3g4OXAw?=
 =?utf-8?B?YVNKY01HRFROSHYyNURjMFJFWjhSbjZjbXkxZlhMOUtHaGFjQWJwTDE1aENI?=
 =?utf-8?B?UlY4WTU2cVBTZ1R4RmN2d2dwSGZuSHBRRXlocWorSkRNbUJrSWljNlVvMFBE?=
 =?utf-8?B?REdMV1NOTGtwcVJzYkRJSkU3NHhwSEFUSUJmQi9ZNkZFY1BhcVhQM292b2N6?=
 =?utf-8?B?bXFIY3hsbFRIeXUzdVlXNElNQmY0Tk5Ka0xtOTBHL1Q3RFpndkM5bTk3aVdo?=
 =?utf-8?B?RC9HVzVCVGRnTW5ETWNYM1V2TFI4WWNmUWVRdlc0S1htemNNNVQxWEtJY2lm?=
 =?utf-8?B?allWd01KdlBxaW1iYlpZRko4MEtLOTlFSGR5SlpiRENJQk12UllDSXdFTVpI?=
 =?utf-8?B?dUxMdGNwQkRzanZjVXo1VHJrb3BWblZUb3BuVHV4aUYrLytMTEh6L0psTCs1?=
 =?utf-8?B?REdsdEcxajVpcnlwSk9pRGQ0bk1uZzF0KysrM05nUHNCWnhjVnAzWXM0clEv?=
 =?utf-8?B?U1g4d1laU3VBdkl5UXlsNStzUU5zMUNmVERFWkl6ZjFJMDRoMUZZZUtFT2dw?=
 =?utf-8?B?b2x1Ni8zclJQamJQcXJ4RS9tbTBxLzBsdmtlaHpUUzlXbUNNbHNLdEptUm5R?=
 =?utf-8?B?SGdCR1BaRnd6RTB4VXFJQTk2KzJsWGVGRFU5WHFCcGwxcVI0cU8rN3BkUFVP?=
 =?utf-8?B?Vzl6N2g4cHl4Rk03eWdLcGRDRmJxNjFsZXQzQUN6Rk9sS21nM0FrQS9pMXFt?=
 =?utf-8?B?KzdMSWVodWdYWi9nUFIxSzJOQnN0TFIrQW1iTmkrYjJOVGcrbnFPeVdLckZp?=
 =?utf-8?B?TE1vYVVRb25qTG1MeXNvZXlZbEpwY3dIV1J4N05YQkRGTUFwOGJ4QklrWWR1?=
 =?utf-8?B?MDdZMGJnUU1oM2hJbXRpZFlHR3dTZEVJaTNRcDJCSUJQcjlEMHFUZXBUaDRH?=
 =?utf-8?B?STN0MnRtMDdwdDk0akkyZHR0V29SYS8vejI2ZmpBK2M1VW9HUXZldHF3UmZ5?=
 =?utf-8?B?V20wY1M3VU9hSFR6VlRmL0NsN1UwbmpPT1FtRUNndmFqclpFbjFneHVMallx?=
 =?utf-8?B?Tkl6WUh2MUFMRG1vcTkxMHlDMmdQNUphQ09OSXlrUW81TzUxQ3k5UHpxWW4y?=
 =?utf-8?B?OUlickMyVi9wNVFUVTRlRm9IZ2xraXY0ODVQSlNkUi9iMm4rTG5sRTE3TlVR?=
 =?utf-8?B?d2hTVVRNTVpQMzdFdjk4NkFDMmZtdTdYc3RLbGJabklPODIwYlpWUTFEQ1FE?=
 =?utf-8?B?OUJxdXhybzFJaVFkRUk1alRpMC9TVXdRQWwrN1A1TG40UERZUjIyYUxSalR5?=
 =?utf-8?B?amxyMGhVL1VPVlc0eFZ4L1lQMVdCVkxNdHBXTm9TVmJ6YXVUcm03S2xvMnhN?=
 =?utf-8?B?dFhwaWFJREpTN1RaYlZRbEFac01JdUFpaUtBeGo0NEZTa3RTaVhRVU1HTFV5?=
 =?utf-8?B?VWhiaGs1MUs3ZHpFRS9lTUlLSmFZN0I1K1JUejVacmRKRm5Ddlo2QWhrQVZK?=
 =?utf-8?B?dVRlMWdIZGltejF2WGNpV01YZWtHc1dnZ1lEcUJHdi9mUk54VjY0SnJDSkdS?=
 =?utf-8?B?OVVmQk5yZi8xMUZwT3ZMdVNiWHdhSnFuWVpheW40TnU2Z0FmSHNpL1BUNG9E?=
 =?utf-8?B?cWxZSkRmeHRUb3p4aHRkOWNwTXdwQWJQd3RXSEsxb2RxazRKNzFsRjlVWXBC?=
 =?utf-8?B?V1IrL3V1ZndqUS9oNUhhZlMvZDU1QXNZT0NHamh2NWxwWDNDSklWN2F0S3ZW?=
 =?utf-8?B?N28yMDdCQTNEQlR0SStMb2NDdTNobCt0TXQ1SG1CZTQzNUlvYjQyaC9HUUlZ?=
 =?utf-8?B?U1FmazNZWUZWQmF3Z2wvNWRYSVhJbzVseGxaWnJqQ3I4c1Q4VXpqUml6M1hs?=
 =?utf-8?B?QzRQbjBTcUJEeDdkQWgvcGlVdDZnd1FYci9Hb1NmWmk2amxoQVZWUEdhU2Zm?=
 =?utf-8?B?R1RtbldnQllFbFh0NXNabnRCaEJCTXBqc3F0K2UrYW12Z0JRZVhXUXZ1QXpx?=
 =?utf-8?B?SUZNQXNpWFFBdDZxcEZsb2lBZ2U1bVMxYkJhT2twTldDcVZnZjYzbGtBYWVZ?=
 =?utf-8?Q?zMATRX67C/hVYxVnrU+RGU8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159a936c-910e-4093-dfa0-08d9f06151f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 08:58:23.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4K0qwjUeTkZxLPPm+v0t7+ac6ZKqrqDwmUNoxZk/yy/fkm1cW0wnQH4T0YXLwsa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.22 um 02:59 schrieb Qing Wang:
> From: Wang Qing <wangqing@vivo.com>
>
> adev should be assigned after a null check

I would rather remove the NULL check altogether.

The caller is supposed to make sure that the context is valid and even 
if it isn't that's not a recoverable error here.

Regards,
Christian.

>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index 2c929fa..da114f7
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -259,12 +259,13 @@ static void amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
>   static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
>   					u32 *stable_pstate)
>   {
> -	struct amdgpu_device *adev = ctx->adev;
> +	struct amdgpu_device *adev;
>   	enum amd_dpm_forced_level current_level;
>   
>   	if (!ctx)
>   		return -EINVAL;
>   
> +	adev = ctx->adev;
>   	current_level = amdgpu_dpm_get_performance_level(adev);
>   
>   	switch (current_level) {
> @@ -290,13 +291,14 @@ static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
>   static int amdgpu_ctx_set_stable_pstate(struct amdgpu_ctx *ctx,
>   					u32 stable_pstate)
>   {
> -	struct amdgpu_device *adev = ctx->adev;
> +	struct amdgpu_device *adev;
>   	enum amd_dpm_forced_level level;
>   	int r;
>   
>   	if (!ctx)
>   		return -EINVAL;
>   
> +	adev = ctx->adev;
>   	mutex_lock(&adev->pm.stable_pstate_ctx_lock);
>   	if (adev->pm.stable_pstate_ctx && adev->pm.stable_pstate_ctx != ctx) {
>   		r = -EBUSY;

