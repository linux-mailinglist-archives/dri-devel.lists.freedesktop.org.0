Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H2EAFmcrmldGwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:09:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D3236CE8
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDE210E4CC;
	Mon,  9 Mar 2026 10:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XTZtbrPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDDD10E4CB;
 Mon,  9 Mar 2026 10:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWo+43ioyh87scxBgJaxcnLrRKfiz4E3xxybRMGETxxYZ3qUkbp4Plh9EXOSk0hFok93EsIonVNqVF11M22LX1zqNaXyAB88r6SAo/EyzHzSjPJKxDtTmeZnZCpEeQpiZv7YSoKktsv7LWqUhU477jXb8TttR7cevx2C/vLXKA7RpUo3jv55hvZXttzy79Gf51/Usftrj/BFQBzMv8ox7mx9Y45ZH1calbSmjtWmL6tGfps6kqpTpiRxL1iVPxGTc/K9KZDZafmkQI/Wjg3jzTtLut4BLNmwx+Xnqtb3SDuM/grLHF3ugY2Trr063WpBNK62OmRyYczGmYkPu3DWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06ifmWujZgQph9729qfPF1ifM77xVP6T7nv6Fx32Xcg=;
 b=vj9nQqB8jaZ8wyu8/qoLs9FcZ44QIr0Bp4I/GxgOXSONObVZ8CA6aw3bOlsVKYMzyfqzY74ZUwKgLPcsb+WM3D5VS6pGHOlLVDuVs9qZ/Oz1t5R6KW1b//j+rZ5m0T9L+YdGzV8AOiL2NPaTJjX5nwKu8zgu4lqHaDoXBxK9VhUqQfL6GlzgqEndmughiFTPUSrqcEZFZmBxWA4Z51ZCVDHTZnN9AMRjYQU4SeyZ9Tg/+EogYvtSA0m3kvdsUGqqjH8Q3xGMu6eaJaRo6cbw+HN4Tp+0wC6dqNJFpD8uZVldnAXgl9nBg9GpHoZHviTrrRSiCMpCi8Var5nYcqlCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06ifmWujZgQph9729qfPF1ifM77xVP6T7nv6Fx32Xcg=;
 b=XTZtbrPnGzdalNkcKnDDqwBafDTx3HvJF8xR0VSrJava9matsU25ZBsjjyOkTQQHjRKgPKljLyDf3UN9MXjfqGdoqAMga3QGVPgYIqEbZZ/YOd6broaV0Slg/UDte+iJbzJfBV/5ECfOi1ivt0+GQXF8wRXcXfLGnzCOlSj1DUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 10:09:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 10:09:22 +0000
