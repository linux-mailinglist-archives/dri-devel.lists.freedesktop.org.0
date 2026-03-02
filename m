Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEvfITh0pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:27:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3801D77A3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635210E050;
	Mon,  2 Mar 2026 11:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FvMrpqL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CA910E050
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:27:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbiC+q7hx8rQU6DpjGJp4Evc3pTqbnafBjdoic+0wI4VPuN3BiuYtV5II8GRunE62BXbx0kcUmkux7HolHHhD2ul4NKa49a8WsJ66tax7AcKAawvLZRsGWQ+TAJeUAZM8T10OMtnzc/m7TK4xkz1HZwrgm4vC7sMQfNwBf8UGYJmt0nyDjl5I+PBGJObN6tvVif6RS1wZkq1SmsY6NLxZ/DkFUgitcynk4jwCnILkQ/MDROBMAYfXsO6/808svJKCg2colqY+EbUz57kRl9yd2SlZOBNbyn67lBiaY8b+SUH5qHqUqV+oHiP4IUz8mkSqsPLyLLn5XfsycxnfjwsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OS6ZyxLz4ORqRnN02MEcBp4vPA/XFpysJoE5yz9VMMQ=;
 b=GYFFTYF8ae7B9NP1WtoRbmBd7LmWCQCCoDsIEPKjgwIdL+mAL8P8w9w6BYxyUEH0mI7eYlsOqAKQRc++WoJ1Kn8vRx/ldKWpIvgYN2LsXFaUVKCLv53yJeXNAk+75wr9u6bW6jSavfy6WgQkFwCx9IENk/HSUA8KfFYJG2Wx1H1/ldcVlrnYxR6HsGv9nU3QdTvkZIhTY39PS7LeG98DlBDZu43WlCuANGmTAf4p7zf3AbPOfIvwQyMAuL5piNkhpMqgUMcDvyfhqzCjgcvWVQb7/sFAV7yrZXPJjeGWgQiNhpDYRzLk/yclet0qH1ye/OlM+Yayi9X6gsLPsmAOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OS6ZyxLz4ORqRnN02MEcBp4vPA/XFpysJoE5yz9VMMQ=;
 b=FvMrpqL4R71S355botQ5sFQrv2rl9k6co++MT/2lpIxTuGaRrb7kZxGIVWcXkhHuSSCG11tj63xQngVKkvpGRK8sx0V1vAoNET8RpubZdCSOfjX9oCH9KlMvOe2ojBPDJm1LFpAwuuUFSFOf5I52lY6X0pSqhF9L2T/JY06n+TU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 11:27:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 11:27:40 +0000
