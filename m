Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBxZDux4qWl77wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:37:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A064A211C7F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 13:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B443F10E2AD;
	Thu,  5 Mar 2026 12:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PDSu1dY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227B10E2AD;
 Thu,  5 Mar 2026 12:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oucvmT0PJ1IVmc19SVgjoDKMP0mrVbfIkgTK80C0XExq2kD7WQJJ10mfXW4IyWaQ29alovw6o8cpBOp7xH4etf18HmXWuFH4TbxzpANkBJEknGGiH7CkU94WT/nGOpvPrs27JSTlEdmgNhAVkpvya+6ydz3v1guuLv31a0q57MDKeZDjK9Fim3McphhQcxQXiE1aknLGYS8EfahkKI8bJ5ddIu7LQqHOiK+tj3gFslpeAxNWmrrilP7/++Wufu0iZBY9sTL0h2VVs0rImv0GQiNNLK1izbxtR2NWwF0lrrGxNPKhWpQwgWXY2w7BhP9yHS/veb5BdflSrcSI1Qffsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqp1+qpBqP+xU1vJJ8tIVExEEa6YHkc2R6ogIYWqK3Y=;
 b=RopKL1df8iLb1b7s2Vvey1IOs3tbPPzzPT1Iq/z3lv/zIMqpSeZ++GOXMLvwGetfN0VenQEslD1nDlSgByGBRlmE0M1shTvuVAvuFMtOY1Jj5Yya9K4FPA8fWGadjBAjVwPpn5crhsF6oAlYd/r17GavSLgJw4lCmZU/mXS/4lzKov871JOAQBfQmJSyc1GF4oWeXIwZXYbhElbjdu8V35Zf+DncKcDtwKGLw7ybTSAZPY4YpJu5PJBod4x3I0zUs+gYpXla1j6lc4blDw0mll4Go9vBNH9kFEq0uoU7qgEWCkP6rAsrUyWgg1pzBJkPaxrU3zteG7wmm5VIZ9OKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqp1+qpBqP+xU1vJJ8tIVExEEa6YHkc2R6ogIYWqK3Y=;
 b=PDSu1dY6QU+MtAybcDBO0TW8wRMVcrQ9MzjMptBiO32EoZeaAnlTjh/0ZwI3o95Psi8GDBX9DJ1pvd3ARTZBPKMNNtI20oFQGJ85Qj/ecUMe5WJhGRwbEjfXvUNwvvaCnZk7I125dMzAsP+e0cCiflyHBnPtiNVc0Ui+mPIMN5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 12:36:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 12:36:51 +0000
