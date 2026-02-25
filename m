Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEkTBeDanmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:20:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578001965B4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5535D10E73D;
	Wed, 25 Feb 2026 11:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r/4fPbC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9D610E73D;
 Wed, 25 Feb 2026 11:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H15wEcWkhFHe+EKZbsF3dq/ea3IVK9hcB9Xb2smuYRxfjuBsV9lOY+mUZL8AeqTqwLXrWns6H7WuHNf1go31nHdhtGGju6u3MdG76bk5YjZVNeQeZDzaBPa4Z7WfI4fRMo/vX9J2TLwPPOKuFmba1hZKXRkKDMK6Zrhe6qodZfcCvJ6aTRbI4h7mdtLslFtJyyeRq/gkVooJt8oR9N1xpvVGmjDrNenPGVkMtAhJuxZCHeqvfg0m2ZwmbakZxesUvKSe4Q5FvjcIwoJPuwHMORH4M4rQsieFyJs4wFJsXjarqodlG6Y4tgKj/ppJZL6Aps1l9q/Oi6kk0rp/ilMQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUP4FZstw42Zlnggq5EYY58XCMeTnTiVx76a8hbWYuo=;
 b=IG9Ga2ggNu53osqPTCjs0ItrKudAZjljRz5QPpUvKfHWf+3v8CoSSjbWa3gJCWXtazZLa4FXzLWT7jpwTAgsVh3gfA1adXDj1ZFj1fH6lJbPOzgRBE1hRz/0QeBXyLBxSKCNEJXh0yfONck91WFliCSVGbAYfXynKzHqKNrDxM5tNw7Wb8iIDimdmn9aVqP/g3eLutIOwC+hgWvUDfoawY4GDBdNQb7DRMKCn1ssWVD8+n0/qNBbXv/PxLmkeVRrnIXEWcrESJMBFVSfMhVCenYy0RT+HZu++ANJVCPMTWFHdg9DX+m8leqMh7L4O6HIW8mGJwd30GiVKmSoRiKlEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUP4FZstw42Zlnggq5EYY58XCMeTnTiVx76a8hbWYuo=;
 b=r/4fPbC/yQFJZNj/0FXmJScXe5f0h6lS7VemDi2ug5FwAS0jD/BpD5wH6uy62JX6JBtdjP267PtdbuRm4KOI6MBjQG2eftmamvBc6r/eDRUZksUfAwdGOuxDU9sg6QRVXbIR7fz2lEP2djW65iRGYK199QEInGbgswuHNrctiKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 11:19:53 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 11:19:53 +0000
