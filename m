Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80999E983
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 14:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81910E576;
	Tue, 15 Oct 2024 12:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lYLaTFvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DC310E574;
 Tue, 15 Oct 2024 12:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv1qFIdC4UQXo3rUMIA2mlCkO0aDUJ15jGAmj2ciQG2+MbY21e49HewkdmryNCtN67OcHJYiPIYnpoAWUH33h5aABQflWkt3bkO0rmQTQF+Xos1blmS+0eDRYuizO5UvUmYd9SNaJ8S5R0NISAXeuavNy/3JBSb7ExjCKQZoh34dTuTykPFr8PW+MjauMhapH9SDRPEn3hEH3KxraGFwQAMy1fRYR+KijBfNUBxZqibZLYcZ5uosAxMjgLslxyDlPi/6Cc8Yfiw9CCfrSG4N6JcZP9cRCGm679R+Pzba7eNrKulbO37QaZFvA79OFp1Eb47rs8YGdHJrKWPbrmu+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJAv4FOz2GyUP5GTWLL1/Bz9JL4n6GJAGmW1p9ahnMg=;
 b=mVVnO3AfBPMlJSLnS78FRxWxc/teVqzlPpPxKtie80QQE+JxEfPfS507Q61dv6aACcnoR4sGWf659ODT4IIfMOIAquYMkpdiz8UsDikb53U9+VC/H9t0aTMOJhJN7aasxg6fwcLDbDpCgAudo7AFqMDb7sseKDIcIFaGNnYbjbxtMI/IiWaU2FArAGFt8k1bD2EltmMdOJUN9ZnSW2siwHDil5BZckEdpeBiVcgxJzxCHTb3ZInPHZAA16yB1XRiYnOkwQZzlhMb0pnf3+d0I0N5NBu+xsNhHk8zMKETPkS1kpegIlAurTQDQkxMcW5CNVIzUGvxCz0ug47r5U79Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJAv4FOz2GyUP5GTWLL1/Bz9JL4n6GJAGmW1p9ahnMg=;
 b=lYLaTFvqWE6/lQLk7BmTr/WduoSEelzd3iA/RvtFXFjMEn8Jfmrqi1e+L4BElABLMEsCWiZoaazdSapr9y/9o6D4NLupsZRy38XHMXyStnKfHqIlsl2xQ85zihBs5Jhsm72W+kkIe5XUI4nvFbQwLc1eIXFlGdzpcnIV1M/lG1H0g5xSRDbcYw7VPEpGtQVBJAurcqcGWWr9LVWsjOlLNRlwF65SbIXmnczmwhwh+GBIG+h9W7iSfti9QykMjnatTWC+Ghbn1CyDpCngSKZyb8tUjxDTfdDT2hTpfyL9saRZe2rP6QJssaUkh99Ti6S6GtRmf2brfMpx2v5Jf8CLzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Tue, 15 Oct
 2024 12:18:00 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 12:18:00 +0000
