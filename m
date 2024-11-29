Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9EF9DBE2C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 01:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D4210E291;
	Fri, 29 Nov 2024 00:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gkn/ZNcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8AE10E291;
 Fri, 29 Nov 2024 00:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHgdjaEthDuXuUrZ69LNridPskAReKm2kG9L2vpLAj4IPOqhDb3MOnDhCLtWTEj6JEOWiiLyF793Z1NfUAvNv7s2tghfv8Q+kmKLoayMAtrkJnQxYEUK0XOyv3XGZg3JunoLUT7d1Fga+YIVrqz89z8rCEwANO1qln52n/3NIxVHsgLqPRgQIV+JxYhgCYyTynEhLtOLelHz7+BTXDUSVYSenac+1Ov3Z22tDcHi8jbneBswRPcNpSlgQd4jJ4nxwD4D8SYwCSsvTiDE8RVUAg3FCBWKcxy2Ab11ey9mB+R7QZhWMs39IAuPlrQ3LvYBrNU8gK8A5BU/5OyzTh3s8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkVufqrwzMGUZqd7y+tXffHzNDVHIhp+LfBsGjB5zP4=;
 b=Rr7k8L3byCxQ++mDeIFrW5Uzz2oSQucP4T8VDz6eJsq3BS8eVSEIwYfeMb4YbaXd3qXt4af/UAv4SIONjbdv8X5PYZ+GLiHDwZQD7fVbwTI55d/gUNY7A6yq9ip0/+aAihFPnvVbX5pzG+BXGQNCUhTJDTciD8D9S2xc3wpVzPDAMmVKgtEx4fFc6xeWuZTHJ6W+PBamuehmTyh11G+mtGAHa8TLop8JwXmdZAdMOhgKFpWJnt4IOOBmvqApTqHmWxMAw4n4yrkalHb0NFcliaT1CD/r7ukbMCw0+A1nf2j1DjQmVNmKDBQyWGGsKqnpBDBVQU79Rof7VKg/GRD6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkVufqrwzMGUZqd7y+tXffHzNDVHIhp+LfBsGjB5zP4=;
 b=Gkn/ZNcYLiLjAPR9XNd7GqYWNST+PC6JpjCiMG5dM3raRxlQ1XvzV/i2LkV+JDbnl3xaYo0R8Nz4FfsO2/Q9b2gYRF5z9ie217St2xf+HXmhDuzqWhvMWyGAkAT6rd4myozcb11o0jYzpYGAc89CM0AJ3OwbE2dn/f2IHKNiNQ5bP3nm9M8Gswgd3nK1Ech4TA38NAjuL2MhSMCcF8f4yqN96ZIVBVBidb1aQRhDsTWaJo2MKqdkiWTF0OD++tTtlzglyCxJsF1XPFpxVPVZjnVgwPYc90Rw3AkJV++5qwxD7Qe7MDhHKfGdvsa7X2eAA0OMsYINoYRr/9soeRjktQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.15; Fri, 29 Nov 2024 00:04:29 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.019; Fri, 29 Nov 2024
 00:04:29 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