Message-ID: <dbe6a029-6b81-49da-b13a-6bcc28f1ae78@amd.com>
Date: Mon, 9 Mar 2026 11:09:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: protect queue access in signal IOCTL
To: Chenyuan Mi <chenyuan_mi@163.com>, alexander.deucher@amd.com
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260309022229.63071-1-chenyuan_mi@163.com>
 <20260309022229.63071-3-chenyuan_mi@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309022229.63071-3-chenyuan_mi@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: a60a3e63-f239-4ee2-7daf-08de7dc3ef1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: AxE0jPhCcdLWJRNGlTN5l8D3nWMMnz2qFv4fQZDJwyqHrdSkszELMO1l9h5kS2t04un/rOSP70UWTPbbck4kah0bM16z6zDz/xUNaXVMDtahdI14LiQbaHfXmipSRC0+3QYjj1tY2zW7V0EV5DpqjHx4Fktnz981LO91wG6oVNb3/jHaeUGf0R1GEMI1jwP8SODtb/bC6g2jMIljbsQlimPKjx3OOT2sXsN5A0LGXBbbdjMrWTUvNjnHSG5uIcYaz2XrbiIJIBlgqK0udWmzhGItHn9MnRtseqjPsuLtRwk0+4uemi4TiJPHNbm+GKF78iinQNilebRxTOKzIV6p1sLlRf9fGFQQwF3lwTpFq73SBZUbfmUpAMHcTwmC4piG3zBep3n2Yv+2WBKLuZiVxQKN02Tmd4ifUqIG3d0euZnysjZFDgfWeTZw/9ueh3GM1Csi1e8brP/OG70sNECYubXBhB9Je6BcEpuvDyi60OFz0GjQDn01qFVe/8KPIx01XQ45oZKE2v/9Ej7uMWDG9xhNcNLW8Aq00lXQrz1U/7xrm055hypjeM/IDcSCXCNzio8v7GdpzvcFat8az1I/RNMZP8Bs4xlcqd6iwDhAbVSJO/9LlyIBJCMSdZLnlulmjTQNmee869jJn506GuX2G9rPCKr1Vjpzeum5gn4czZ1nWRkRQUR2LnF4kS3kpkctailwgecBShM6HZVNhvKhZ17d/NaORDAeQZP/lEpeFog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hXNVBHeFdPOElaSXV2L0gzRzhPRUFpN3RtMXQxdEtVTVJpOW5KdFlZRnc1?=
 =?utf-8?B?VEUxOEp4K1d4aUFXbnRGdWdMYUJ2d1NOblNERUJGVUFnZ0dER3NJUEdPUzY4?=
 =?utf-8?B?QllKNTMwVVFmMmowdE9WMDgrM3ZoNWlUYmhjMjAzZlJyVTZkUitZcWcwdkc4?=
 =?utf-8?B?a2dPYXJ0MTFsVjFINmZVWTM4aloxSU1wN2FVam5neCtiOGJ0THJWRExYdWts?=
 =?utf-8?B?WWM3TittMy9YdFRtRnhxbXB0NlA5azN4Zm82YWhKTjFaVWNtc0dwMlZ4Qm50?=
 =?utf-8?B?YVZJUXZIRTJHS0RnZjVXdEZlNTN1U0lSUVpLZEFWOWwvTWJ2elAxSElSWGdn?=
 =?utf-8?B?Yi9pdm1NajRJRnJnZWd0QkxQRlRhS0E3d0RnaHZkK25PZWxCdjl5Z3R2NDl4?=
 =?utf-8?B?WG95bTlpSmdqckl2eTJiYlFCc3BQb1ViN2tPS2YvR0l6NXZQc3V4QWVEa2JS?=
 =?utf-8?B?T0cvUHArNVk0b3RGZ3MzU0ZCRkRPd2xGNCt1WHlrcDFBaTA4d29vQ2pIWUtL?=
 =?utf-8?B?SzgySnN4eS9GTWRMUVBWcWI2ODE2WjFIRDRUOHppRWJPUmYrY2xSTDhTajNh?=
 =?utf-8?B?aHlVQ2c5UkZmTG0wM3FlaDh5OFdvcU5xdGhLaUYrQ1N2M3ZkYUlUS2xudSs3?=
 =?utf-8?B?OUFpMUJ2SWt1RnluNzZ1UlV2QlZCUVp4elpLWTdseE82N0d5V3FqQmJuRHI0?=
 =?utf-8?B?SGhnVHdJby9tQ1Vrbmp2WFpaSGViN2FrNzlJd1dyUHowV2lWUzdUWFNnZnBu?=
 =?utf-8?B?VlBzV2xuK29NVVVHbm1tZTI3NGU5a1ZPYzZWUmdqMGozeS9US2QrUWlKUnV5?=
 =?utf-8?B?d1ZTWDRQOURaUE5UbHJIT0E5MGc4N0JHempyeVFsN0IyanFBS1VvNzNRaWMx?=
 =?utf-8?B?ODNMdzF0d084S1dWNzlHOUZCWDhCSU1oSDVYVFpHamlpMG5JV0JDQ0hCVmRn?=
 =?utf-8?B?RTgzWHZKRFhCMWhESlhHRjZrRkx2TUUydnJUWkM2ZlN5OEphclA3Z1o4TGVM?=
 =?utf-8?B?WmY3dWdJVlZBRHRJLzRjQjRsbjdJOGd6cG1mNDN4UjRYY1hNS2VMcExKL25y?=
 =?utf-8?B?SzVlWWQ2MTkwZy90N3RVeUI3MUpyN2duRjBEOUFaUW00K0dFUjhrTE5pMUNh?=
 =?utf-8?B?OHNJb1UxcHNrK1JUOFozVytOc3dCem5JeHlRY2dtalB0dVJVQUpEL0hMek9w?=
 =?utf-8?B?UXpSZEJ6SUFsNFhZdWFoY21WeThFaDg4WXBSN1RhMWJ0VEhYdmxJYnRhYzBl?=
 =?utf-8?B?M0E0OStRSGNDajlwVis0akczNitFUjNxRDYxZmZVVEpxb1JpQXJETG9zTEM2?=
 =?utf-8?B?Sm1ibUdiZXdPYkMyckVIN1VxdGk3blBPSm4rK0hXcnBFTk9PeG01UFY5VjJF?=
 =?utf-8?B?S3lNbm56eW00UENUWEg3TjdTM1daZ1JGQjBwNFMweVR2QklSZzN1Tk51NEta?=
 =?utf-8?B?UHdVbTR3a3paQ3k0MktBR1JMWXpPQ1pwaGdjZ1R3eU5tbTVWTjVLamZNeEU1?=
 =?utf-8?B?ek5wYytGejV1ckxQZXo3dm1jdnV6R3AwQ0VvY0NpcGZwRStrQS9kNHdTd3FN?=
 =?utf-8?B?blplTW5YeER3VHNaQWVxKzZxSXFxMjRESFhzMUwrR1lncTVMWlJtek1zQ20v?=
 =?utf-8?B?Qy9XR2pYK09xa05NTDFaaUlwMlJYMm5rdEZnTnFneUc4YUJ5SnpDalBvU0lL?=
 =?utf-8?B?MGljeUNYNnpqSXBxNU5YOVUyY0pDUWRPMHAzQjFNWk1HK1FmcUNrbGdsWFho?=
 =?utf-8?B?bWdKZ2lIdmlYT1drV1NVUEhVK1dkNnd4UDRjNUEyY2d3c1MvemttN1dmcGpH?=
 =?utf-8?B?NFdkN0M2azBHYkIzcG1YdWR5TUZpMWkrU0tXcG56WC9Ncnk3MURMdlRHQmlI?=
 =?utf-8?B?cThhS2ZHaGlZY2xORi9idUo2UGp3TkJnOFRUQjlCUkhKRUZ3ZlhneFBlMk5J?=
 =?utf-8?B?bDY1K0xRcjJBdStzeDB3dk1kcnNNYU1GbUEzR1Q4YnJOM0hNeXNzakJ0Njdt?=
 =?utf-8?B?SXF5UUlkd3RFZWxnTVlWWDJhMklrVzhEdm81RFZ3Y0VRSDNmVUtoOEdMU3Rl?=
 =?utf-8?B?VTZKbktPdjVUTnVhUFFTWUpOZGQ1OUluT2hmYk1TaDVQeW5JMk5yaVJhRWlz?=
 =?utf-8?B?WWgzM2lMc0FuQmxkdzlBbVNaUkQ0U0JvUFNzaDh6Y1N3WHpvTDlKRENzOXg0?=
 =?utf-8?B?UUZlMStCZVdpUDlZbElCV2szN0JvUldPQ242dFkyaTFwNGlVeU5qLzVVQUxN?=
 =?utf-8?B?Nlc5ZXZaend5Q2hlb253OVVQbWUxVkhmblFTclBDWm5aTzBQYnRRTkIxZk1T?=
 =?utf-8?Q?jCWFnYO87aayVZywRN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60a3e63-f239-4ee2-7daf-08de7dc3ef1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:09:22.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEDoLV9eqIy4aaLsuQt+otAl9FOITBIWb1donO2zbxjaVadTMMnyNsSwZ0BtMq8z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939
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
X-Rspamd-Queue-Id: 9C8D3236CE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,amd.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,aka.ms:url]
X-Rspamd-Action: no action