Date: Tue, 15 Oct 2024 09:17:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 DRI-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
Message-ID: <20241015121759.GG3394334@nvidia.com>
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BN8PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:408:4c::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 01dff8a1-7e4a-455f-4543-08dced136918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzNZbnVEUEJJRmllNVBwSzU3N09mUCt6aGtJWmlSVmdGYjZmWm8xV3VYMXRS?=
 =?utf-8?B?VjhjSHN1WXlFOW1kNDZBa2VaTGxxUXV1eUcyL3VYSlFxalBWbDZJenpQbXVR?=
 =?utf-8?B?UXdJNkRKTVlxdG9nZXkxRDdvVkpac251bTBDVjdMTi9WcjI1cWlmenkrNE9J?=
 =?utf-8?B?dnpyeWFoYmdSMGtJL3BUTGlxUTEvalhaaXo3VXc3N2VYZU1VSmI3T2RwRTlu?=
 =?utf-8?B?NDVaTXNkS3BDQldBZnd6aUxxbXUwM3N4YzI4K3BUTW00WDNTSVlMcU1XRWln?=
 =?utf-8?B?QnI5RWNYeXBtY1c5ZGpwT2JKU3VtZlIyaS9hOS9ZQXNhNGNlVmE2T0VHazJk?=
 =?utf-8?B?QVBqMXZJL1hzSC9iekVlcDFMVEZLUjBFTDFCeU9idzRnbGZteER3WGtMeTVP?=
 =?utf-8?B?K3V2NDNTYWJaVDBqUTBQQlNGaVp0U0dpWDlhdGRIVjk3NkptWXZWWHBPYnVJ?=
 =?utf-8?B?R2crOEF5eG1JbTBQN29idTF1dDJubTdnSXNoZWY5em9NMDYxaG1wVVczcGVY?=
 =?utf-8?B?Y0xXZkQyd0xsa0FGbUpzRllBeGxzSFNzUTdGUUFwSDEzeU4yMHZ4ZEJHdUNI?=
 =?utf-8?B?Y1BnMmhXdWduTkVRSEVxUlBuU1VLcUwwQzJXcWpVTXFJNm5wU3pzTXRzUS9O?=
 =?utf-8?B?djN0dFJoZmMxYUZERzNqMWFVanpHV0xOWHBmczVva1pwN0FXdHFJNE94TnRP?=
 =?utf-8?B?VE95bHoxcjVsaWxqdTBlTngrb05TTStieHEzZ2YxQlhLVW9icDEwa2toUkdp?=
 =?utf-8?B?d1VyYjRmdlNUYXVxQVd2QTFlMEpMRkFsa3Bya2d6YzU3UVJtelBmbUtKWGhm?=
 =?utf-8?B?ZnUyOVdTSGRIcVdqVHVsZGJLRzE0a21weHA3eDU5OWxXRGVJNmgrbjBOeDUw?=
 =?utf-8?B?WmxrMzdDWno3TFJDWnF0WERrNDZCbDM2ak01MnJ4ZmJuNjQwdU0xcC9Rc1Rs?=
 =?utf-8?B?WHlPZ2pUdTVSL25HeGp5VWZ4dTJLZ3NBVWM0QmtFVEFJVXplQ0xvZDQwSHpS?=
 =?utf-8?B?R0JsZFdjbTVWeWhkR1h5Y1VBNkZ3NWtoMDgrREI4czdOSk9temkrWVFTU0tw?=
 =?utf-8?B?VldUYTJYb3dxWDhTOUVQcFRVb3ZRdFZKU29wQnFsRmV5Q0VEdVAvR0NvZEdr?=
 =?utf-8?B?ZHRIWkc3NkRNSlRxcHBNeFdra2JCbmRMcExNbngycFdia3dDN0twUDZUbXhR?=
 =?utf-8?B?U2VKWVlsei9rOFRSYkdLKzQ4ZWpxYzVLQkFnS0I3QnBIbCtiaHdQdG1vWDlR?=
 =?utf-8?B?MVJHR2NkQ0tkMSttamFSRDVsUGhBcjkvcndMNGc2ZzdyZUtoOFBtaGNCRzA0?=
 =?utf-8?B?djRlUTBDUnhHNU9DS1BZSXYrcmN1d3ZvMGluZHhZKyszcHBBNE1CcGp2d1J3?=
 =?utf-8?B?aHAyUlFnNEZuTW5yZDhaWWFpMUhmeHNYWlVBSWo2Q1g5OWx4ZVVCMkgrM0k2?=
 =?utf-8?B?bXpvci9kdFJhUnA0dGhpam5GRzVvOXQzbGRDcVZTdEJjc0RwTlJMV0NqdFNl?=
 =?utf-8?B?N1d5bDhlTDV1eDBXS3d4emxIZDN4SnE4dEFJSFNrYlYzbVpiQXFZVVBqc2E4?=
 =?utf-8?B?V1NLSXViZVJKdG9TbmFnUGlDMlJuODBvWHZyUW8zbW0yemJTcWwvWmFsbWpu?=
 =?utf-8?B?Rm1xQmVEaysxNVhRTHM2K2hvajlBNmRtS0M2c3BLZ2pacWd4TG1IbHRjVFZP?=
 =?utf-8?B?Z0QrMnhycE9sb2lBemJ4eFZjeWhTRUFVaHkzbE1aaWJjdXh6RXJRRlV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1VY1UzeklVTkVZT0JXZDZ4cXdtamJVd0ZEcUpJNFBoVDZETnpnQjhkM3Ft?=
 =?utf-8?B?K3NUbUFaakgzY0cvR0hvVWdVdzViNFl0NjQreFV5c2E4cE1sMWlSWmp4R3hl?=
 =?utf-8?B?Wkg3TUZLV2VFeDJoeXEvb1JrMUNRU1ZtM01lODdBd3lIMHI0QldkWitWRE8x?=
 =?utf-8?B?ZDB4L0svYVVhNDFpL3BoaWlrOEdWMDVxMWd6Z1RBUGcxQXpOUHpjUU1yUHF2?=
 =?utf-8?B?dTd6cWxhNHlEWTVUNnRPRWpYdHYvQ0R3UFhySFgzaXF4dmhRM2w2ZlFZZ0Jz?=
 =?utf-8?B?aFdnVkJYNUZRUHNtLzRCYVNZQmRvcFlPOWQyb3lFSjF5UEQwQ09yTzluRVB6?=
 =?utf-8?B?Z0d1dHhSU1M5SWpQVVlJNmxvZ1ozQTBUQmJjVlFVajJPYVZzTmxEN0xYTExU?=
 =?utf-8?B?R2JybmhmTTRXTnJTSkwvS3NISS80eDgrSjkyUzV1WGdIby9LNFZuMWw3aHpO?=
 =?utf-8?B?ZVU3cmczRXJWWGh2ZGVxL25xL0pjb3kwSmlZamF2ZFBhL3BjcW9tR0RSd1FH?=
 =?utf-8?B?MDkzK0piOU9RT0lzK2Q1M0tUWm0vYjErTUZsRG5WOGd0MzlsWitPSFNhUkZ2?=
 =?utf-8?B?MUM2TlBrd1M3Qy8rM3pUL0dUTER3eGp5T2ZWQXJwWDVnNllFa1Z4ejNkQ2Q4?=
 =?utf-8?B?RmhhV1BzejNyZnU3WWNLOVVsMC9wQVRkUkp1NlQrWW9XTmJTMWsyNlI0eS83?=
 =?utf-8?B?Z1psLzZnZzl5b1kzWnFBWlJwL3NUWW5VVDNhbG1BWWQ4YmdvWFNjQ0kzTEZp?=
 =?utf-8?B?STRGWHNYSnFRUlRYd3Q4RWwrQXFVM3ZrcXVjSEVhWDQ0V3plMHN6RisyVU5n?=
 =?utf-8?B?V1pzYUc4RGtCS1kzV1FtWGZtcVFrTlpRZ05jalYwUHFKRExwZzZpUDFPVGtE?=
 =?utf-8?B?TFNLcExXV1J4amMwOWJkdkttVzZwT1l6eUZQYkFHcjB1dk9pREFoaTZkeGov?=
 =?utf-8?B?QVo1ZDI3M1J6dUNBZDVFdDU3L3VGY2g4dzNManl1d2RSQVNNRHlZY0thOGky?=
 =?utf-8?B?bXBLVDNZUCtMZFc3Z1drR3VlcnhXU21XTm9NNmJ6aTVPdWJwUjd0TDRGY2pW?=
 =?utf-8?B?VFF6Mkd1RjVQOS9IUTFadHVxdG9SeHFUM0Zhd0xraFl5M0VTQjlGeWtEV3gv?=
 =?utf-8?B?KzBsMk5BVVE0TlphRi81VWxiai9tSGhEVlRwRnZjU1JnbHBGYlFRdWI3SGh6?=
 =?utf-8?B?WWJWTkQzZWJML050SXYxbmo4MUxST2ZXckVtMmRyYklIbTJBcWZhYW9sbEY0?=
 =?utf-8?B?SWxuUm9XUkY0MGZqS0lvTy94clhuSUFXMFlnSmk5MXcxaHZEYXRyUXYzYXRS?=
 =?utf-8?B?eExZMm5JbTlKS0UxN3RrYjA0US9xNlREclh5aGd1SVlBdWg4L1M2NVR1alBD?=
 =?utf-8?B?N0lYZHRvZ0VKNjRKMjU4ZEFnaE1UY1dkb0I1SUZlK3VvMkM1OXY0L1NsS2Rk?=
 =?utf-8?B?UVh5aXBBYytpdDlCVGU0dmNkd2ZnVjZZVmJ4cnNTWi9nazVWa29EdWNIWGMx?=
 =?utf-8?B?dW5CZnRxT1FHbXFrQitkc2xWM3AwMUxqemlwSDBVOGNoa09PbTFsa2JidTJl?=
 =?utf-8?B?VWZ3UG5rMStZbTRwT0NZcThVT3EvS1kveUV2bXlKa3d0Ti9YNjNjMVl5T2FZ?=
 =?utf-8?B?QURidExidFFwc2dsOHdHcUlFZlhoNU5UTTdHbUFVcnIrODhXdHhONGk0UjJt?=
 =?utf-8?B?ckFzN3BPR1Q4dnZNWDBPL3RYVWZTRXBKTGJRT3VaWUdLR3RxNk4xQzUrZXRi?=
 =?utf-8?B?SDdzQUVTc1gwRmo2cXFiV1Q3M01VaStMaUJpWHJhMFI1QXo1Z2xyR29LTFlD?=
 =?utf-8?B?aVZMM2pUTEFPTllJTFJ2c1pVN2Njb2xJZUhXYWRJUlU4NlcyeUNRMFZ1Qy9P?=
 =?utf-8?B?Y3NDbTVUNnFvdkVqNUVYaEptL1dIdFFjMDBEcmU4UmtJcThQR3kyUjlZU2g4?=
 =?utf-8?B?aC90YVV3MmhlU0w2cHIrOCtEaEtlNEw4SmIxQlZkQlhhcVdJREhVcTF1QTR0?=
 =?utf-8?B?STJzakp2dlhETW5SVk5VTmtZOGJpenhDUzZsL3oyWkpCcHhvWjk4QlNxZmZP?=
 =?utf-8?B?WXlyUmJUM3ozb0ZLV2xlaU9TOVpjY0lNZXp0MTZXb2x3MUZ2a3czZ2NyWDdV?=
 =?utf-8?Q?iP3U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dff8a1-7e4a-455f-4543-08dced136918
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 12:18:00.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPE+cCZrP8jtwU1ed4CWEjC3PlN4/Osv+xOowuB00S4TPuxv7gugN4qy8eH7N9Co
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
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