User-agent: mu4e 1.10.8; emacs 29.4
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Date: Fri, 29 Nov 2024 11:00:24 +1100
In-reply-to: <20241016032518.539495-6-matthew.brost@intel.com>
Message-ID: <87zfliewhj.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY5P282CA0021.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: b92ee974-a0da-437b-ab4b-08dd10096498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bS9oS3FjTEJoMUdyRzZBM2NiZ0ZHOGpOUGFVcWwyZ0FUbXhHWXViVk9FZDkx?=
 =?utf-8?B?MVE5bEYrbEdFbXdkRjUvUXFNM3dKUms3a0NZQi9PUWZrc1h2WDFGd3g0ekpX?=
 =?utf-8?B?eGlyYlhQUEdoUFRYVk9VNVdwaGhja2R2MjBqN3hkMGJESFlicDlSVldKWDFq?=
 =?utf-8?B?RngralU3SlhKMU1RcFZGS3R2VXBHUlk5Z0lSUmZtY0RoUWtyVk15Zkp1enBy?=
 =?utf-8?B?ck14MXZ6WUxOTVMvTkF2Y1FEQVhCb1JncnNGT3o3aXVyOGthY3QvN2lpd3RM?=
 =?utf-8?B?cDVTTSt0Q3hBbGZ1d2NuRThMaW9Tc1ZKUVlZTEtIYkdFeGNydGFZb0tQbXZX?=
 =?utf-8?B?TnRHYkt5SGdUSHAxOE05YWI5cWJ4ZFZkNS9obThJdmhhM2JLQjVhVVBsbUY3?=
 =?utf-8?B?ZVdlWE9YT1RKWEtXbTl0UldPdUNoZGpjeDNMMWNSeEgxT04rcm1kaVJBUnVD?=
 =?utf-8?B?Z0YrS2ozQ2pvQTl6L2NwWTRTUWtXREIvTzNTTmttcDB0NjJ4U1VkQllCTzRQ?=
 =?utf-8?B?VW03RThydkZ4MjVuT2xvS0U4Z0RzWmV6U1NBUXBhcVpmUlA4ejRtNnFkRFQ2?=
 =?utf-8?B?N0ZQbENoSGFsY0NOL292dVFHQzNEVXhYemgwMHhxSjM3dFBmMjVFUmRESXFj?=
 =?utf-8?B?ZmpIVjRzb00vaDlWaTd4ZmZXcCtWcFlybm9aZGFGZEcwZHlkOFFUdWtVM0gy?=
 =?utf-8?B?Q1psU2NHNmFlcklsUkNGQ1hMTU1iTXJHTDMveVM4UUhPbm1rL2NmVDhDVDBV?=
 =?utf-8?B?ZU80TjJ0SjlSeWZKRURxVUJlSVRET3hEUXExVGlZKzFoRVhMWGxJYnoyak5J?=
 =?utf-8?B?REE4YkUxbjNWU2V4SEdmemZmZjZ2RTVZTkZKQk9kK1VPRjE2TEZOaENXS0dj?=
 =?utf-8?B?dTBIamViempvMXlaNjVwcndhSExmMndZY0hrNEliL1ZMYUYyNDdMaDZPeVdp?=
 =?utf-8?B?b0U5bitRWGhraE9maVNyY3Jpc2w5TEFYZTc2QUxSZmVWbUUyWjZwNU8wZ1Jx?=
 =?utf-8?B?KzAwUVdZWVNPRTdJWmJtQmZ2TGQrMVJRNkNXZVJzc1l5cEF0YlZzQkREWWh2?=
 =?utf-8?B?czhWZ1ZveVd4am00K1VjK2ZnNk1wZFVITFltdmJDMU16ckFxeGZCT3BwaXZv?=
 =?utf-8?B?WENrU050eXNMTTBTQm1sdzBKYW1BbEVRQ3dKem1pSks5UFZjbkdMZDFpOGRK?=
 =?utf-8?B?VXEzdHp3V0RpejFGZmdHSTdSaWE0d0g3TE5jcllyNEk3L09ibXRISFpwV3BF?=
 =?utf-8?B?dkZtRndWUTJnNHdHVkZ5RUk0emphT0VhTGpLUTlDckVIdkZoQ2pFckxUbWpP?=
 =?utf-8?B?TjFSSXhxUlpzK1RYblJRTzZhdDFTQjFwS3MvODkyY3hlRDFGeVBHL1hLTnFK?=
 =?utf-8?B?dTdvNHl6R2I2dkdBUjFTVlB4MCtaZFRSNmVsYzIvRVo5RDhUYlpDeG9CODVs?=
 =?utf-8?B?bmJvWXJuei9aM0hlT1hJcmliYm5zL0llbi9zV0VmYk45YWRHclFUeWNhY2M5?=
 =?utf-8?B?NEJkb29oUDRORWtYOXBpZXN5WTljcHB5ZmUvYUx6clZGb1BMZ2dPdUxEU2E2?=
 =?utf-8?B?R1Z6alB4Zy9oRngxYjJISnRGNmhHYi8vcVVNeU14ZWlqWHI4NFZZM0Fad0JX?=
 =?utf-8?B?SzFlcElHenVyb1pDNXBWalpNMERJL2RWUmpGM1JZUXFLa1BDNWEzeVhUdjJF?=
 =?utf-8?B?ZVhyN1VmMnQrT2RqSDkrK2dVSVpFSWZZeXo1M0krUVhub0NGb0hMVGxGZjAr?=
 =?utf-8?B?M284cWFDT2FkK1BEcWV4MGwrMGZyV3Eya3JCWGFKS0JWcUtnZE9rTnZSaTZl?=
 =?utf-8?B?R2JQMVUydkJNWXorL3p4Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEszUE1rdVN3MVJNQWp3Vkp1aStSY2hLcTU4OHJ3SzVwRXRteWF4cjBtTHU5?=
 =?utf-8?B?aE05OHBaVndydHZ4YnQ1Z1VCQ3MxUHdHRTZUZDNUSWxDOENZaEZRT1FKS1JP?=
 =?utf-8?B?a2xpYld4MXFjY2ZqczZSMVZIM0NsRTRWbHpMNk1XeXJuZThQOUNaY1RiSHYv?=
 =?utf-8?B?aitxY1E1VldZQTFmMTZxRjVsVlloYUpiQmVZeVk0NzRRY1I5ZW8rZFpjazRh?=
 =?utf-8?B?WkxOVEJhVGhvMGx0VzVHQWFoOVpERFFtNmZzbzJJWGQzQ0U4bU9kdWNyVVBQ?=
 =?utf-8?B?TFZJQWMxYVJXNW5JNm1vRk8vNURhd1d2RUxhVk5Ha1dPN0hxcVlTUHNKYUtv?=
 =?utf-8?B?cEhiOHN1eVpHM2pWRTNqVml3bnpqMzM0REJqNUFKOENxZmlPVEI0ZzVlWWtn?=
 =?utf-8?B?Qkg5Z3pqYjIwYkRaVzUwbHRSa2J2eE1MaFdCQjk5RG1VMENFU29nNFUvK1B1?=
 =?utf-8?B?Sk0wMitLa1Qzck5TcEE3alZKWit1NFMwR08yQ2JBcnlKMDVQNkVJWTU5aXpt?=
 =?utf-8?B?ZlNnd1dnRjdBYlc5VVhIRW9vZ3pzeEU2SDlQeEJBZklQVmhhT0RhWkpCM0Z4?=
 =?utf-8?B?cFBuU0I4VFFzQ1A3ZVVoT3g1M1dpcDJHbnZPNTNwSHFDL05waVlYNUpjb2s4?=
 =?utf-8?B?RzkxRFNFZ1VJeTlnVi9kUmxPMlkxTkhlQ3IrY0N4cTQ2d1NzYkZGNTlJSzZq?=
 =?utf-8?B?WWhxVjBCRDBqZ1JxMWZKYTJiaDZrSG8xYlpwV1FKbzR6dUhTU2xIaFpzaFhB?=
 =?utf-8?B?WUpZYUJWTXNKenp3dmZXK0hPbEFxbm1LYnBGNkUzSjBoRk9CRm41QkFCRmtm?=
 =?utf-8?B?S0hFWnJmRnFjTzM2Rk03NFpzNlBQUHQ4dWhtZzB3bE5qZE1mZFhtQUJEQW5Q?=
 =?utf-8?B?MmlpWTFOcVZpUVczcG5ZQVBFU0JmaDNXRkhJNEgwM3FBSkZvOURET3NKcFJm?=
 =?utf-8?B?dlZKRW5lckhaN0wraWpOa20vVktpazRVWnVjMXNWWC9LSVdTYnJWUTRqU01u?=
 =?utf-8?B?Tkl4bDZ2cGtWNVN5cTRNNUdxR3NWWTZqdTJhdWxvanlIbXd1OUFiaEhsZVF6?=
 =?utf-8?B?Z29SeUJSUDdSTjg2T2ZCRlU3R2dSZ3UxejBZUzhEY2I3dDZJazRvcmg3N0Z0?=
 =?utf-8?B?L2kzRm5vc0JXaW1FY1NTcWlKTmo4UFNpM3hoRG9CRDlXaklwK01KT2NFZE5G?=
 =?utf-8?B?OUJlaERSWUNrTld5WlBLM3hCbDJwK3lTMWdzQ0FYMTJlU1ZJbTh6Q3gvMmQz?=
 =?utf-8?B?bWJIVUxQb1I4ODNtN1R3ZGVWVlBYaXRQODhqdjJjQ3ZEZysxVXNaRkJTUC9V?=
 =?utf-8?B?eGczN0JaSk1DZ2RQeVArTnV2Z0dSamtZV05IckNHRUFHZFFoVjA2WHh2dkJZ?=
 =?utf-8?B?bnZnZTEzb2lFTUZVNTVha3I1ZGQydVJKbDZQa3VMQ0szaEFhdTgvNUdNU1Ju?=
 =?utf-8?B?REJsT0NmV1QxMEpuek1MandMQXlidHhzK1U5QzJxUEovK2xuSDRzOS84VTcz?=
 =?utf-8?B?MWNZclU4T3pSTnFDeFhRbCtuT2EyTkxGQ00xajk0TDJ6TUg5MTJvYkFvZ0lU?=
 =?utf-8?B?Ukt0RG5QNGZLMDJuekczNWxSTGRETGw1VE1yb2ZKYlNqZnNHVTAyQ3p2Wity?=
 =?utf-8?B?OXB2ZXJ0SWhHNWYyU1VTVTF5RUNRVVNraTRNUFZwVHJ5RTNYTlRCdmtkbUZ5?=
 =?utf-8?B?RjZsb0NXNVVPb2dwa1ljNmxlbm1yU0hFZ1lpRTRUUFY2QUEvNlJteGZGbHlS?=
 =?utf-8?B?b3B5ajEzWEZRVitzWVRBR0plYXgrNFZNMUo5bjBSeHJUVm9Hd3pQeWZ3MkUy?=
 =?utf-8?B?L2EvVnpvMjlsSUdYdU1zaTZTWW1pZnN2UW1zZVlNRUxuL0VuRHFZelJMak9o?=
 =?utf-8?B?ZmdwWE9wTU9PWTljUXloK09jOTdTOW1WVHJ5NGIranowcGRNTTBUYk5oeW1u?=
 =?utf-8?B?Z0FRaGN4QS9aTURBdTRidmE2ZHNxVHBCcEZsakZWd2R0OXRBamJjdGYvZ2Rq?=
 =?utf-8?B?Yno3emZEbUx3RTl0ME5xRWtCMjVldThhdE1uZW9menZ6TWZuSmhwWGlLa0do?=
 =?utf-8?B?ZFV2MUVKeEtnT0IrTStDdTcrRncyTDFDckdxTXBXVCtWVDRqRGNQZFk2UXdN?=
 =?utf-8?Q?l61sjBkAHoOXYSS1oopU57dH8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92ee974-a0da-437b-ab4b-08dd10096498
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 00:04:28.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8yFZ4Iw9QSY+uqYHAE+1FJZas40mtZ9eIg5Oj+EPu7lOGV3AS4uqz/Pe0dtueWJoRQkxlAbS78HSZ8a5ygpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
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


Matthew Brost <matthew.brost@intel.com> writes:

[...]