Message-ID: <abaebf29-1459-4ae9-bc59-e46f8b7c767a@amd.com>
Date: Wed, 25 Feb 2026 16:49:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware
 assertions
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
References: <20260224132506.2631528-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260224132506.2631528-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: cb23ef1b-de14-41c2-fdb3-08de745fcc26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: C7pQQ89UtJ2sknAw+DnyfCHzG10/gDFQoFYC6yPL2JYy954XPPNzvqdij5J/k4XcvcHQAlkV3T4lF5FszPvoVElXkzE1geq/fNUUnmGCs/NlzE8DNZzn/1d5qzArp5PdwKTKxSZ83hGfgI6oWM7U1DeuY2qJPjRO3U6wpCckoid/fS1GumKPG5JJrbsViZ1yx07zEGybFb0kCkyoIyOD2K9cOqSD55Yt/+C2y79vM7Xsx9lNMxXZayLEwLJCcWZp9sPU/NmqkoMwF/YW9nbFoZRpKcABbi+Eqwm6yId0FR6FhgXGVDgn1CXa0YDApPCTt71Xjc6jlj6LGcB9Qq0n8MATXsZO+Yo77pQE0r8uKnmgx3cHWSUaXhdxe2f6Gfm7gJSCd98cOMXbOFF5yPr5PLHaaxWg3lUA/tZiBQ6g7OhC/wP0PIFhcAqxKITwjNOgQppYACeOSwbY5wWSevx9vXwZwtilj8RIHYcHsSLmmnktKfKcaJI9C3cVhakvUSDE3hS2H38bVwFPK/u3eR6gY+MAX486ZOP1PVtOkfH8VTIbkZFFvf0TLO8TyqaqVc+D3MFf5iyv5POV2tvXs0mOdRFVUPadXycLwZBy2IQ8KFkHye5c5Tbf7ip98JG0aewVBMq5qfLMtszCK9IxvwsY5JGxrZEUrH2ie5tIrk5DYfPHKI2pKlYgEA/PYkKH0l285IZthWU/lTXtIJMk7NrCl5rixAXyrG60DwutmcUsW5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVwcWRZb3JSd3JwSzlFSE9RZWVUNjhiSFJyVjNIR0pHQnR4YmVoV2ZOQ05n?=
 =?utf-8?B?WW5vZHU0d0x3WUZ2dk9PR0xHR2t3QW9NbGEwcTJTbXh6UzBqQ2Z4WUFJdVNv?=
 =?utf-8?B?eURGVU9UWEpHMmZ5dEthZ1JOdFprSWpiMEI4ZVhRZ3l2Z0F3cnkxNEhjWGNt?=
 =?utf-8?B?WU5QemtXcmlXZFBCdFVTZXRlSVdFSklvbnhFd2NnalZMMkFEcUdRTDFlUmFJ?=
 =?utf-8?B?aWhJRnhLcEM4QUcxUzRSTEViWGZiZVlkMW9QZFVrZjJjQ2xqalIzc3hqVElK?=
 =?utf-8?B?MjNEMFp4UVhsUjdRVTdTaE1hVGdIK0IxTW13RmF4N0FoR0k3cU1adVpRcTMy?=
 =?utf-8?B?Zk1wb2lUTEtZZEFHVnJwVU1WVGNzSWpieXBYVnJvcEh2RkQzeHFkOVF3YkpC?=
 =?utf-8?B?ZXZvQSszd0RMSFJicFRwYjQzWE5nZnA2VjRvdmpPMzRld3pMWVVucTYyVk95?=
 =?utf-8?B?NzQySlF4YU1vWFhueFR3dDllRFN4TU95eC94Q1d1Z1A3WWFOenBoN0orVUF0?=
 =?utf-8?B?OFN0Wm9zRWRLTHlFeFNsNHJBMEpiVGwvdXdQdlkxd3NaTGlUdDFlRTlxa2RP?=
 =?utf-8?B?TnIrNUc0TVp0ck5iSXdYcmVZa3hSaUlXVlgyV1M0L0dheEVwU1RtYTJsU3hX?=
 =?utf-8?B?U0RRaDRwZS9IcWRwRVlJSXFxRFdsVjNjRENuaTFYOUNZUWVyR05URnVFcEZ0?=
 =?utf-8?B?RFVwdGFrZE83Z3pobjdtVmwvUzlyN1B1c2pPM3E1em1WWk4xeTdnVjMyYVlB?=
 =?utf-8?B?UURCNzV2OUhBL1ozM1hmL0xsR2FYajJEejNMM2ZnTEFwaGZUTjBNbWtSNUNa?=
 =?utf-8?B?WVpoWENUVnVCWjE0VmRLcklxNDhiWFJ5dkNjVGZMR0VDdjd0ajVUV2JMaXJx?=
 =?utf-8?B?aHpEcjY2cU03Z21TYUl3ZkpuWnYzVG80OEVlSjRXMlVRajJaMkVRRzZUVjFx?=
 =?utf-8?B?VmY2ektsVEpGNDFPQ1dyWUJZNi9iQURhT1dKMDN1Unh5eVJ6RHBqMk9QTE84?=
 =?utf-8?B?V1FSakRZOFZEU1NEN2V2TVhpR0FGd1NYTlltOG9rQXZLa3lUUHB1eGxjOEtB?=
 =?utf-8?B?R3dVYVFaVCtPVXBTcEg2S0IyV3ZPMnAxNFZIUXpFNkNBTVk4MURNZloxNkoz?=
 =?utf-8?B?a2hOWVRYUzVBSUlaN0NLRzlwcHlLL1NYbEdlS1NXdG9rL0VYRG9qcFlpTFBs?=
 =?utf-8?B?OUNrODZsd0JLb3Evc0NyMjZTdlVXcE9lbjYzQm1tN2JWQVFPeEdBdnB2TTc1?=
 =?utf-8?B?RjJ3dUFtY1NiTEtSUTZCZTZPYzErRzVpZ0FheWJLc1hJejZOTjRCcmxxd2Z6?=
 =?utf-8?B?eER3TGkvaEV5VWZGenVuNnRvQnhjbTNZU0ZIZ0s1WGl5b09ZYmN1UlNWYU41?=
 =?utf-8?B?ZDVyUVNHcFNPZXhRdXVIWnQzRitnZVVWeXNJZ2hRZy9CRDMzTDhYMEtkMlNx?=
 =?utf-8?B?enJRMHBYbWwvQnBsc1RVWm5QR21XekkrbVZUK1BMRmpkSUhnVGp6eDNjKzhE?=
 =?utf-8?B?MlJZcFMxNzJCaE5CMVdXcWY4eC9Bc01sQ2hBTjNoRWgzazFVZG5HVUpYWWtU?=
 =?utf-8?B?OVlwa0dZR1lNOWU5SHlISXV2Q2YrM2xVUG5DQVJSdFVYNFNxMHk5bzR4U1hC?=
 =?utf-8?B?U1JtQUlBWUQ0Rjd6b3J6WlZtQkpJK2prZ0NydjVDU3MrVnozcnMzUjVxVi9N?=
 =?utf-8?B?VDlNSS80Z0lvaHVvdzN6aDhUVkF1SEZLZkoyS0t4NnlsNkl3dnlQd1ZLTm1G?=
 =?utf-8?B?bnF1bVpkaVRiM2V5a3BwMkNsdWdBQ2hISE93SWdRVGl2cVVSejdLUE44Y1pT?=
 =?utf-8?B?NnJaaVdCOGhvT0ZtUW1xVUl6YmVuMXJTNkxGeVVzdkVicDlPa0xNcEtqYnJR?=
 =?utf-8?B?VFMxTHFWWk1zS1FiZExucFcrTHNzOHJDK3RudVhzelJRN0VEbS9peEgwNzF0?=
 =?utf-8?B?MWluQjhrMWRSNEtxMUxKTXF2TzZzUXdEV2w5dlFxek4vcS9wWHRaQm02d2xB?=
 =?utf-8?B?MjRzZ1VRN2pGSE1ZVlZwdnhMbHkzMHB2Q3YyOEdQcm1nMEIzR2NHYTFFS1NR?=
 =?utf-8?B?VHQ5QXhnZUZWMzVENlNpS1Q3aUhxdEVYeGFiNlJ5UHNlTUt2S0xNbWNIeGQz?=
 =?utf-8?B?R3kzQm0wT2VneThiM1N3djdXdEFwbzZ3SVVaL0JTS3JFUGFrN3RvelFqMURi?=
 =?utf-8?B?RUcrWnZlUVFHQWJCdTFzYkR4eGxqV0M1M2o4Mlh0aFgyRFdNMHkzV1lxVzR1?=
 =?utf-8?B?VG5jRGNsaWg4VmFsOFN0L01vZG9hSUh1M0JlYjhrVWJqYWV0ajRDQVBzS2RK?=
 =?utf-8?B?VmtQWmVvTzY4OU11VGVIcmRRV01ZdmVCKzdsNFppem5Pd3RFWEt6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb23ef1b-de14-41c2-fdb3-08de745fcc26
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:19:53.4429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6AJRt6E+ol/9iyNPbTh+yxheAtU2HDxIcgTrz9TFZmht30Aq+nrpdhv4Zep83i9l/SMoXn58y6Ce+s3cOEwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 578001965B4
X-Rspamd-Action: no action

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 2/24/2026 6:55 PM, Sanjay Yadav wrote:
> Introduce gpu_buddy_assert(), a small helper that wraps WARN_ON() and,
> when CONFIG_KUNIT is enabled, also calls kunit_fail_current_test() so
> that any active KUnit test is marked as failed. In non-KUnit builds
> the macro reduces to WARN_ON(), preserving existing behaviour.
>
> Stringify the asserted condition in the failure message to make it easy
> to identify which assertion fired. Leave the WARN_ON() in
> gpu_buddy_block_trim() unchanged, as it returns -EINVAL and the caller
> already observes the failure via the return code.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>   drivers/gpu/buddy.c | 36 ++++++++++++++++++++++++++++--------
>   1 file changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index b27761246d4b..da5a1222f46b 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -3,8 +3,7 @@
>    * Copyright © 2021 Intel Corporation
>    */
>   
> -#include <kunit/test-bug.h>
> -
> +#include <linux/bug.h>
>   #include <linux/export.h>
>   #include <linux/kmemleak.h>
>   #include <linux/module.h>
> @@ -12,6 +11,28 @@
>   
>   #include <linux/gpu_buddy.h>
>   
> +/**
> + * gpu_buddy_assert - assert a condition in the buddy allocator
> + * @condition: condition expected to be true
> + *
> + * When CONFIG_KUNIT is enabled, evaluates @condition and, if false, triggers
> + * a WARN_ON() and also calls kunit_fail_current_test() so that any running
> + * kunit test is properly marked as failed. The stringified condition is
> + * included in the failure message for easy identification.
> + *
> + * When CONFIG_KUNIT is not enabled, this reduces to WARN_ON() so production
> + * builds retain the same warning semantics as before.
> + */
> +#if IS_ENABLED(CONFIG_KUNIT)
> +#include <kunit/test-bug.h>
> +#define gpu_buddy_assert(condition) do {						\
> +	if (WARN_ON(!(condition)))						\
> +		kunit_fail_current_test("gpu_buddy_assert(" #condition ")");	\
> +} while (0)
> +#else
> +#define gpu_buddy_assert(condition) WARN_ON(!(condition))
> +#endif
> +
>   static struct kmem_cache *slab_blocks;
>   
>   static unsigned int
> @@ -268,8 +289,8 @@ static int __force_merge(struct gpu_buddy *mm,
>   				if (!gpu_buddy_block_is_free(buddy))
>   					continue;
>   
> -				WARN_ON(gpu_buddy_block_is_clear(block) ==
> -					gpu_buddy_block_is_clear(buddy));
> +				gpu_buddy_assert(gpu_buddy_block_is_clear(block) !=
> +						 gpu_buddy_block_is_clear(buddy));
>   
>   				/*
>   				 * Advance to the next node when the current node is the buddy,
> @@ -415,8 +436,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
>   		start = gpu_buddy_block_offset(mm->roots[i]);
>   		__force_merge(mm, start, start + size, order);
>   
> -		if (WARN_ON(!gpu_buddy_block_is_free(mm->roots[i])))
> -			kunit_fail_current_test("buddy_fini() root");
> +		gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]));
>   
>   		gpu_block_free(mm, mm->roots[i]);
>   
> @@ -424,7 +444,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
>   		size -= root_size;
>   	}
>   
> -	WARN_ON(mm->avail != mm->size);
> +	gpu_buddy_assert(mm->avail == mm->size);
>   
>   	for_each_free_tree(i)
>   		kfree(mm->free_trees[i]);
> @@ -541,7 +561,7 @@ static void __gpu_buddy_free_list(struct gpu_buddy *mm,
>   {
>   	struct gpu_buddy_block *block, *on;
>   
> -	WARN_ON(mark_dirty && mark_clear);
> +	gpu_buddy_assert(!(mark_dirty && mark_clear));
>   
>   	list_for_each_entry_safe(block, on, objects, link) {
>   		if (mark_clear)