Message-ID: <adc93300-9a0a-4969-98d3-a9e2929208a7@amd.com>
Date: Thu, 5 Mar 2026 13:36:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Julian Orth <ju.orth@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>
References: <20260305113734.1309238-1-dev@lankhorst.se>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260305113734.1309238-1-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0670.namprd03.prod.outlook.com
 (2603:10b6:408:10e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af1c4ee-78ee-4906-caa1-08de7ab3dfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: Cte5VIl73vBNyrsexkmNtbcZCt7/P4YdClA4ZZV7UImTQ19pnkw0ab4rnjzeYCuuCUbksC0KsbKYLkQgiU98q6URAwjpFIha/OUPTFpbn+OW//d3A7keI+nyLv9LCv7PuX3/1wnrPP1nsS15YIRrFvhK/RKw8O/r4gqzezXqPhD6N4TBVps1cIZ5NU/Bc7F/85+T95WKkRoJJoKH0LbZJ8LH6f04uODxMbvNohDjGLUu40FnQtuH2LkFBrqOU7XfLmZvwGSknL9arTdSQ17ppnjjI28tJGSDzeHibWu0QWx+SMZkbRAhPoyVRhQ6cKxNhV64xS44eZCgDxfjuy2kVWaH/DD5lnJPwodYIgJRBMFvwde4iDXI5vLq1kJhYQh0hV4vNhFUK/LLKPWxUJdz56PFLD9eLsdo6FZCV8Gme55jyaR+fQ9mbhG354399QX4B0kqEOTod5/tBd7pl/OcUnJXLVoKXSH7Fiwxb2SIlO9gqpsMW1vNv1Y1wzsww8ohKVMqQJWsazDEcguXbkkxv79ElPW66tgqHzv1AjGZ+aLfYF/0rMbmjoyvt2alRsF7sZ/zfl1r8+uCM2D4zvCUD3CuLZ2xR1ebp2ZA+t4AR+nwsvoFaRow19Ei8Q/9V0InWejqvSIO3Ljs+BFDshLawYt2wKfq9Ll7nWKn8RMRsEwgJ/2I24g+m4+2BomqfQ0R4N47Xc0mWzZ3J2fVABETa3zSUvQsOt7oXtPdNWzxFRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UENOYUQrdXRnYjdyMFZ4OTFpbFo1N1Z4UmVXU3liTE9tcElzbEtTaXM3UUsw?=
 =?utf-8?B?aXFOdTgvZDExcWtvMzJ0WUVFTEp5em5DeTZFV2R4L0VRd3lSMm5KRG84UThw?=
 =?utf-8?B?WVNuY0xMclUxQjZ4R3BpY3ZFZTBwWXhTdjdZdDRDYTk4U2d3UFJmQzJPMGZJ?=
 =?utf-8?B?NEVIOEdoYUxlNmpFSTcxcVV0MUhjWkRXUS9EelgwWTdXYUlBNG9mYkhBdFds?=
 =?utf-8?B?bG95ejY5OHlCZWZydzk5K2NmWjdJU1NMZFVSYmJxcFJKdkZMZis2Z0RNSmNz?=
 =?utf-8?B?K01CYkw0SmFSbGp1VS9YUEdXVGlzWGMwZDRWRVhWWlcwTzZxelpjSTEzMDlt?=
 =?utf-8?B?TG1Cd3B4a2NRa2FCSTdWY1hWMHdXUkV2Q2RwWUNyZGlxWk5jTTFQSi9EblZX?=
 =?utf-8?B?b0RhT2xuUnA0TmZFWXorY3J6eFhaKzFvR25JYy9zdHFjS1NBS2IvajRPWUhO?=
 =?utf-8?B?UW9QRUcvRHFPeTFidzM2RkdqSHZQZXZPZ25GNkZMdStSV0Q3eU85dEx6UjFY?=
 =?utf-8?B?dGlmMmJSUS9aNnJtWktTQWtJOUxqR0g0U1ZWS0FYcUt3bUVleWtSRWQvMjRN?=
 =?utf-8?B?c281bWZ4QzVtWDl3Si9zaUpNNmFGbEliTFdLS2tSK3V4RENIWko4dTF5WlNi?=
 =?utf-8?B?Q2RaUWJEYWNuakJ6a3JBMHNLVFl3Q2ZCdml5Q2d3WWdQRmdpRkJvOC9aMFZ3?=
 =?utf-8?B?cEpSTFpWZGVDMCtJMWloYmRvems4U2hjSjkrYklBTDNHaEs5eWY2b1d1amxE?=
 =?utf-8?B?WEFsYnQxTlcwVDRld3Y1RlprMWtmSGtMZ2JOYmdOa1duNG9qcmpxL0ZTSHhq?=
 =?utf-8?B?UkI4UHMwZS9UcHMzdXJqTGhHQ3U5K2FZR1F4UGxoWmxNQnhtSTViS1V0dzEv?=
 =?utf-8?B?ZnJZYnc0VTJUWW5ERFpsVjdaSTJQcXdEWGVFLy84WS9QZ3lDOGozcFlOYnhN?=
 =?utf-8?B?cm9INjZSYmM0OGZtbXdSOWxYbzZ4eCtQZFh0Y3dyWHNHaWhXaWIyRCtLZ3pZ?=
 =?utf-8?B?WWV1U05POFhERnBybk0xMDlHVUlGNE9LYkVGbkhad0NFbUR4dCtaRk9TSjJs?=
 =?utf-8?B?cWx5UDl6SitDOFBNZlBUek1JVmRheUVPNGJYVWVXb3B2Q1lWQnM5dldBdnE4?=
 =?utf-8?B?UlNpZDZsQ2ZTNllMbjZtaEFYY0x3Tk11SUlPSjUwWHZtQzNwVyt4WUVtYlJo?=
 =?utf-8?B?TndmMTZIZGxqTUJyVDZsS1FiaFlrbzFUUGswdGpWR1Q4b2tyMWx1QlpQTVhB?=
 =?utf-8?B?bi9VMXM4OEtRelUrc3VkK3RBOHFURHpGRHpHNDRqcS9JeTZaSXdjSGlCeHZQ?=
 =?utf-8?B?UE01cHZ2NEJZcXFabDEwaHZBc243NjQ1YnU4NHdGam8vRyt2YXozblpOMXph?=
 =?utf-8?B?ckVRNjhoTHp0ZUZpbVNUWndwRG5WL3l0bmZDZzkreWc5OExSMkpxMFJvemlI?=
 =?utf-8?B?QWUzd0lWL1ZzTE5CbzIzTS9panVtaTdzRStNakE1Y2o1TEV0NFJLMGw3NXB5?=
 =?utf-8?B?S2VobDJLM3ZWMU54RFYwaGhWUWZXbzJsYzQzd2oxdmE4YkhmK21YOUQvamJq?=
 =?utf-8?B?RVN5NDhBQUw2ai8xMGlsaklIY3lkbkI4Y3NMVXFIZ2JONnQyZmVmd2dhTDFE?=
 =?utf-8?B?WFVjdDd5d3dzRnREM0UrT1QyQTBoZ0cwL0s3cStFek9jQzZXSUZPSC9UMVVp?=
 =?utf-8?B?YUNHekV1bC93enYrRWJFOWx4MzJzOHNwNE1rVE5TWmJiSFBnYXhyblV2RndR?=
 =?utf-8?B?OXNMb0Y1ZjdNZDJuL3crVDJnd0QzUmQ4V0Nac0l0c1hiWEZkQnNkVWowU2pp?=
 =?utf-8?B?SUV3VDlVUGx5cHYrbzdzMHhlSHV0c3lPczhSZEVDV2czRnJMcmk3em54RDU3?=
 =?utf-8?B?YmJXZCtCVzhaTTdYRXlmT0c5em04QW5jUzhWa1Z0YjhjakI0NHZSS0g2dloz?=
 =?utf-8?B?UlhMYWVLTm1FbE5ieThmWHMrcVF1YmJMRHIvcEFXRTN5MDhLQlNCb0FOYkl2?=
 =?utf-8?B?MzJ3d0FDWHdyZFZyelBwb1lIMGV0UDFMMUNlYVBWQUhTQlQ1Vkl3OGEvU1hT?=
 =?utf-8?B?ek5iVU13YmppNE9vQ0hHUjBFeWt3OEpzcS8wdXB6eTdSY1BIa2pHVVBZUzQw?=
 =?utf-8?B?dzVwL0FmTzR3bmFOUkJ2aDFNa1Zxc2szM1pROEE4a3hycktTR05Ba3FIbWZp?=
 =?utf-8?B?blN3T2R1cGJKdUJRTkdybWtKUURRUVZEWjNYRkpOUWI0Qnl6UFM1QlZjVXl1?=
 =?utf-8?B?MzhIWmdVcG5TeVpzR0hqM3ROZTh2Y1M5Y1hDMTdyUTVHZFVqemJSdXpCZGtW?=
 =?utf-8?Q?O94y8GXHS3S8KnWooK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af1c4ee-78ee-4906-caa1-08de7ab3dfef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:36:51.5669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOkV7vsjtmcv373XJyfmFacTR0QTdK+uq1k0rSmOFOibE8VNGkUa+5OA+TZ4YEAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
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
X-Rspamd-Queue-Id: A064A211C7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[lankhorst.se:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[amd.com:s=selector1];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[dri-devel];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,chromium.org,gmail.com,mailbox.org];
	ARC_ALLOW(0.00)[microsoft.com:s=arcselector10001:i=1];
	NEURAL_SPAM(0.00)[0.084];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,lankhorst.se:email,chromium.org:email]
X-Rspamd-Action: add header
X-Spam: Yes

On 3/5/26 12:37, Maarten Lankhorst wrote:
> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
> 
> The problem occurs when userspace is compiled against new headers
> with new members, but don't correctly initialise those new members.
> 
> This is not a kernel problem, and should be fixed in userspace by
> correctly zero'ing all members.
> 
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Julian Orth <ju.orth@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 49eccb43ce63d..250734dee928e 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  		return drm_syncobj_export_sync_file(file_private, args->handle,
>  						    point, &args->fd);
>  
> -	if (point)
> +	if (args->point)
>  		return -EINVAL;
>  
>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  							  args->handle,
>  							  point);
>  
> -	if (point)
> +	if (args->point)
>  		return -EINVAL;
>  
>  	return drm_syncobj_fd_to_handle(file_private, args->fd,