> + * 3) Invalidation driver vfunc.
> + *
> + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> + *				 struct drm_gpusvm_notifier *notifier,
> + *				 const struct mmu_notifier_range *mmu_range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true, };
> + *		struct drm_gpusvm_range *range =3D NULL;
> + *
> + *		driver_invalidate_device_tlb(gpusvm, mmu_range->start, mmu_range->en=
d);
> + *
> + *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
> + *					  mmu_range->end) {
> + *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
> + *
> + *			if (mmu_range->event !=3D MMU_NOTIFY_UNMAP)

I've only glanced at this series as an interested onlooker so I
may have overlooked something obvious but why is it ok to skip notifiers
other than MMU_NOTIFY_UNMAP? Wouldn't you also need to clears GPU PTEs
in other cases?

 - Alistair

> + *				continue;
> + *
> + *			drm_gpusvm_range_set_unmapped(range, mmu_range);
> + *			driver_garbage_collector_add(gpusvm, range);
> + *		}
> + *	}
> + */
> +
> +#define DRM_GPUSVM_RANGE_START(_range)	((_range)->va.start)
> +#define DRM_GPUSVM_RANGE_END(_range)	((_range)->va.end - 1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node, u64, rb.__subtree=
_last,
> +		     DRM_GPUSVM_RANGE_START, DRM_GPUSVM_RANGE_END,
> +		     static __maybe_unused, range);
> +
> +#define DRM_GPUSVM_NOTIFIER_START(_notifier)	((_notifier)->interval.star=
t)
> +#define DRM_GPUSVM_NOTIFIER_END(_notifier)	((_notifier)->interval.end - =
1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node, u64,
> +		     rb.__subtree_last, DRM_GPUSVM_NOTIFIER_START,
> +		     DRM_GPUSVM_NOTIFIER_END, static __maybe_unused, notifier);
> +
> +/**
> + * npages_in_range() - Calculate the number of pages in a given range
> + * @start__: The start address of the range
> + * @end__: The end address of the range
> + *
> + * This macro calculates the number of pages in a given memory range,
> + * specified by the start and end addresses. It divides the difference
> + * between the end and start addresses by the page size (PAGE_SIZE) to
> + * determine the number of pages in the range.
> + *
> + * Return: The number of pages in the specified range.
> + */
> +#define npages_in_range(start__, end__)	\
> +	(((end__) - (start__)) >> PAGE_SHIFT)
> +
> +/**
> + * struct drm_gpusvm_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @destroy_work: Work structure for asynchronous zdd destruction
> + * @devmem_allocation: device memory allocation
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up a d=
evice
> + * memory allocation upon CPU page fault and asynchronously releasing de=
vice
> + * memory once the CPU has no page references. Asynchronous release is u=
seful
> + * because CPU page references can be dropped in IRQ contexts, while rel=
easing
> + * device memory likely requires sleeping locks.
> + */
> +struct drm_gpusvm_zdd {
> +	struct kref refcount;
> +	struct work_struct destroy_work;
> +	struct drm_gpusvm_devmem *devmem_allocation;
> +	void *device_private_page_owner;
> +};
> +
> +/**
> + * drm_gpusvm_zdd_destroy_work_func - Work function for destroying a zdd
> + * @w: Pointer to the work_struct
> + *
> + * This function releases device memory, puts GPU SVM range, and frees z=
dd.
> + */
> +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct *w)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D
> +		container_of(w, struct drm_gpusvm_zdd, destroy_work);
> +	const struct drm_gpusvm_devmem_ops *ops =3D zdd->devmem_allocation ?
> +		zdd->devmem_allocation->ops : NULL;
> +
> +	if (zdd->devmem_allocation && ops->devmem_release)
> +		ops->devmem_release(zdd->devmem_allocation);
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This function allocates and initializes a new zdd structure. It sets =
up the
> + * reference count and initializes the destroy work.
> + *
> + * Returns:
> + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_zdd *
> +drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> +{
> +	struct drm_gpusvm_zdd *zdd;
> +
> +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	INIT_WORK(&zdd->destroy_work, drm_gpusvm_zdd_destroy_work_func);
> +	zdd->devmem_allocation =3D NULL;
> +	zdd->device_private_page_owner =3D device_private_page_owner;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd stru=
cture.
> + *
> + * Returns: Pointer to the zdd structure.
> + */
> +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *=
zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous des=
truction.
> + */
> +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D
> +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> +
> +	if (zdd->devmem_allocation)
> +		WRITE_ONCE(zdd->devmem_allocation->detached, true);
> +	schedule_work(&zdd->destroy_work);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_put - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd stru=
cture
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_find - Find GPU SVM range from GPU SVM notifier
> + * @notifier: Pointer to the GPU SVM notifier structure.
> + * @start: Start address of the range
> + * @end: End address of the range
> + *
> + * Return: A pointer to the drm_gpusvm_range if found or NULL
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u=
64 end)
> +{
> +	return range_iter_first(&notifier->root, start, end - 1);
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU SVM ranges i=
n a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, star=
t__, end__)	\
> +	for ((range__) =3D drm_gpusvm_range_find((notifier__), (start__), (end_=
_)),	\
> +	     (next__) =3D __drm_gpusvm_range_next(range__);				\
> +	     (range__) && (range__->va.start < (end__));				\
> +	     (range__) =3D (next__), (next__) =3D __drm_gpusvm_range_next(range=
__))
> +
> +/**
> + * __drm_gpusvm_notifier_next - get the next drm_gpusvm_notifier in the =
list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available, or NU=
LL if
> + *         the current notifier is the last one or if the input notifier=
 is
> + *         NULL.
> + */
> +static struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{
> +	if (notifier && !list_is_last(&notifier->rb.entry,
> +				      &notifier->gpusvm->notifier_list))
> +		return list_next_entry(notifier, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM notifiers in a gp=
usvm
> + * @notifier__: Iterator variable for the notifiers
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end_=
_)		\
> +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root, (start__),=
 (end__) - 1);	\
> +	     (notifier__) && (notifier__->interval.start < (end__));			\
> +	     (notifier__) =3D __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe - Safely iterate over GPU SVM notif=
iers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm whil=
e
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, =
start__, end__)	\
> +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root, (start__),=
 (end__) - 1),	\