Message-ID: <93f2c5b5-4f5e-46f1-a7f3-c388ab762592@amd.com>
Date: Mon, 2 Mar 2026 12:27:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260301-point-v1-1-21fc5fd98614@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0331.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f64c0b-bbfc-45ac-ebba-08de784eb67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: y5ti6sExB+6ctueFOBRT7MrbPDvexfakEgqh6T8jHWWnX/AT2FOK8hBUVLGX3AC+muxD3WEgVqMPLIFb/xmwr/41uQdiV7hpVim+MjavapbyHrtyX+Pz/yPJKjrMOpC9byGs4lOLnTneSI+WWmyDzark3pgu9WSjRwhkT+LcIrnMJJIjd0Tirp0nvhzGdP+CtQf7G80tj+u9yssgaZ6KUS5cYL9Yc9L08OQ2VGNhNRvH2JLLnFSxdcDivYmIMLXdb8SCxzpnppjTado5M/+6XjP1l8K5Xa+4hNxrIHv0QGycDyF2KqKm4CRLNg07EThaRppdZBgecPUvpF8PC3+NK6CGBTTPsgNYE6pFpMUFbc4Umqvj0ULCdXi7+0RKIct0Dj07qkLwAppIS1z8mHj8xQ3Cj0PE9MgHFgysoH9N29ugSKfmwACQutUvLqdKkwp6FxByXE3Vqbf+NxEFAUAsp7+NUWE4KUY2/AkMdRmDP+7U6M6QKOdChIBvYjdHPWqshRoXyLgVMdRgoEebSQ7zqovERNGV+ex5C64xIoAjh3+PjfhzP0LY7nq5oeI0uBisGjPR+UNxG3OSKwWDi+iHtCRX+FZT1nKlJCkz9qTNvaKaJiVfBxwTN8gY2rD90kIrmRyFzN3AgB40Jv8EZq8MFc2gG6OBpAeaUEtD4lb7NUUICs3hb+rd3b5X14hIxiFilg8T4lDh2fIo/nKZ4nPQGqkEGcLbdf1yK3Z0LIyZxy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjQzcVMrQVBqODNtanRSZHBLVHVJVExlSkluZ0t2eVp3NlFXanFmSm92T2Jl?=
 =?utf-8?B?K2N0R1lnOEdMOEpTM2NycmZ5NjlRNGhmSG1NMVNWaGVIVHdIUlVLUUV3QjZj?=
 =?utf-8?B?dXM3b1NwU3hDbVgzU096L2lkcG9ZRWVOSEd4dlhmSkFsbStpcHNEc21oNkpI?=
 =?utf-8?B?Wkc5aSsrVEhRMG9nUmwwbDJQbUZGWkN1NDVpYXBZVzdBZ2ZCRGhQbWd2cHNo?=
 =?utf-8?B?dkV6NW5ydGRjZlNydTBGWGRzOG5LczFwMFBGOU9mMHo4RFVjRzNScGdLbFlJ?=
 =?utf-8?B?dUxPbHdrL3hrNTA4KytwVnFsRDIyVGd4L08zZW5LbSt5TFpyM1ZOeWtrc0pm?=
 =?utf-8?B?NUkxWmVxWlFyU1JyVi8vYVQrM0cvMlR0TmViZU1yMzFxTUNXelVsWWlJb29t?=
 =?utf-8?B?WS9TZmVRbzVYbGNaYlUzRGtZUEFpVjhadkdFZWVqMFZRdFdIQW1tRXZNcmRo?=
 =?utf-8?B?SFNXczVEbGFZY2pTMkh6dkw2WmNBa1NWS3lneklNNmRldFd5YUpKWFpnREJC?=
 =?utf-8?B?bm1OSXYzQjZmNWhRKzJmUkFUZVMvSEdqYVdnTDZsY1B4VGlMMGJEaVhNWGJK?=
 =?utf-8?B?ZUZvSkJ6eTFuWmxjeU9uYktIODkralp5TGlBNlFXWUE2eW90cDc4eW9zTDNx?=
 =?utf-8?B?Mk9LQVFmU0tWbFRqaE85TVVzdVFKSDkvRnF4OFVHa3JkN1B5QzZjKzNNUC9o?=
 =?utf-8?B?NlluMGdheG5XUkF4M1N5azRRUFhIaGxBOHhobnQzU3F4bUE1ZlpaLzI0RTRr?=
 =?utf-8?B?aHhWVFlycmluRFJjRlBCdkZmSGtSNUJQN3JmTHU1SVVIWFdwNzFoWkF5SndH?=
 =?utf-8?B?QlFWL3ozMGRaME1QWTF0dUQ4eWVaM1dVdGlqTVFsb2tidkF3cU9KSnpHRGVM?=
 =?utf-8?B?OHJmOHVYZXJZd2RHbmlFaVQybUpqbk9xd1p6dUJVUUtpM3FPeUF6bWREREJS?=
 =?utf-8?B?ejFUK1pJdDJBRlhweGFuSUpPT2t6YStvZUdQK1p4SC9XNFY0aC9PVGIvR1RO?=
 =?utf-8?B?TG9rU2Fvb2NNRmU1NFdzWlV0UW5nNFFNbnhjZXNMZElmaHh0cU80QlFBRVU2?=
 =?utf-8?B?dXJyU3FzOXZPekFNSmV5UVY1eVkrSkRIOGtkL3hCN09YTjl1azV3Mm9YdzEw?=
 =?utf-8?B?aUFQSFBOUXg2cVZQY2hTMUtWcHZWdktPMGlTYVhaaGgxRk0yVXBpMCs4d2c4?=
 =?utf-8?B?aUJndXk2YXp3T1ZCdDlUWjljaWdLYzJ4bTE2ZFlRaTZlckF2WVRTa2cxbC9x?=
 =?utf-8?B?ejEyVVdVTVNVaXlEY0JUZUQwQ2FqcEdUQWR4T3JoR0xlQkxWS3ZkQURjYXVU?=
 =?utf-8?B?bGJxR1pGTGc0V3hRNUZwNnZtbUxlZEtkSFNIRC9sa2psZUZpaVRQbm4zVWVG?=
 =?utf-8?B?WDJ0MTIxYjNBZnJmdWdzcytLOHBndXZwRjU2OHdTd1diUDdoNktoZmVSQnRv?=
 =?utf-8?B?Z0d5UmgzZFRZY0tCRW4wZTFBaGlWalJ5NGwybFNMWnNsbVhPdHhQZnEvVUww?=
 =?utf-8?B?LzlTL21jd28wbWNJUDhpMW1xSitQL242NWUvdzRUUjZJWVlGclQwRmduZnFI?=
 =?utf-8?B?U1I2VVVCZkV4c3A0Ynd6MFd5V2JYZFQrbjQwMG05QVFSL3lFWlNoZFYxL2JU?=
 =?utf-8?B?VmVLdytOc3YrWFIwUFhnL2lJR1Z3eTk1WHBId3VrdGtudjZSSHVqWWtwNUti?=
 =?utf-8?B?Y09LaElLTy9rNXE3eU9XWWV6bnVuQzRqSUdrZnFhT29CU2ZrWWFydHQxVVYz?=
 =?utf-8?B?UlAyVUUyN1BuazhpZ2ovTGwyTFJSUklNVVBCNDk4bVArU2poSHFwNmlVaDdl?=
 =?utf-8?B?cXM0Q0R0V1hjV2lQVVBKRDB6dkNLbGNSUnpiblkwRGwvRTkxczlOdTVKZ2xI?=
 =?utf-8?B?RmRuMG5tMllkQVdKZStxcFRVTDhvK1Q1NlhIV2hDQlJQeXpaMVZNL0h1UjI4?=
 =?utf-8?B?dVUwZTIrMUhZQlRuaXJRRnN5blNjMU5SNmkvZkdydHFBckxEWldLOCs4NTN6?=
 =?utf-8?B?bzUzN0NaVWFwOVVyc0xPNks1RkVDcExFeGZJNzB4VjVmam1ZZENkajV1bmlJ?=
 =?utf-8?B?SGpvSU9NbXRTMnZMU2VZbXpFQ2xxK29XbW0yWkhUMktCdkFEOE4xR2cwOEdz?=
 =?utf-8?B?WUhKaVpGbkVHS05FTnNEYkRmaVVsdml6OFVFVCswRFRXZnA0VzlLU0xYZHA4?=
 =?utf-8?B?YzVTZnl5NzlnTllCVW9DMzc4NUVGYS9WQ3UwV0tZejlxUm95WnMwNmt2Wks0?=
 =?utf-8?B?SGpLSHIzVnZtNkZiTHI3Qk1LT21TYUVJZTJnanY0dDdEOG9BZHpHcjYvZTAv?=
 =?utf-8?Q?YBSYzO3EQGMU/OHblT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f64c0b-bbfc-45ac-ebba-08de784eb67f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:27:40.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtNkSsJlCyAaM/kOiF0JqNphmcu2CmUYvUh90OLBlWcdogEywxSPwxXHb/66Dykg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,collabora.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ju.orth@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: BE3801D77A3
