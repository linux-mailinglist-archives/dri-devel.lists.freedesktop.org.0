Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNi9BvelrmkFHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:50:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1D82375D2
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172F510E108;
	Mon,  9 Mar 2026 10:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b9s8IUbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A1010E108
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMt+0DsphEwC6VfKO5co5BDF4X/s1ttlRa3P+53qKl2R1cs/Pr+NrDtYbhJw8cTtf9BnzZY9+UR4wFcbiQ8nZoMX18u8FD/RiACoa5BrduJaO46LVH2aLR5po98yElhE0WSRcDudk5HupCEAnduMC34QSMBUoysCVy8wCVAnteepk1s8weyFig2ZmY9TccKmJCal0WzTav4Nt9T2jKFY+Glafj9GfFN/h5HYiHKiTYNqzDMVWClacpDTe18W3UpDlgv8wCawsdfK1wWaVCEiYTU+LrAK9LOZ7zewL9xuqDBvrnVwoHgP9obwAtyGgzJzs7mtfnjrJCUDkmRtFJ5YlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZwATAmbWFScAU3NB5X0ggdqK3qt6bUwn7QC4bFfR5M=;
 b=CBr0V+sv8jmO5qjFx0DS/Cwa+rlQHTRQbIgtxKILuvpmAA58VALBEdqGc7heqovQP+kLJgR4PAqSkPwc+q3YwegODfC/uiwsNn9GKvpXyX1oAFK8Soq4AuH2BhSTeZ8q365ZBKAFJOh51N8WnqQjfcgNxRahvjTlDiTQFPFs1Mg0ZA/GJRb10iNla59AJ+aOVdao/6RrrmwwyArDd5I/7WNmwGJpnRUUWan+Rb0ZGX6uSH9ZXJdfUpQE7hULfdfu+GZeeTfpKIHzFiMdF8eWqrQQwqzhtA68rrK4e0+HC0cET56rhyrekbewoQU+zT7/fZoYVGwsGKV1zwJrGNJCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZwATAmbWFScAU3NB5X0ggdqK3qt6bUwn7QC4bFfR5M=;
 b=b9s8IUbt4h55CFkQmjUlbjwTI634NW/wtypxg5VZjsJkJZSIOPob7TVDrQOvu7pdla8IIZ62HD6dXBnRMSSHxjEJk8ydLm1XP4U6ZM41HArTGJ1pMNkG9aEu35W2dYGtVFiC91YBX1id0aYm5xSVrkl7xdE1Kum53uFRzEYSsOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6823.namprd12.prod.outlook.com (2603:10b6:806:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:50:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 10:50:23 +0000
Message-ID: <bd0bcaeb-0a0f-4415-b964-ea1d5219b671@amd.com>
Date: Mon, 9 Mar 2026 11:50:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix the "done_fence is initialized"
 detection logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20260309103053.211415-1-boris.brezillon@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309103053.211415-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e16cd76-282f-4902-170f-08de7dc9aa14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: qzJSRs8DKa9NIDKopz1/jJubY0Ud/lr5dTMVbR/ZctGq6GXLBUahzf1PL7xvVjNuWFpoBBKZTn0RpxxfwU30jK6u9hINuSxI1Mbp6ydmVhsXDb/sDAxNUIg+PvDdl+dkcQKWWJ77xBxtVKmqV3ZIAsCKCj83LJzbPb3STMaYkHawmlzy4S7LAMhOBT1N7wbouXyZaAxsYsN1Im9+HFxDKd/rPxFk79QG69vcy12BdltwJJy61XSIHMX/Ls4rObdH6KdO9mkQHWkl37zdAiSvXBh9VKTDqKKO8cME/MIBHQokDO61I1Yx1lfWrtPoxK0TyRLtX14BgsAiN8sx/pVoa3RfYVV6/5/8u3d5rRh2V7PTWq4v520vnTeq/5FW40IZUHUJcfLfH/qLT1q/YHoD2lo5KauRxWvz0m6Hmy1kYZYSK7KI/Fa/2RDAshpQYPaBRLlAhqw1WmwOHH5Cr5wvCV1aDT7mb0E4ckRL6d8wCECqKQ1JIfr8p5Gyanmy8TP+taLbff3lb07LFqrp9WFpwsD7Ti13A8ScOni+SzqNIrSbrumnp2A5sIFDvBKEVHjwio0IkgD6Yg31LGlJhkG8t2zOAKlXVUx0rYIgw92OThKMitoYQFqHtukzVlWz8tHV/nNQQvpDgRlhH/jF4nRSkzCNcCW4PoQfcBgR41J5Frw7b9oIjyV5RA0BgpDyQvsN5aYANdP7lYpfKu4Ykm3sJbgqShrXIrxmZpFjeX0CQhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDlkbmJ2Wno0QnA5MDNIaVZIdmZiSnpWUmIzU044VGhlekxSMCt3QlJENnFR?=
 =?utf-8?B?bWhQZC8wUkV0UzhtNzdpRlJEMjk2VXB6UVpCNFJhWE5McGx6U3VHVkJQTDBF?=
 =?utf-8?B?WmMyVmwrZkZrMFlnRmRCM2VIN1R5UmxGTGNKMytkY1Q3bkoxR1FxWTdJclJY?=
 =?utf-8?B?K3pPckpWQ0drdHQzbWVDWUpKalJSaS9obUtIOWpRRmJ6dEtRVFBPclh0b2hL?=
 =?utf-8?B?NEFYYklXekQyWHZ2YXZmSnRnc3lXTlE4NndqK3YxZFFHWi9vbG1CY2VVZ2g4?=
 =?utf-8?B?Z201bFZyTU5JUXo5U3lFaFB1Nnd0RjByd2M3QzM1aWo5SVhWUHZLUUJ2b01O?=
 =?utf-8?B?dlRIeUM3TVlMalEwSkNmeWZwcHBLdHdMU0ZWQUNWVkJNQUFQSlAzZ2dFOUQz?=
 =?utf-8?B?bzVUa2NrZTQzcmw5ai9KL3BseTdSYm1YeEFMOEY5ZGZrUFJMZDNIVE00MzJO?=
 =?utf-8?B?VEh3VW1HMVpweVV1YVYxUVc4R2M0MFdQaUViY2ZnRG0wN1BVMEsrWFpoR01C?=
 =?utf-8?B?OE81TlpIeFN5eTNLU1lnU1JnZ0hNY1ZlWTFNN2FpRmlRSnZYL2dlNFFWQUpZ?=
 =?utf-8?B?UWFVSmd2c0RGQlZzbUJpWXNvWmg1MTFienhjTHc3b2hDUUIyYVR4cFZoQWhl?=
 =?utf-8?B?cWp0RTZLbjQvc0YzeVBqandDaEhHOCtLK3NweU5kSmtmL0FrbGFsb1U3L2Er?=
 =?utf-8?B?RjBYOE1PN0E5L0RlZkp1UDdmVDlkOFFtcDVaTE5SVjU5aFlPbXFmVWtnSkNq?=
 =?utf-8?B?RVJHTjFJbW5PblhJcnk4UUxKU3ZYNHQ4cmdaVjNsVXdhWDJybzVpdytTU2xD?=
 =?utf-8?B?QWE2Q3BEampvekVkdzl2ZlBMUjNmZzFLcHU1ZVNkWktqMGtoRHlnbjVsSDJJ?=
 =?utf-8?B?SzRwbFpqT1VOWEMvaU43TzZiZkFNMmtxVVpOWjlWRnJ6akxpWWV6Y2M1czlF?=
 =?utf-8?B?VWtwbmp1MStSazNRV2R5TnBoM3NaRkVPbEQ3aW9sazlndnVMKzdPR0NtaWQ5?=
 =?utf-8?B?bUt2ODdzWm9yYXBFV0pUMXBzU0p0RmpicnhpQUhHb1BHeUVZTGIyZWZXWHVX?=
 =?utf-8?B?cnZHcUhjZlJjWCtpMDVtMEJIWVpFaU0yZ1NXQ1FIclRTczUvazdBZEJxdHdY?=
 =?utf-8?B?WHZBN1ZtSFMwL1JUb3pwSDNWd3R3aWYxNlVCQWFCREE5YSt4M1hjRnRHS1RK?=
 =?utf-8?B?ZHFUalJQK3dzaXBFYnF3SnM0Wm9vQUIzTDgxU1k4eG5KUUIwaURzNTlTVUZY?=
 =?utf-8?B?TUxqMEFxQ3dJZzRROHF3bk9xZStwWURvV1YzVitCWGpDVGI2cUUrYlNjQXc1?=
 =?utf-8?B?L0F0TG8xb25OWHFvQlRXY0lOeDU3SHVpTVBMNi96cmk4d0ljOUQyVzZvbWxq?=
 =?utf-8?B?Z0dIT21QVTRvKzR5cnNUeC9KSEFRVnZEdUZkcDBzWFljOUNtNS9GcDhSekUw?=
 =?utf-8?B?aytpNUlIeWpXeHVGQnNkYjdIVVJTMC96MFk3THFxeUJwZkRjRStVWnE2Nkwx?=
 =?utf-8?B?WkJNeEY1aGNZdW9TZk83YXo1WjlpZjl0ems4QTJlSDNhY3BLSnR4clBNc1JV?=
 =?utf-8?B?YTRDbERJcDh5b2VtUTE2L0ZZT1M4eDJtS2tuVzdiT2lnTUh1bGtETXhPcDB6?=
 =?utf-8?B?TUZKbGRmaldvMGR3d3FjckN5VWd4NUNpckVKdVphWTFCV3hiOGFoSVlFTUhl?=
 =?utf-8?B?K3V1YVJnNFRoVWtqOFVhNWlxcTNzVUQ3SGdlR0xPajQ4WmJ0ZW9ieU01N2NY?=
 =?utf-8?B?dkJDalptdzVYOElpVHFVeDc4WkVSWXJUQndzRkFWZUU5VUdBWWEzVnFRQ2lI?=
 =?utf-8?B?bEpDMVBkZmZzMTZ2c0kva0ZsTkRlNWw5T2x5d0srbHZlZTQ0TFRtYzhSQkh0?=
 =?utf-8?B?cU02SDZNZitIM0hLSU52WFNXS2RTbUlHTkg1TGRyUGtrVmx2NnBOWFAzMElG?=
 =?utf-8?B?VG9wcXpiaTZMQ0dET1FNL2ZUN09OcnZkSW81ZldoeGNEeXlMOHRVNVBBcjJr?=
 =?utf-8?B?TEFiVkdNdXFYcE5pSSt1R1FKek5sQkhMQ0xPOWN4SjArUDNtL1JENkpTUnlF?=
 =?utf-8?B?aDRlcllEQktRVWJJN0FZbkhCSjlxTjQ0ZjVkQjFINHlGUWZVNGxoMS9MYysr?=
 =?utf-8?B?U3NWMGRNYkZaUXd0a3p3N0wzTnROczROck92NU5OT1Z3VlcvZzRLYzhTSFBS?=
 =?utf-8?B?SFJ2ZEJVb1FwQXhRYXRmdm1pWFBra3BMb1ljNitSR2dQKzhQU1ZqWDF3dms3?=
 =?utf-8?B?MUlVYlgrS2xLQ2JxRUwrUzg2aERwT2xZZHZBdXNkRWVCUnNiaitCeU9YYXBI?=
 =?utf-8?Q?5pycC/ynsRvrcHth+Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e16cd76-282f-4902-170f-08de7dc9aa14
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:50:23.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUack8tGAPuktQ2kMEai0FREAkOOvxYilyPIOYj1oCNdod/mLZ8AR60k5sPdPp8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6823
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
X-Rspamd-Queue-Id: 7C1D82375D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

On 3/9/26 11:30, Boris Brezillon wrote:
> After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> dma_fence::ops == NULL can't be used to check if the fence is initialized
> or not. We could turn this into an "is_signaled() || ops == NULL" test,
> but that's fragile, since it's still subject to dma_fence internal
> changes. So let's have the "is_initialized" state encoded directly in
> the pointer through the lowest bit which is guaranteed to be unused
> because of the dma_fence alignment constraint.

We added the dma_fence_was_initialized() function exactly for this use case and fixed all callers.

But looks like that occasion here somehow felt through the cracks, no idea why my script for NULL checks of dma_fence->ops didn't triggered here.

Regards,
Christian.

> 
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
> Reported-by: Steven Price <steven.price@arm.com>
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 69 ++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index bd703a2904a1..31589add86f5 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -835,8 +835,15 @@ struct panthor_job {
>  	 */
>  	struct list_head node;
>  
> -	/** @done_fence: Fence signaled when the job is finished or cancelled. */
> -	struct dma_fence *done_fence;
> +	/**
> +	 * @done_fence: Fence signaled when the job is finished or cancelled.
> +	 *
> +	 * This is a uintptr_t because we use the lower bit to encode whether
> +	 * the fence has been initialized or not, and we don't want code to dereference
> +	 * this field directly (job_done_fence()/job_done_fence_initialized() should be used
> +	 * instead).
> +	 */
> +	uintptr_t done_fence;
>  
>  	/** @profiling: Job profiling information. */
>  	struct {
> @@ -1518,6 +1525,18 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  		 info);
>  }
>  
> +#define DONE_FENCE_INITIALIZED BIT(0)
> +
> +static struct dma_fence *job_done_fence(struct panthor_job *job)
> +{
> +	return (void *)(job->done_fence & ~(uintptr_t)DONE_FENCE_INITIALIZED);
> +}
> +
> +static bool job_done_fence_initialized(struct panthor_job *job)
> +{
> +	return job->done_fence & DONE_FENCE_INITIALIZED;
> +}
> +
>  static void
>  cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  				   u32 csg_id, u32 cs_id)
> @@ -1549,7 +1568,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  			if (cs_extract < job->ringbuf.start)
>  				break;
>  
> -			dma_fence_set_error(job->done_fence, -EINVAL);
> +			dma_fence_set_error(job_done_fence(job), -EINVAL);
>  		}
>  		spin_unlock(&queue->fence_ctx.lock);
>  	}
> @@ -2182,9 +2201,11 @@ group_term_post_processing(struct panthor_group *group)
>  
>  		spin_lock(&queue->fence_ctx.lock);
>  		list_for_each_entry_safe(job, tmp, &queue->fence_ctx.in_flight_jobs, node) {
> +			struct dma_fence *done_fence = job_done_fence(job);
> +
>  			list_move_tail(&job->node, &faulty_jobs);
> -			dma_fence_set_error(job->done_fence, err);
> -			dma_fence_signal_locked(job->done_fence);
> +			dma_fence_set_error(done_fence, err);
> +			dma_fence_signal_locked(done_fence);
>  		}
>  		spin_unlock(&queue->fence_ctx.lock);
>  
> @@ -2734,7 +2755,7 @@ static void queue_start(struct panthor_queue *queue)
>  
>  	/* Re-assign the parent fences. */
>  	list_for_each_entry(job, &queue->scheduler.pending_list, base.list)
> -		job->base.s_fence->parent = dma_fence_get(job->done_fence);
> +		job->base.s_fence->parent = dma_fence_get(job_done_fence(job));
>  
>  	enable_delayed_work(&queue->timeout.work);
>  	drm_sched_start(&queue->scheduler, 0);
> @@ -3047,6 +3068,8 @@ static bool queue_check_job_completion(struct panthor_queue *queue)
>  	cookie = dma_fence_begin_signalling();
>  	spin_lock(&queue->fence_ctx.lock);
>  	list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
> +		struct dma_fence *done_fence = job_done_fence(job);
> +
>  		if (!syncobj) {
>  			struct panthor_group *group = job->group;
>  
> @@ -3054,11 +3077,11 @@ static bool queue_check_job_completion(struct panthor_queue *queue)
>  				  (job->queue_idx * sizeof(*syncobj));
>  		}
>  
> -		if (syncobj->seqno < job->done_fence->seqno)
> +		if (syncobj->seqno < done_fence->seqno)
>  			break;
>  
>  		list_move_tail(&job->node, &done_jobs);
> -		dma_fence_signal_locked(job->done_fence);
> +		dma_fence_signal_locked(done_fence);
>  	}
>  
>  	if (list_empty(&queue->fence_ctx.in_flight_jobs)) {
> @@ -3309,8 +3332,10 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	 * drm_sched_job::s_fence::finished fence.
>  	 */
>  	if (!job->call_info.size) {
> -		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
> -		return dma_fence_get(job->done_fence);
> +		done_fence = dma_fence_get(queue->fence_ctx.last_fence);
> +
> +		job->done_fence = (uintptr_t)done_fence | DONE_FENCE_INITIALIZED;
> +		return dma_fence_get(done_fence);
>  	}
>  
>  	ret = panthor_device_resume_and_get(ptdev);
> @@ -3323,11 +3348,13 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		goto out_unlock;
>  	}
>  
> -	dma_fence_init(job->done_fence,
> +	done_fence = job_done_fence(job);
> +	dma_fence_init(done_fence,
>  		       &panthor_queue_fence_ops,
>  		       &queue->fence_ctx.lock,
>  		       queue->fence_ctx.id,
>  		       atomic64_inc_return(&queue->fence_ctx.seqno));
> +	job->done_fence |= DONE_FENCE_INITIALIZED;
>  
>  	job->profiling.slot = queue->profiling.seqno++;
>  	if (queue->profiling.seqno == queue->profiling.slot_count)
> @@ -3381,9 +3408,9 @@ queue_run_job(struct drm_sched_job *sched_job)
>  
>  	/* Update the last fence. */
>  	dma_fence_put(queue->fence_ctx.last_fence);
> -	queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
> +	queue->fence_ctx.last_fence = dma_fence_get(done_fence);
>  
> -	done_fence = dma_fence_get(job->done_fence);
> +	done_fence = dma_fence_get(done_fence);
>  
>  out_unlock:
>  	mutex_unlock(&sched->lock);
> @@ -3403,7 +3430,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
>  	struct panthor_queue *queue = group->queues[job->queue_idx];
>  
>  	drm_warn(&ptdev->base, "job timeout: pid=%d, comm=%s, seqno=%llu\n",
> -		 group->task_info.pid, group->task_info.comm, job->done_fence->seqno);
> +		 group->task_info.pid, group->task_info.comm, job_done_fence(job)->seqno);
>  
>  	drm_WARN_ON(&ptdev->base, atomic_read(&sched->reset.in_progress));
>  
> @@ -3915,10 +3942,10 @@ static void job_release(struct kref *ref)
>  	if (job->base.s_fence)
>  		drm_sched_job_cleanup(&job->base);
>  
> -	if (job->done_fence && job->done_fence->ops)
> -		dma_fence_put(job->done_fence);
> +	if (job_done_fence_initialized(job))
> +		dma_fence_put(job_done_fence(job));
>  	else
> -		dma_fence_free(job->done_fence);
> +		dma_fence_free(job_done_fence(job));
>  
>  	group_put(job->group);
>  
> @@ -4011,11 +4038,15 @@ panthor_job_create(struct panthor_file *pfile,
>  	 * the previously submitted job.
>  	 */
>  	if (job->call_info.size) {
> -		job->done_fence = kzalloc_obj(*job->done_fence);
> -		if (!job->done_fence) {
> +		struct dma_fence *done_fence;
> +
> +		done_fence = kzalloc_obj(*done_fence);
> +		if (!done_fence) {
>  			ret = -ENOMEM;
>  			goto err_put_job;
>  		}
> +
> +		job->done_fence = (uintptr_t)done_fence;
>  	}
>  
>  	job->profiling.mask = pfile->ptdev->profile_mask;