> +	     (next__) =3D __drm_gpusvm_notifier_next(notifier__);				\
> +	     (notifier__) && (notifier__->interval.start < (end__));			\
> +	     (notifier__) =3D (next__), (next__) =3D __drm_gpusvm_notifier_next=
(notifier__))
> +
> +/**
> + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM notifier.
> + * @mni: Pointer to the mmu_interval_notifier structure.
> + * @mmu_range: Pointer to the mmu_notifier_range structure.
> + * @cur_seq: Current sequence number.
> + *
> + * This function serves as a generic MMU notifier for GPU SVM. It sets t=
he MMU
> + * notifier sequence number and calls the driver invalidate vfunc under
> + * gpusvm->notifier_lock.
> + *
> + * Returns:
> + * true if the operation succeeds, false otherwise.
> + */
> +static bool
> +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
> +			       const struct mmu_notifier_range *mmu_range,
> +			       unsigned long cur_seq)
> +{
> +	struct drm_gpusvm_notifier *notifier =3D
> +		container_of(mni, typeof(*notifier), notifier);
> +	struct drm_gpusvm *gpusvm =3D notifier->gpusvm;
> +
> +	if (!mmu_notifier_range_blockable(mmu_range))
> +		return false;
> +
> +	down_write(&gpusvm->notifier_lock);
> +	mmu_interval_set_seq(mni, cur_seq);
> +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> +	up_write(&gpusvm->notifier_lock);
> +
> +	return true;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SV=
M
> + */
> +static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops =
=3D {
> +	.invalidate =3D drm_gpusvm_notifier_invalidate,
> +};
> +
> +/**
> + * drm_gpusvm_init - Initialize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @name: Name of the GPU SVM.
> + * @drm: Pointer to the DRM device structure.
> + * @mm: Pointer to the mm_struct for the address space.
> + * @device_private_page_owner: Device private pages owner.
> + * @mm_start: Start address of GPU SVM.
> + * @mm_range: Range of the GPU SVM.
> + * @notifier_size: Size of individual notifiers.
> + * @ops: Pointer to the operations structure for GPU SVM.
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range alloc=
ation.
> + *               Entries should be powers of 2 in descending order with =
last
> + *               entry being SZ_4K.
> + * @num_chunks: Number of chunks.
> + *
> + * This function initializes the GPU SVM.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure.
> + */
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const u64 *chunk_sizes, int num_chunks)
> +{
> +	if (!ops->invalidate || !num_chunks)
> +		return -EINVAL;
> +
> +	gpusvm->name =3D name;
> +	gpusvm->drm =3D drm;
> +	gpusvm->mm =3D mm;
> +	gpusvm->device_private_page_owner =3D device_private_page_owner;
> +	gpusvm->mm_start =3D mm_start;
> +	gpusvm->mm_range =3D mm_range;
> +	gpusvm->notifier_size =3D notifier_size;
> +	gpusvm->ops =3D ops;
> +	gpusvm->chunk_sizes =3D chunk_sizes;
> +	gpusvm->num_chunks =3D num_chunks;
> +
> +	mmgrab(mm);
> +	gpusvm->root =3D RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> +
> +	init_rwsem(&gpusvm->notifier_lock);
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&gpusvm->notifier_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure
> + * @fault_addr__: Fault address
> + *
> + * This macro finds the GPU SVM notifier associated with the fault addre=
ss.
> + *
> + * Returns:
> + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> + */
> +#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
> +	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
> +			    (fault_addr__ + 1))
> +
> +/**
> + * to_drm_gpusvm_notifier - retrieve the container struct for a given rb=
tree node
> + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_no=
tifier struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_notifier structure.
> + */
> +#define to_drm_gpusvm_notifier(__node)				\
> +	container_of((__node), struct drm_gpusvm_notifier, rb.node)
> +
> +/**
> + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function inserts the GPU SVM notifier into the GPU SVM RB tree a=
nd list.
> + */
> +static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	notifier_insert(notifier, &gpusvm->root);
> +
> +	node =3D rb_prev(&notifier->rb.node);
> +	if (node)
> +		head =3D &(to_drm_gpusvm_notifier(node))->rb.entry;
> +	else
> +		head =3D &gpusvm->notifier_list;
> +
> +	list_add(&notifier->rb.entry, head);
> +}
> +
> +/**
> + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM tructure
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + *
> + * This macro removes the GPU SVM notifier from the GPU SVM RB tree and =
list.
> + */
> +#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
> +	notifier_remove((notifier__), &(gpusvm__)->root);	\
> +	list_del(&(notifier__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_fini - Finalize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + *
> + * This function finalizes the GPU SVM by cleaning up any remaining rang=
es and
> + * notifiers, and dropping a reference to struct MM.
> + */
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0, LONG_MAX) =
{
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		/*
> +		 * Remove notifier first to avoid racing with any invalidation
> +		 */
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +		notifier->flags.removed =3D true;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, 0,
> +					       LONG_MAX)
> +			drm_gpusvm_range_remove(gpusvm, range);
> +	}
> +
> +	mmdrop(gpusvm->mm);
> +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> +}
> +
> +/**
> + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + *
> + * This function allocates and initializes the GPU SVM notifier structur=
e.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM notifier on success, ERR_PTR() on fa=
ilure.
> + */
> +static struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64 fault_addr)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	if (gpusvm->ops->notifier_alloc)
> +		notifier =3D gpusvm->ops->notifier_alloc();
> +	else
> +		notifier =3D kzalloc(sizeof(*notifier), GFP_KERNEL);
> +
> +	if (!notifier)
> +		return ERR_PTR(-ENOMEM);
> +
> +	notifier->gpusvm =3D gpusvm;
> +	notifier->interval.start =3D ALIGN_DOWN(fault_addr, gpusvm->notifier_si=
ze);
> +	notifier->interval.end =3D ALIGN(fault_addr + 1, gpusvm->notifier_size)=
;
> +	INIT_LIST_HEAD(&notifier->rb.entry);
> +	notifier->root =3D RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&notifier->range_list);
> +
> +	return notifier;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function frees the GPU SVM notifier structure.
> + */
> +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> +				     struct drm_gpusvm_notifier *notifier)
> +{
> +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> +
> +	if (gpusvm->ops->notifier_free)
> +		gpusvm->ops->notifier_free(notifier);
> +	else
> +		kfree(notifier);
> +}
> +
> +/**
> + * to_drm_gpusvm_range - retrieve the container struct for a given rbtre=
e node
> + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_ra=
nge struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_range structure.
> + */
> +#define to_drm_gpusvm_range(node__)	\
> +	container_of((node__), struct drm_gpusvm_range, rb.node)
> +
> +/**
> + * drm_gpusvm_range_insert - Insert GPU SVM range
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function inserts the GPU SVM range into the notifier RB tree and=
 list.
> + */
> +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier *notifier=
,
> +				    struct drm_gpusvm_range *range)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> +	range_insert(range, &notifier->root);
> +
> +	node =3D rb_prev(&range->rb.node);
> +	if (node)
> +		head =3D &(to_drm_gpusvm_range(node))->rb.entry;
> +	else
> +		head =3D &notifier->range_list;
> +
> +	list_add(&range->rb.entry, head);
> +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> +}
> +
> +/**
> + * __drm_gpusvm_range_remove - Remove GPU SVM range
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + * @range__: Pointer to the GPU SVM range structure
> + *
> + * This macro removes the GPU SVM range from the notifier RB tree and li=
st.
> + */
> +#define __drm_gpusvm_range_remove(notifier__, range__)		\
> +	range_remove((range__), &(notifier__)->root);		\
> +	list_del(&(range__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @fault_addr: Fault address
> + * @chunk_size: Chunk size
> + * @migrate_devmem: Flag indicating whether to migrate device memory
> + *
> + * This function allocates and initializes the GPU SVM range structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM range on success, ERR_PTR() on failu=
re.
> + */
> +static struct drm_gpusvm_range *
> +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> +		       struct drm_gpusvm_notifier *notifier,
> +		       u64 fault_addr, u64 chunk_size, bool migrate_devmem)
> +{
> +	struct drm_gpusvm_range *range;
> +
> +	if (gpusvm->ops->range_alloc)
> +		range =3D gpusvm->ops->range_alloc(gpusvm);
> +	else
> +		range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> +
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&range->refcount);
> +	range->gpusvm =3D gpusvm;
> +	range->notifier =3D notifier;
> +	range->va.start =3D ALIGN_DOWN(fault_addr, chunk_size);
> +	range->va.end =3D ALIGN(fault_addr + 1, chunk_size);
> +	INIT_LIST_HEAD(&range->rb.entry);
> +	range->notifier_seq =3D LONG_MAX;
> +	range->flags.migrate_devmem =3D migrate_devmem ? 1 : 0;
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_check_pages - Check pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @start: Start address
> + * @end: End address
> + *
> + * Check if pages between start and end have been faulted in on the CPU.=
 Use to
> + * prevent migration of pages without CPU backing store.
> + *
> + * Returns:
> + * True if pages have been faulted into CPU, False otherwise
> + */
> +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_notifier *notifier,
> +				   u64 start, u64 end)
> +{
> +	struct hmm_range hmm_range =3D {
> +		.default_flags =3D 0,
> +		.notifier =3D &notifier->notifier,
> +		.start =3D start,
> +		.end =3D end,
> +		.dev_private_owner =3D gpusvm->device_private_page_owner,
> +	};
> +	unsigned long timeout =3D
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns;
> +	unsigned long npages =3D npages_in_range(start, end);
> +	int err, i;
> +
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return false;
> +
> +	hmm_range.notifier_seq =3D mmu_interval_read_begin(&notifier->notifier)=
;
> +	hmm_range.hmm_pfns =3D pfns;
> +
> +	while (true) {
> +		err =3D hmm_range_fault(&hmm_range);
> +		if (err =3D=3D -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =3D mmu_interval_read_begin(&notifier->notifie=
r);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (err)
> +		goto err_free;
> +
> +	for (i =3D 0; i < npages;) {
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			err =3D -EFAULT;
> +			goto err_free;
> +		}
> +		i +=3D 0x1 << hmm_pfn_to_map_order(pfns[i]);
> +	}
> +
> +err_free:
> +	kvfree(pfns);
> +	return err ? false : true;
> +}
> +
> +/**
> + * drm_gpusvm_range_chunk_size - Determine chunk size for GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @vas: Pointer to the virtual memory area structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @check_pages: Flag indicating whether to check pages
> + *
> + * This function determines the chunk size for the GPU SVM range based o=
n the
> + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the =
virtual
> + * memory area boundaries.
> + *
> + * Returns:
> + * Chunk size on success, LONG_MAX on failure.
> + */
> +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier,
> +				       struct vm_area_struct *vas,
> +				       u64 fault_addr, u64 gpuva_start,
> +				       u64 gpuva_end, bool check_pages)
> +{
> +	u64 start, end;
> +	int i =3D 0;
> +
> +retry:
> +	for (; i < gpusvm->num_chunks; ++i) {
> +		start =3D ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
> +		end =3D ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> +
> +		if (start >=3D vas->vm_start && end <=3D vas->vm_end &&
> +		    start >=3D notifier->interval.start &&
> +		    end <=3D notifier->interval.end &&
> +		    start >=3D gpuva_start && end <=3D gpuva_end)
> +			break;
> +	}
> +
> +	if (i =3D=3D gpusvm->num_chunks)
> +		return LONG_MAX;
> +
> +	/*
> +	 * If allocation more than page, ensure not to overlap with existing
> +	 * ranges.
> +	 */
> +	if (end - start !=3D SZ_4K) {
> +		struct drm_gpusvm_range *range;
> +
> +		range =3D drm_gpusvm_range_find(notifier, start, end);
> +		if (range) {
> +			++i;
> +			goto retry;
> +		}
> +
> +		/*
> +		 * XXX: Only create range on pages CPU has faulted in. Without
> +		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
> +		 * process-many-malloc' fails. In the failure case, each process
> +		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
> +		 * ranges. When migrating the SVM ranges, some processes fail in
> +		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages !=3D npages'
> +		 * and then upon drm_gpusvm_range_get_pages device pages from
> +		 * other processes are collected + faulted in which creates all
> +		 * sorts of problems. Unsure exactly how this happening, also
> +		 * problem goes away if 'xe_exec_system_allocator --r
> +		 * process-many-malloc' mallocs at least 64k at a time.
> +		 */
> +		if (check_pages &&
> +		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
> +			++i;
> +			goto retry;
> +		}
> +	}
> +
> +	return end - start;
> +}
> +
> +/**
> + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @ctx: GPU SVM context
> + *
> + * This function finds or inserts a newly allocated a GPU SVM range base=
d on the
> + * fault address. Caller must hold a lock to protect range lookup and in=
sertion.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range on success, ERR_PTR() on failure.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_add=
r,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct drm_gpusvm_range *range;
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	bool notifier_alloc =3D false;
> +	u64 chunk_size;
> +	int err;
> +	bool migrate_devmem;
> +
> +	if (fault_addr < gpusvm->mm_start ||
> +	    fault_addr > gpusvm->mm_start + gpusvm->mm_range) {
> +		err =3D -EINVAL;
> +		goto err_out;
> +	}
> +
> +	if (!mmget_not_zero(mm)) {
> +		err =3D -EFAULT;
> +		goto err_out;
> +	}
> +
> +	notifier =3D drm_gpusvm_notifier_find(gpusvm, fault_addr);
> +	if (!notifier) {
> +		notifier =3D drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
> +		if (IS_ERR(notifier)) {
> +			err =3D PTR_ERR(notifier);
> +			goto err_mmunlock;
> +		}
> +		notifier_alloc =3D true;
> +		err =3D mmu_interval_notifier_insert(&notifier->notifier,
> +						   mm, notifier->interval.start,
> +						   notifier->interval.end -
> +						   notifier->interval.start,
> +						   &drm_gpusvm_notifier_ops);
> +		if (err)
> +			goto err_notifier;
> +	}
> +
> +	mmap_read_lock(mm);
> +
> +	vas =3D vma_lookup(mm, fault_addr);
> +	if (!vas) {
> +		err =3D -ENOENT;
> +		goto err_notifier_remove;
> +	}
> +
> +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> +		err =3D -EPERM;
> +		goto err_notifier_remove;
> +	}
> +
> +	range =3D drm_gpusvm_range_find(notifier, fault_addr, fault_addr + 1);
> +	if (range)
> +		goto out_mmunlock;
> +	/*
> +	 * XXX: Short-circuiting migration based on migrate_vma_* current
> +	 * limitations. If/when migrate_vma_* add more support, this logic will
> +	 * have to change.
> +	 */
> +	migrate_devmem =3D ctx->devmem_possible &&
> +		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
> +
> +	chunk_size =3D drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
> +						 fault_addr, gpuva_start,
> +						 gpuva_end, migrate_devmem &&
> +						 ctx->check_pages);
> +	if (chunk_size =3D=3D LONG_MAX) {
> +		err =3D -EINVAL;
> +		goto err_notifier_remove;
> +	}
> +
> +	range =3D drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr, chunk_si=
ze,
> +				       migrate_devmem);
> +	if (IS_ERR(range)) {
> +		err =3D PTR_ERR(range);
> +		goto err_notifier_remove;
> +	}
> +
> +	drm_gpusvm_range_insert(notifier, range);
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> +
> +out_mmunlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return range;
> +
> +err_notifier_remove:
> +	mmap_read_unlock(mm);
> +	if (notifier_alloc)
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +err_notifier:
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +err_mmunlock:
> +	mmput(mm);
> +err_out:
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * __drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SV=
M range (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @npages: Number of pages to unmap
> + *
> + * This function unmap pages associated with a GPU SVM range. Assumes an=
d
> + * asserts correct locking is in place when called.
> + */
> +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +					   struct drm_gpusvm_range *range,
> +					   unsigned long npages)
> +{
> +	unsigned long i, j;
> +	struct drm_pagemap *dpagemap =3D range->dpagemap;
> +	struct device *dev =3D gpusvm->drm->dev;
> +
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->flags.has_dma_mapping) {
> +		for (i =3D 0, j =3D 0; i < npages; j++) {
> +			struct drm_pagemap_dma_addr *addr =3D &range->dma_addr[j];
> +
> +			if (addr->proto =3D=3D DRM_INTERCONNECT_SYSTEM) {
> +				dma_unmap_page(dev,
> +					       addr->addr,
> +					       PAGE_SIZE << addr->order,
> +					       addr->dir);
> +			} else if (dpagemap && dpagemap->ops->unmap_dma) {
> +				dpagemap->ops->unmap_dma(dpagemap,
> +							 dev,
> +							 *addr);
> +			}
> +			i +=3D 1 << addr->order;
> +		}
> +		range->flags.has_devmem_pages =3D false;
> +		range->flags.has_dma_mapping =3D false;
> +		range->dpagemap =3D NULL;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_free_pages - Free pages associated with a GPU SVM ra=
nge
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function free pages associated with a GPU SVM range.
> + */
> +static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> +					struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->dma_addr) {
> +		kvfree(range->dma_addr);
> +		range->dma_addr =3D NULL;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_remove - Remove GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function removes the specified GPU SVM range and also removes th=
e parent
> + * GPU SVM notifier if no more ranges remain in the notifier. The caller=
 must
> + * hold a lock to protect range and notifier removal.
> + */
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range)
> +{
> +	unsigned long npages =3D npages_in_range(range->va.start, range->va.end=
);
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	notifier =3D drm_gpusvm_notifier_find(gpusvm, range->va.start);
> +	if (WARN_ON_ONCE(!notifier))
> +		return;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> +	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_range_remove(notifier, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	drm_gpusvm_range_put(range);
> +
> +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> +		if (!notifier->flags.removed)
> +			mmu_interval_notifier_remove(&notifier->notifier);
> +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function increments the reference count of the specified GPU SVM=
 range.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> +{
> +	kref_get(&range->refcount);
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> + * @refcount: Pointer to the reference counter embedded in the GPU SVM r=
ange
> + *
> + * This function destroys the specified GPU SVM range when its reference=
 count
> + * reaches zero. If a custom range-free function is provided, it is invo=
ked to
> + * free the range; otherwise, the range is deallocated using kfree().
> + */
> +static void drm_gpusvm_range_destroy(struct kref *refcount)
> +{
> +	struct drm_gpusvm_range *range =3D
> +		container_of(refcount, struct drm_gpusvm_range, refcount);
> +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> +
> +	if (gpusvm->ops->range_free)
> +		gpusvm->ops->range_free(range);
> +	else
> +		kfree(range);
> +}
> +
> +/**
> + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function decrements the reference count of the specified GPU SVM=
 range
> + * and frees it when the count reaches zero.
> + */
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> +{
> +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid - GPU SVM range pages valid
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected=
 be
> + * called holding gpusvm->notifier_lock and as the last step before comm=
iting a
> + * GPU binding.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range pages valid unl=
ocked
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected=
 be
> + * called without holding gpusvm->notifier_lock.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +static bool
> +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> +				      struct drm_gpusvm_range *range)
> +{
> +	bool pages_valid;
> +
> +	if (!range->dma_addr)
> +		return false;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	pages_valid =3D drm_gpusvm_range_pages_valid(gpusvm, range);
> +	if (!pages_valid)
> +		drm_gpusvm_range_free_pages(gpusvm, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	return pages_valid;
> +}
> +
> +/**
> + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are map=
ped for
> + * DMA access.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct mmu_interval_notifier *notifier =3D &range->notifier->notifier;
> +	struct hmm_range hmm_range =3D {
> +		.default_flags =3D HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> +			HMM_PFN_REQ_WRITE),
> +		.notifier =3D notifier,
> +		.start =3D range->va.start,
> +		.end =3D range->va.end,
> +		.dev_private_owner =3D gpusvm->device_private_page_owner,
> +	};
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct drm_gpusvm_zdd *zdd;
> +	unsigned long timeout =3D
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long i, j;
> +	unsigned long npages =3D npages_in_range(range->va.start, range->va.end=
);
> +	unsigned long num_dma_mapped;
> +	unsigned int order =3D 0;
> +	unsigned long *pfns;
> +	struct page **pages;
> +	int err =3D 0;
> +	struct dev_pagemap *pagemap;
> +	struct drm_pagemap *dpagemap;
> +
> +retry:
> +	hmm_range.notifier_seq =3D mmu_interval_read_begin(notifier);
> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +		goto set_seqno;
> +
> +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return -ENOMEM;
> +
> +	if (!mmget_not_zero(mm)) {
> +		err =3D -EFAULT;
> +		goto err_out;
> +	}
> +
> +	hmm_range.hmm_pfns =3D pfns;
> +	while (true) {
> +		mmap_read_lock(mm);
> +		err =3D hmm_range_fault(&hmm_range);
> +		mmap_read_unlock(mm);
> +
> +		if (err =3D=3D -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =3D mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	mmput(mm);
> +	if (err)
> +		goto err_free;
> +
> +	pages =3D (struct page **)pfns;
> +map_pages:
> +	/*
> +	 * Perform all dma mappings under the notifier lock to not
> +	 * access freed pages. A notifier will either block on
> +	 * the notifier lock or unmap dma.
> +	 */
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +		goto retry;
> +	}
> +
> +	if (!range->dma_addr) {
> +		/* Unlock and restart mapping to allocate memory. */
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +		range->dma_addr =3D kvmalloc_array(npages, sizeof(*range->dma_addr),
> +						 GFP_KERNEL);
> +		if (!range->dma_addr) {
> +			err =3D -ENOMEM;
> +			goto err_free;
> +		}
> +		goto map_pages;
> +	}
> +
> +	zdd =3D NULL;
> +	num_dma_mapped =3D 0;
> +	for (i =3D 0, j =3D 0; i < npages; ++j) {
> +		struct page *page =3D hmm_pfn_to_page(pfns[i]);
> +
> +		order =3D hmm_pfn_to_map_order(pfns[i]);
> +		if (is_device_private_page(page) || is_device_coherent_page(page)) {
> +			if (zdd !=3D page->zone_device_data && i > 0) {
> +				err =3D -EOPNOTSUPP;
> +				goto err_unmap;
> +			}
> +			zdd =3D page->zone_device_data;
> +			if (pagemap !=3D page->pgmap) {
> +				if (i > 0) {
> +					err =3D -EOPNOTSUPP;
> +					goto err_unmap;
> +				}
> +
> +				pagemap =3D page->pgmap;
> +				dpagemap =3D zdd->devmem_allocation->dpagemap;
> +				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
> +					/*
> +					 * Raced. This is not supposed to happen
> +					 * since hmm_range_fault() should've migrated
> +					 * this page to system.
> +					 */
> +					err =3D -EAGAIN;
> +					goto err_unmap;
> +				}
> +			}
> +			range->dma_addr[j] =3D
> +				dpagemap->ops->map_dma(dpagemap, gpusvm->drm->dev,
> +						       page, order,
> +						       DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev, range->dma_addr[j].addr)) {
> +				err =3D -EFAULT;
> +				goto err_unmap;
> +			}
> +
> +			pages[i] =3D page;
> +		} else {
> +			dma_addr_t addr;
> +
> +			if (is_zone_device_page(page) || zdd) {
> +				err =3D -EOPNOTSUPP;
> +				goto err_unmap;
> +			}
> +
> +			addr =3D dma_map_page(gpusvm->drm->dev,
> +					    page, 0,
> +					    PAGE_SIZE << order,
> +					    DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
> +				err =3D -EFAULT;
> +				goto err_unmap;
> +			}
> +
> +			range->dma_addr[j] =3D drm_pagemap_dma_addr_encode
> +				(addr, DRM_INTERCONNECT_SYSTEM, order,
> +				 DMA_BIDIRECTIONAL);
> +		}
> +		i +=3D 1 << order;
> +		num_dma_mapped =3D i;
> +	}
> +
> +	range->flags.has_dma_mapping =3D true;
> +	if (zdd) {
> +		range->flags.has_devmem_pages =3D true;
> +		range->dpagemap =3D dpagemap;
> +	}
> +
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +	kvfree(pfns);
> +set_seqno:
> +	range->notifier_seq =3D hmm_range.notifier_seq;
> +
> +	return 0;
> +
> +err_unmap:
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +err_free:
> +	kvfree(pfns);
> +err_out:
> +	if (err =3D=3D -EAGAIN)
> +		goto retry;
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM =
range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function unmaps pages associated with a GPU SVM range. If @in_no=
tifier
> + * is set, it is assumed that gpusvm->notifier_lock is held in write mod=
e; if it
> + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be cal=
led on
> + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate fo=
r IOMMU
> + * security model.
> + */
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx)
> +{
> +	unsigned long npages =3D npages_in_range(range->va.start, range->va.end=
);
> +
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_page - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_gpusvm_migration_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_pages - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function puts an array of pages.
> + */
> +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> +					   unsigned long *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> +		migrate_pfn[i] =3D 0;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_get_devmem_page - Get a reference to a device memory page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zo=
ne
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_gpusvm_get_devmem_page(struct page *page,
> +				     struct drm_gpusvm_zdd *zdd)
> +{
> +	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migr=
ation
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU SVM. It
> + * iterates over each page frame number provided in @migrate_pfn, maps t=
he
> + * corresponding page, and stores the DMA address in the provided @dma_a=
ddr
> + * array.
> + *
> + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> +					dma_addr_t *dma_addr,
> +					long unsigned int *migrate_pfn,
> +					unsigned long npages,
> +					enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *page =3D migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] =3D dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for =
GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU Shared=
 Virtual
> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr=
, checks
> + * if it's valid and not already unmapped, and unmaps the corresponding =
page.
> + */
> +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> +					   dma_addr_t *dma_addr,
> +					   unsigned long npages,
> +					   enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_devmem - Migrate GPU SVM range to device memory
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @devmem_allocation: Pointer to the device memory allocation. The call=
er
> + *                     should hold a reference to the device memory allo=
cation,
> + *                     which should be dropped via ops->devmem_release o=
r upon
> + *                     the failure of this function.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to device memory. =
It performs the
> + * necessary setup and invokes the driver-specific operations for migrat=
ion to
> + * device memory. Upon successful return, @devmem_allocation can safely =
reference @range
> + * until ops->devmem_release is called which only upon successful return=
.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops =3D devmem_allocation->ops;
> +	u64 start =3D range->va.start, end =3D range->va.end;
> +	struct migrate_vma migrate =3D {
> +		.start		=3D start,
> +		.end		=3D end,
> +		.pgmap_owner	=3D gpusvm->device_private_page_owner,
> +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	unsigned long i, npages =3D npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_gpusvm_zdd *zdd =3D NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	if (!range->flags.migrate_devmem)
> +		return -EINVAL;
> +
> +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem || !ops->copy_to_=
ram)
> +		return -EOPNOTSUPP;
> +
> +	if (!mmget_not_zero(mm)) {
> +		err =3D -EFAULT;
> +		goto err_out;
> +	}
> +	mmap_read_lock(mm);
> +
> +	vas =3D vma_lookup(mm, start);
> +	if (!vas) {
> +		err =3D -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err =3D -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err =3D -EBUSY;
> +		goto err_mmunlock;
> +	}
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_mmunlock;
> +	}
> +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages=
;
> +
> +	zdd =3D drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
> +	if (!zdd) {
> +		err =3D -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma =3D vas;
> +	migrate.src =3D buf;
> +	migrate.dst =3D migrate.src + npages;
> +
> +	err =3D migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/*
> +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages !=3D npages, =
not
> +	 * always an error. Need to revisit possible cases and how to handle. W=
e
> +	 * could prefault on migrate.cpages !=3D npages via hmm_range_fault.
> +	 */
> +
> +	if (!migrate.cpages) {
> +		err =3D -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages !=3D npages) {
> +		err =3D -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst=
);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   migrate.src, npages, DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] =3D page;
> +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> +		drm_gpusvm_get_devmem_page(page, zdd);
> +	}
> +
> +	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind devmem allocation to range and zdd */
> +	WRITE_ONCE(zdd->devmem_allocation, devmem_allocation);	/* Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages=
,
> +				       DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_gpusvm_zdd_put(zdd);
> +	kvfree(buf);
> +err_mmunlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_populate_ram_pfn - Populate RAM PFNs for a VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @npages: Number of pages to populate
> + * @mpages: Number of pages to migrate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the RAM migrate page frame numbers (PFNs) for=
 the
> + * specified VM area structure. It allocates and locks pages in the VM a=
rea for
> + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if N=
ULL use
> + * alloc_page for allocation.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *va=
s,
> +					       unsigned long npages,
> +					       unsigned long *mpages,
> +					       unsigned long *src_mpfn,
> +					       unsigned long *mpfn, u64 addr)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> +		struct page *page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		if (vas)
> +			page =3D alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +		else
> +			page =3D alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			return -ENOMEM;
> +
> +		lock_page(page);
> +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> +		++*mpages;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_evict_to_ram - Evict GPU SVM range to RAM
> + * @devmem_allocation: Pointer to the device memory allocation
> + *
> + * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock=
 and
> + * migration done via migrate_device_* functions.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops =3D devmem_allocation->ops;
> +	unsigned long npages, mpages =3D 0;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> +
> +retry:
> +	if (!mmget_not_zero(devmem_allocation->mm))
> +		return -EFAULT;
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_out;
> +	}
> +	src =3D buf;
> +	dst =3D buf + (sizeof(*src) * npages);
> +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +
> +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D migrate_device_prepopulated_range(src, npages);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D drm_gpusvm_migrate_populate_ram_pfn(NULL, npages, &mpages, src,
> +						  dst, 0);
> +	if (err || !mpages)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   dst, npages, DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(src[i]);
> +
> +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages=
,
> +				       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmput_async(devmem_allocation->mm);
> +	if (!err && !READ_ONCE(devmem_allocation->detached)) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * __drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified GPU SV=
M range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> +				       void *device_private_page_owner,
> +				       struct page *page, u64 fault_addr,
> +				       u64 size)
> +{
> +	struct migrate_vma migrate =3D {
> +		.vma		=3D vas,
> +		.pgmap_owner	=3D device_private_page_owner,
> +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	=3D page,
> +	};
> +	struct drm_gpusvm_zdd *zdd;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct device *dev;
> +	unsigned long npages, mpages =3D 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	u64 start, end;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	start =3D ALIGN_DOWN(fault_addr, size);
> +	end =3D ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start =3D vas->vm_start;
> +	if (end > vas->vm_end)
> +		end =3D vas->vm_end;
> +
> +	migrate.start =3D start;
> +	migrate.end =3D end;
> +	npages =3D npages_in_range(start, end);
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages=
;
> +
> +	migrate.vma =3D vas;
> +	migrate.src =3D buf;
> +	migrate.dst =3D migrate.src + npages;
> +
> +	err =3D migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i =3D 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page =3D migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd =3D page->zone_device_data;
> +	ops =3D zdd->devmem_allocation->ops;
> +	dev =3D zdd->devmem_allocation->dev;
> +
> +	err =3D drm_gpusvm_migrate_populate_ram_pfn(vas, npages, &mpages,
> +						  migrate.src, migrate.dst,
> +						  start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages=
,
> +					   DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> +
> +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> +				       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_evict - Evict GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function evicts the specified GPU SVM range.
> + */
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_range *range)
> +{
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct vm_area_struct *vas;
> +
> +	if (!mmget_not_zero(mm))
> +		return;
> +
> +	mmap_read_lock(mm);
> +	vas =3D vma_lookup(mm, range->va.start);
> +	if (!vas)
> +		goto unlock;
> +
> +	__drm_gpusvm_migrate_to_ram(vas, gpusvm->device_private_page_owner,
> +				    NULL, range->va.start,
> +				    range->va.end - range->va.start);
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +}
> +
> +/**
> + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a=
 page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device data
> + * associated with a page when it is being released.
> + */
> +static void drm_gpusvm_page_free(struct page *page)
> +{
> +	drm_gpusvm_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault =
handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a GPU SVM range=
 to RAM.
> + * It retrieves the GPU SVM range information from the faulting page and=
 invokes
> + * the internal migration function to migrate the range back to RAM.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D vmf->page->zone_device_data;
> +	int err;
> +
> +	err =3D __drm_gpusvm_migrate_to_ram(vmf->vma,
> +					  zdd->device_private_page_owner,
> +					  vmf->page, vmf->address,
> +					  zdd->devmem_allocation->size);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +/**
> + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> + */
> +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops =3D {
> +	.page_free =3D drm_gpusvm_page_free,
> +	.migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> +};
> +
> +/**
> + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operati=
ons
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> +{
> +	return &drm_gpusvm_pagemap_ops;
> +}
> +
> +/**
> + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given a=
ddress range
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @start: Start address
> + * @end: End address
> + *
> + * Returns:
> + * True if GPU SVM has mapping, False otherwise
> + */
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 en=
d)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> +		struct drm_gpusvm_range *range =3D NULL;
> +
> +		drm_gpusvm_for_each_range(range, notifier, start, end)
> +			return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpu=
svm.h
> new file mode 100644
> index 000000000000..15ec22d4f9a5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> @@ -0,0 +1,447 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __DRM_GPUSVM_H__
> +#define __DRM_GPUSVM_H__
> +
> +#include <linux/kref.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/workqueue.h>
> +
> +struct dev_pagemap_ops;
> +struct drm_device;
> +struct drm_gpusvm;
> +struct drm_gpusvm_notifier;
> +struct drm_gpusvm_ops;
> +struct drm_gpusvm_range;
> +struct drm_gpusvm_devmem;
> +struct drm_pagemap;
> +struct drm_pagemap_dma_addr;
> +
> +/**
> + * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM devic=
e memory
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (=
SVM)
> + * device memory. These operations are provided by the GPU driver to man=
age device memory
> + * allocations and perform operations such as migration between device m=
emory and system
> + * RAM.
> + */
> +struct drm_gpusvm_devmem_ops {
> +	/**
> +	 * @devmem_release: Release device memory allocation (optional)
> +	 * @devmem_allocation: device memory allocation
> +	 *
> +	 * This function shall release device memory allocation and expects to =
drop a
> +	 * reference to device memory allocation.
> +	 */
> +	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
> +
> +	/**
> +	 * @populate_devmem_pfn: Populate device memory PFN (required for migra=
tion)
> +	 * @devmem_allocation: device memory allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * This function shall populate device memory page frame numbers (PFN).
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
> +				 unsigned long npages, unsigned long *pfn);
> +
> +	/**
> +	 * @copy_to_devmem: Copy to device memory (required for migration)
> +	 * @pages: Pointer to array of device memory pages (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to device memory.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_devmem)(struct page **pages,
> +			      dma_addr_t *dma_addr,
> +			      unsigned long npages);
> +
> +	/**
> +	 * @copy_to_ram: Copy to system RAM (required for migration)
> +	 * @pages: Pointer to array of device memory pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to system RAM.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_ram)(struct page **pages,
> +			   dma_addr_t *dma_addr,
> +			   unsigned long npages);
> +};
> +
> +/**
> + * struct drm_gpusvm_devmem - Structure representing a GPU SVM device me=
mory allocation
> + *
> + * @dev: Pointer to the device structure which device memory allocation =
belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap of the pages this allocation belong=
s to.
> + * @size: Size of device memory allocation
> + * @detached: device memory allocations is detached from device pages
> + */
> +struct drm_gpusvm_devmem {
> +	struct device *dev;
> +	struct mm_struct *mm;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct drm_pagemap *dpagemap;
> +	size_t size;
> +	bool detached;
> +};
> +
> +/**
> + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (=
SVM).
> + * These operations are provided by the GPU driver to manage SVM ranges =
and
> + * notifiers.
> + */
> +struct drm_gpusvm_ops {
> +	/**
> +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> +	 *
> +	 * This function shall allocate a GPU SVM notifier.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failur=
e.
> +	 */
> +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> +
> +	/**
> +	 * @notifier_free: Free a GPU SVM notifier (optional)
> +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> +	 *
> +	 * This function shall free a GPU SVM notifier.
> +	 */
> +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> +
> +	/**
> +	 * @range_alloc: Allocate a GPU SVM range (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 *
> +	 * This function shall allocate a GPU SVM range.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> +	 */
> +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> +
> +	/**
> +	 * @range_free: Free a GPU SVM range (optional)
> +	 * @range: Pointer to the GPU SVM range to be freed
> +	 *
> +	 * This function shall free a GPU SVM range.
> +	 */
> +	void (*range_free)(struct drm_gpusvm_range *range);
> +
> +	/**
> +	 * @invalidate: Invalidate GPU SVM notifier (required)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @notifier: Pointer to the GPU SVM notifier
> +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> +	 *
> +	 * This function shall invalidate the GPU page tables. It can safely
> +	 * walk the notifier range RB tree/list in this function. Called while
> +	 * holding the notifier lock.
> +	 */
> +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> +			   struct drm_gpusvm_notifier *notifier,
> +			   const struct mmu_notifier_range *mmu_range);
> +};
> +
> +/**
> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifie=
r
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: MMU interval notifier
> + * @interval: Interval for the notifier
> + * @rb: Red-black tree node for the parent GPU SVM structure notifier tr=
ee
> + * @root: Cached root node of the RB tree containing ranges
> + * @range_list: List head containing of ranges in the same order they ap=
pear in
> + *              interval tree. This is useful to keep iterating ranges w=
hile
> + *              doing modifications to RB tree.
> + * @flags.removed: Flag indicating whether the MMU interval notifier has=
 been
> + *                 removed
> + *
> + * This structure represents a GPU SVM notifier.
> + */
> +struct drm_gpusvm_notifier {
> +	struct drm_gpusvm *gpusvm;
> +	struct mmu_interval_notifier notifier;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} interval;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct rb_root_cached root;
> +	struct list_head range_list;
> +	struct {
> +		u32 removed : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @rb: Red-black tree node for the parent GPU SVM notifier structure ra=
nge tree
> + * @va: Virtual address range
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @dma_addr: DMA address array
> + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mappi=
ng.
> + * Note this is assuming only one drm_pagemap per range is allowed.
> + * @flags.migrate_devmem: Flag indicating whether the range can be migra=
ted to device memory
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been partially=
 unmapped
> + * @flags.has_devmem_pages: Flag indicating if the range has devmem page=
s
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mappin=
g
> + *
> + * This structure represents a GPU SVM range used for tracking memory ra=
nges
> + * mapped in a DRM device.
> + */
> +struct drm_gpusvm_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +	struct kref refcount;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} va;
> +	unsigned long notifier_seq;
> +	struct drm_pagemap_dma_addr *dma_addr;
> +	struct drm_pagemap *dpagemap;
> +	struct {
> +		/* All flags below must be set upon creation */
> +		u16 migrate_devmem : 1;
> +		/* All flags below must be set / cleared under notifier lock */
> +		u16 unmapped : 1;
> +		u16 partial_unmap : 1;
> +		u16 has_devmem_pages : 1;
> +		u16 has_dma_mapping : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm - GPU SVM structure
> + *
> + * @name: Name of the GPU SVM
> + * @drm: Pointer to the DRM device structure
> + * @mm: Pointer to the mm_struct for the address space
> + * @device_private_page_owner: Device private pages owner
> + * @mm_start: Start address of GPU SVM
> + * @mm_range: Range of the GPU SVM
> + * @notifier_size: Size of individual notifiers
> + * @ops: Pointer to the operations structure for GPU SVM
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range alloc=
ation.
> + *               Entries should be powers of 2 in descending order.
> + * @num_chunks: Number of chunks
> + * @notifier_lock: Read-write semaphore for protecting notifier operatio=
ns
> + * @root: Cached root node of the Red-Black tree containing GPU SVM noti=
fiers
> + * @notifier_list: list head containing of notifiers in the same order t=
hey
> + *                 appear in interval tree. This is useful to keep itera=
ting
> + *                 notifiers while doing modifications to RB tree.
> + *
> + * This structure represents a GPU SVM (Shared Virtual Memory) used for =
tracking
> + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> + *
> + * No reference counting is provided, as this is expected to be embedded=
 in the
> + * driver VM structure along with the struct drm_gpuvm, which handles re=
ference
> + * counting.
> + */
> +struct drm_gpusvm {
> +	const char *name;
> +	struct drm_device *drm;
> +	struct mm_struct *mm;
> +	void *device_private_page_owner;
> +	u64 mm_start;
> +	u64 mm_range;
> +	u64 notifier_size;
> +	const struct drm_gpusvm_ops *ops;
> +	const u64 *chunk_sizes;
> +	int num_chunks;
> +	struct rw_semaphore notifier_lock;
> +	struct rb_root_cached root;
> +	struct list_head notifier_list;
> +};
> +
> +/**
> + * struct drm_gpusvm_ctx - DRM GPU SVM context
> + *
> + * @in_notifier: entering from a MMU notifier
> + * @read_only: operating on read-only memory
> + * @devmem_possible: possible to use device memory
> + * @check_pages: check pages and only create range for pages faulted in
> + *
> + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> + */
> +struct drm_gpusvm_ctx {
> +	u32 in_notifier :1;
> +	u32 read_only :1;
> +	u32 devmem_possible :1;
> +	u32 check_pages :1;
> +};
> +
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const u64 *chunk_sizes, int num_chunks);
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_add=
r,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range);
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_range *range);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> +
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range);
> +
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx);
> +
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx);
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)=
;
> +
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> +
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 en=
d);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u=
64 end);
> +
> +/**
> + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, take lock
> + */
> +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> +	down_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, drop lock
> + */
> +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> +	up_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> + * @range: a pointer to the current GPU SVM range
> + *
> + * Return: A pointer to the next drm_gpusvm_range if available, or NULL =
if the
> + *         current range is the last one or if the input range is NULL.
> + */
> +static inline struct drm_gpusvm_range *
> +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> +{
> +	if (range && !list_is_last(&range->rb.entry,
> +				   &range->notifier->range_list))
> +		return list_next_entry(range, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges. If set, it indicates the =
start of
> + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the r=
ange.
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier. It i=
s safe
> + * to use while holding the driver SVM lock or the notifier lock.
> + */
> +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> +	for ((range__) =3D (range__) ?:					\
> +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> +	     (range__) && (range__->va.start < (end__));		\
> +	     (range__) =3D __drm_gpusvm_range_next(range__))
> +
> +/**
> + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> + * @range: Pointer to the GPU SVM range structure.
> + * @mmu_range: Pointer to the MMU notifier range structure.
> + *
> + * This function marks a GPU SVM range as unmapped and sets the partial_=
unmap flag
> + * if the range partially falls within the provided MMU notifier range.
> + */
> +static inline void
> +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> +			      const struct mmu_notifier_range *mmu_range)
> +{
> +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> +
> +	range->flags.unmapped =3D true;
> +	if (range->va.start < mmu_range->start ||
> +	    range->va.end > mmu_range->end)
> +		range->flags.partial_unmap =3D true;
> +}
> +
> +/**
> + * drm_gpusvm_devmem_init - Initialize a GPU SVM device memory allocatio=
n
> + *
> + * @dev: Pointer to the device structure which device memory allocation =
belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap we're allocating from.
> + * @size: Size of device memory allocation
> + */
> +static inline void
> +drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> +		       struct device *dev, struct mm_struct *mm,
> +		       const struct drm_gpusvm_devmem_ops *ops,
> +		       struct drm_pagemap *dpagemap, size_t size)
> +{
> +	devmem_allocation->dev =3D dev;
> +	devmem_allocation->mm =3D mm;
> +	devmem_allocation->ops =3D ops;
> +	devmem_allocation->dpagemap =3D dpagemap;
> +	devmem_allocation->size =3D size;
> +}
> +
> +#endif /* __DRM_GPUSVM_H__ */