On 3/9/26 03:22, Chenyuan Mi wrote:
> [Some people who received this message don't often get email from chenyuan_mi@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> amdgpu_userq_signal_ioctl() retrieves the user queue via xa_load()
> and then dereferences it in amdgpu_userq_fence_read_wptr(),
> amdgpu_userq_fence_create(), and direct queue->last_fence accesses,
> all before userq_mutex is acquired by amdgpu_userq_ensure_ev_fence().
> 
> A concurrent AMDGPU_USERQ_OP_FREE can destroy and free the queue
> in this window, leading to a use-after-free.
> 
> This bug predates the queue-id wait ioctl changes and has been
> present since the original signal/wait ioctl implementation.
> 
> Fix this by moving amdgpu_userq_ensure_ev_fence() before xa_load()

Again that trivially causes a deadlock. So the patch is just not working at all.

Regards,
Christian.

> so that the queue lookup and all subsequent accesses are performed
> under the userq_mutex that ensure_ev_fence acquires. Add the
> necessary mutex_unlock() calls to the error paths between the moved
> ensure_ev_fence and the existing unlock.
> 
> Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chenyuan Mi <chenyuan_mi@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 1785ea7c18fe..7866f583eea4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -545,23 +545,28 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>                 }
>         }
> 
> -       /* Retrieve the user queue */
> +       /* We are here means UQ is active, make sure the eviction fence is valid */
> +       amdgpu_userq_ensure_ev_fence(&fpriv->userq_mgr, &fpriv->evf_mgr);
> +
> +       /* Retrieve the user queue under userq_mutex (held by ensure_ev_fence) */
>         queue = xa_load(&userq_mgr->userq_xa, args->queue_id);
>         if (!queue) {
> +               mutex_unlock(&userq_mgr->userq_mutex);
>                 r = -ENOENT;
>                 goto put_gobj_write;
>         }
> 
>         r = amdgpu_userq_fence_read_wptr(adev, queue, &wptr);
> -       if (r)
> +       if (r) {
> +               mutex_unlock(&userq_mgr->userq_mutex);
>                 goto put_gobj_write;
> +       }
> 
>         r = amdgpu_userq_fence_alloc(&userq_fence);
> -       if (r)
> +       if (r) {
> +               mutex_unlock(&userq_mgr->userq_mutex);
>                 goto put_gobj_write;
> -
> -       /* We are here means UQ is active, make sure the eviction fence is valid */
> -       amdgpu_userq_ensure_ev_fence(&fpriv->userq_mgr, &fpriv->evf_mgr);
> +       }
> 
>         /* Create a new fence */
>         r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
> --
> 2.53.0
> 