On Tue, Oct 15, 2024 at 01:13:22PM +0200, Thomas Hellström wrote:
> Introduce a way for hmm_range_fault() and migrate_vma_setup() to identify
> foreign devices with fast interconnect and thereby allow
> both direct access over the interconnect and p2p migration.
> 
> The need for a callback arises because without it, the p2p ability would
> need to be static and determined at dev_pagemap creation time. With
> a callback it can be determined dynamically, and in the migrate case
> the callback could separate out local device pages.


> +static bool hmm_allow_devmem(struct hmm_range *range, struct page *page)
> +{
> +	if (likely(page->pgmap->owner == range->dev_private_owner))
> +		return true;
> +	if (likely(!range->p2p))
> +		return false;
> +	return range->p2p->ops->p2p_allow(range->p2p, page);
> +}
> +
>  static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
>  			      unsigned long *hmm_pfn)
> @@ -248,8 +258,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  		 * just report the PFN.
>  		 */
>  		if (is_device_private_entry(entry) &&
> -		    pfn_swap_entry_to_page(entry)->pgmap->owner ==
> -		    range->dev_private_owner) {
> +		    hmm_allow_devmem(range, pfn_swap_entry_to_page(entry))) {
>  			cpu_flags = HMM_PFN_VALID;
>  			if (is_writable_device_private_entry(entry))
>  				cpu_flags |= HMM_PFN_WRITE;

This is really misnamed and took me a while to get it.

It has nothing to do with kernel P2P, you are just allowing more
selective filtering of dev_private_owner. You should focus on that in
the naming, not p2p. ie allow_dev_private()

P2P is stuff that is dealing with MEMORY_DEVICE_PCI_P2PDMA.

This is just allowing more instances of the same driver to co-ordinate
their device private memory handle, for whatever purpose.

Otherwise I don't see a particular problem, though we have talked
about widening the matching for device_private more broadly using some
kind of grouping tag or something like that instead of a callback. You
may consider that as an alternative

I would also probably try to have less indirection, you can embedd the
hmm_range struct inside a caller private data struct and use that
instead if inventing a whole new struct and pointer.

Jason