X-Rspamd-Action: no action

On 3/1/26 13:34, Julian Orth wrote:
> Consider the following application:
> 
>     #include <fcntl.h>
>     #include <string.h>
>     #include <drm/drm.h>
>     #include <sys/ioctl.h>
> 
>     int main(void) {
>         int fd = open("/dev/dri/renderD128", O_RDWR);
>         struct drm_syncobj_create arg1;
>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>         struct drm_syncobj_handle arg2;
>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>         arg2.handle = arg1.handle;
>         arg2.flags = 0;
>         arg2.fd = 0;
>         arg2.pad = 0;
>         // arg2.point = 0; // userspace is required to set point to 0
>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>     }
> 
> The last ioctl returns EINVAL because args->point is not 0. However,
> userspace developed against older kernel versions is not aware of the
> new point field and might therefore not initialize it.
> 
> The correct check would be
> 
>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>         return -EINVAL;
> 
> However, there might already be userspace that relies on this not
> returning an error as long as point == 0. Therefore use the more lenient
> check.
> 
> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
> Signed-off-by: Julian Orth <ju.orth@gmail.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

As long as nobody objects I'm going to push this to drm-misc-fixes later today.

Thanks,
Christian.

> ---
> This patch fixes a regression that would cause conversions between
> syncobj handles and fds to fail if userspace did not initialize a
> recently-added field to 0.
> ---
>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 250734dee928..49eccb43ce63 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>                 return drm_syncobj_export_sync_file(file_private, args->handle,
>                                                     point, &args->fd);
> 
> -       if (args->point)
> +       if (point)
>                 return -EINVAL;
> 
>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>                                                           args->handle,
>                                                           point);
> 
> -       if (args->point)
> +       if (point)
>                 return -EINVAL;
> 
>         return drm_syncobj_fd_to_handle(file_private, args->fd,
> 
> ---
> base-commit: eb71ab2bf72260054677e348498ba995a057c463
> change-id: 20260301-point-4305b6417f55
> 
> Best regards,
> --
> Julian Orth <ju.orth@gmail.com>
> 

