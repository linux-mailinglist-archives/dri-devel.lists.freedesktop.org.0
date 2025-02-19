Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA6AA3B196
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 07:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DF510E462;
	Wed, 19 Feb 2025 06:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T9vHVlRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFC710E461;
 Wed, 19 Feb 2025 06:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP3fe3Y6zFQLJCnC2+45u0crm1o5of5dCQSXyCOM4F/hpg7kYJ5+bEtzixSaswFjTT3UPc+ybENcEzEqXpaU93Al9jOmwLg2CXWy1o5K7rTFWIKgxfRve+xLc6Bqg1KmFS+Ctu2KmMLDrQ2C/NumjcrcU0B9T/NFvzBzht3+N0o3Pruy+McfguA8HFOKds86WCGq6cZ80Sn4k3vxeWI1fRFnaKSZ3lt3wYkIbT1/l6uKsRJDaG+SUSIwbMiK9fQv+ZrU/cQtZAV/J5N71CpmbYCaEo3QM51KyeGHtR9khnMzqGuxuUhMXttJTnYHgfNYDh43eXa3pT25jGlw5r7paQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHlZ8TP646KEK4ZNRrZTTUNsE3YH1Ebc8pRuQlD7MO8=;
 b=AmMC0Sffm7L4ZiiEPfXA8NX170MxRT9kfXaZ0hU7NzDcbkoJsTdqU2WSlcxI3SyZhXZ9PxLOswRM2Nc05JtrICPUm+gjOWSVXXfPTx8W5Qxc6DnvEXaChGAi9HFW4g+1EBJI86f1r3K2brrlp02m3F4YYBwnMTSaYjqMJQaxErgq/f1bg7KMhJ1Ulq7sr1eouzWD2q58U83cN5Bd2kjk3MWdASHgCvId6WvjFJXyJR/f7Y6maqLrUB6LuZ5PqJiCsXuo/BK39UfQ5bQgK0eBcdfc6Q8YTjudOILuWfdIGMfLeHlkpCvJ1V/8Qvpfu5N5wIaZ3aP6dBOZ2xtt2UDeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHlZ8TP646KEK4ZNRrZTTUNsE3YH1Ebc8pRuQlD7MO8=;
 b=T9vHVlRF1ntPBbhWMR4IpuC40s8wo08YIooHxb24ncAWbZ54Lmp1cj+ppdQaR7t9m0r5/Yc2cjSRF9R9oF6K2tElsYS8o3v7fqb5lpaZs3ZNkMu8wx9pDQOTN8IA43ArWT1rubkhubPsX/+ABFQVynivVfwRU1v9Gr51E0731n/DDRRlBgCYTh/nI0THTNe6bTEf/S6Jj0Y8CE8SQPEBcIhVFbdDyybEqOsfEbLbtshuwl1IxDIpG5LsTslrNxQtethmTiE96da8JTolFNNX4rg4R9zcl0n1xtIDf1CpVhaIUwLB1OxB91PAA9lzLxugb00f28W/ps4U3akvzPTnyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 06:25:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 06:25:29 +0000
Date: Wed, 19 Feb 2025 17:25:24 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v5 03/32] mm/migrate: Trylock device page in do_swap_page
Message-ID: <fzddepuoecwfbjiisbr3h7i6yakpx5kxjftfbxhcju3akcaj6a@n7tpdjk2kk2y>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-4-matthew.brost@intel.com>
 <roahnchztct5tff3elxhzssei537m5hijmq2zp2t2kbsyetwy2@e3b4msq4bbdr>
 <Z7V1X9mD8XnPZqwC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7V1X9mD8XnPZqwC@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SYBPR01CA0202.ausprd01.prod.outlook.com
 (2603:10c6:10:16::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbae15c-0fa3-499f-fbe1-08dd50ae34ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?UT7AdGf97jAR9TRQL5baLkmlk74BdKLF4ndM5NPDKuVSWzcPq25plwpvxn?=
 =?iso-8859-1?Q?yhJn9TlG3pRZwcB+VjQfznHkzPQQMlqgFZcVhpa4Sn5Jb5vt8Sjqljzcwh?=
 =?iso-8859-1?Q?YnEH+cyY5yxiJGBW+f8Ud2iZW8vjj+vA1CECqXzGB7Sz+KrC0J9L/2hvvX?=
 =?iso-8859-1?Q?st3KADUH2Z7NQ81JaW/+8RMU8khUq8xwUNEkmjDuU9+UtGPJ9QLFd7KCZ9?=
 =?iso-8859-1?Q?XvcZq4C+4yBXBkDCYIRpYOL2Jww1RkK35amxHlCqudH0FfwyzIpaCDL6O4?=
 =?iso-8859-1?Q?bFtL+awgih3z3/JCGNTWbazahSgsQG8Bozn+DcBJE/olpNUP/GjbCbrPl7?=
 =?iso-8859-1?Q?1fNsNOp/qtYrFK6XY01vrxnRMaHUXWIAu025GD7qJk5ZDGyruTZhPIPDjH?=
 =?iso-8859-1?Q?8T8RJecLINpgumG30MgGrkyTxrdqyGvqRMgJeW7vJoF7sd0F8HLVo5u6BF?=
 =?iso-8859-1?Q?OyJitq7TZhaWzBmiQWNUhgMtfTOrNMjvLVhYk8+db7vujFyRrbyCLTDCeM?=
 =?iso-8859-1?Q?AkXw2nx0GCriVSnvc1HBhEBU221c1ypRzCmcwT8uWe/YCS5fbBIvxOTUwY?=
 =?iso-8859-1?Q?NKhjRNdGy1IwAp9vngaHzBAaI3/20LPqDgYrkRye9bXla1yeb861KvcvPB?=
 =?iso-8859-1?Q?KX4/6pruhILtIfsOsqEJ6tFtXYIJSA7r52N5HZROVFaTPwWXgL4emkOIn3?=
 =?iso-8859-1?Q?hSRcmuQ5C+UpiExs0o7RADcLrW5OLXx1lv8N0lxE1BLkBejjwdB4F+udYc?=
 =?iso-8859-1?Q?FmKNpTca4Jkwx6jJii4T5IG7iTOHf1wSSaQ+z/mo+ONM62nHn8WgCFDE8r?=
 =?iso-8859-1?Q?dpYH6QESiFaba48bIhWJm8mRFWJ4AVjQJcpQJNf6ovM63q3stVNiG9o36c?=
 =?iso-8859-1?Q?3e08qV78lX3zaamqupVvoaqHePaBtEI1HYGJOAtLp48xD22/p9EMV52kcU?=
 =?iso-8859-1?Q?foN6DtuFIz/fbamb0fyDjbtkPc9B7Ybxn5Y860I1TM5V45cY+/ZOoE00q8?=
 =?iso-8859-1?Q?94SBs2FY7zQha6RHr/6pD2GhiEWK/BnDN4/QFzbwVoNVHGC+4yEbNWnjqt?=
 =?iso-8859-1?Q?JOm1Q+Z+r1zlvxlfmu1RYSelAwYKQDzC7DqOK+Kn3VXhniVpoPdk3pGFaD?=
 =?iso-8859-1?Q?zhZmwurUJQS3hMatAY3Msi1JXndm5b6akvv31VlpMhQ9+gEcfbPSYT8flt?=
 =?iso-8859-1?Q?3A2uWwmPNFgZaO78IsPbh7TUfh3RI4q6KUOLdt8tD7Q1RyQSrXw2ZW8bby?=
 =?iso-8859-1?Q?s3Rd0vCYT8aX0JQDIXlTYgEwG9CD+ecG5SbtKSrBvNCR7ZFNjpXdy9Uxqg?=
 =?iso-8859-1?Q?D99C3MXZBQkC1QfL9JsdtsejVUvYMKWEDkSp0OFcQyLXOLAhREkEbbKI+O?=
 =?iso-8859-1?Q?sZzDrxgZ3sUJHxsjFAR7gTJrZs/JRRjFC+ZE96lqrKlyVUDxoXeG22mCwT?=
 =?iso-8859-1?Q?Lgj9ZpNaVukSagiK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/Te0us/ePssMnqPjobt8Z6aLZ5fI6tjp+ihKiUWf4gfjv+1xAUqc/WONSX?=
 =?iso-8859-1?Q?gHPcs9l5OjQ/ZO0nk0BzzNhCdKfC6FIJ20w4elWbYYY1fKOvpf1DxvQS0n?=
 =?iso-8859-1?Q?by97+g+VokAtF1gzxV/OydQBo23XfCEqaS8KQpc06c5cfOm6KGAJDcm01C?=
 =?iso-8859-1?Q?+UutrRJ+QRC38dac8UcWEYaFwvcawLfgEqt4d5H5R+rTgRnDMdQOQquKiQ?=
 =?iso-8859-1?Q?Oj+RtMIkS26xGMyoWghhGcS5osahjxnhRux8f2Bg+e5YXznc+gr2UNgux6?=
 =?iso-8859-1?Q?3RzbpBE5Ktjur7rAtNoVRd6P1TcIqu5v3mpsAy7FVJ6xrDFBWXfVoAvHQF?=
 =?iso-8859-1?Q?H4wVBRI8zj82GuOZVAEHv9GK8Mty+YF1Zbb0SZu1qJGaCqVPj0UBMpJajh?=
 =?iso-8859-1?Q?w8xAbqONZcC7XeY3sIUL8DDytRQbBqDr4iMhtfz4wA7N1rPAXhiAfEMMHf?=
 =?iso-8859-1?Q?sWrh6YN5QYw8TRaRHKwTiybsoybjaSIbArnJNrq/YtERlBhkUODXjSdFwq?=
 =?iso-8859-1?Q?oRFL3hmzDddVN0DOrwaf8f3FA4EIu+hV62UCokLWAcCFc/lW6FO68WhgnY?=
 =?iso-8859-1?Q?Tnw/ivurC/78g0SelFLWkxEy67wYZY6iCoBhxSF0hQ87ymq0n0eQnIzS6U?=
 =?iso-8859-1?Q?6T2s8pjhhGTVgZ7re/oosyIgnFJ6VZa+CPspgwRc+1KdGBivxSOTEypG15?=
 =?iso-8859-1?Q?w7lBukwlyvWoTAlkyj+hB06w+RK+BGVfDnHPickZHTQzt6zhCsBPMkrMeG?=
 =?iso-8859-1?Q?DSQtQMLs+T6S5vCzgfy5Oo9f5OgFAYc3LQVtT8eS/Q36JZnAwlyP1iAuKA?=
 =?iso-8859-1?Q?wNZGfnpN/AYFW7gaV/TuBQ6bHnjJpde9L8fIljPCTcCaahw0pajsMUkVEL?=
 =?iso-8859-1?Q?GF0ieV3eYOROLwUmzggLYb0LB/V6EdlDMSzUeUZ7lajWeeJZFkchY9/Qzf?=
 =?iso-8859-1?Q?q+fZb9v9DaKrN89gJ6JC9xzex6fFukYPTIVdQNIrkO1YgRiRoh7i33Zclw?=
 =?iso-8859-1?Q?Imu0/C7iMNdJZ0TlCowNH4mfmF6a2AcAz52nLG40hptiZDsKfV5m5H4u2y?=
 =?iso-8859-1?Q?L0TZtP4KgyOPbIXNHznH5oiynO5ASo+SDU8leLSLAE0x61T3FIqBbAkMte?=
 =?iso-8859-1?Q?FcE2O3EBNtiyh61qrMxHRRRcJzrBUsTyL4CA/girHMOo09mJj5bIYw45JH?=
 =?iso-8859-1?Q?H9RsDQk6uDyAyz+XcKtpo+FedgVBs+NOGC7CH1/YXa6QLSgTVCBbHj22/F?=
 =?iso-8859-1?Q?XAjBKp5BmL8Ir38rnrelPHxHKHwVlt1keHO4kSkLTaY82ayW+dVMjh2sF9?=
 =?iso-8859-1?Q?aG4dzqp8WUbbLHL3THMYlAqj3AxG1a550meJFzs/5uRkh4dCQgYfBQzkEE?=
 =?iso-8859-1?Q?HjsRcMbNsMOT9TcCZvY2ECs6AIsDm6yFNjuR41I/sRT2x9rSV+3k0dSf+w?=
 =?iso-8859-1?Q?ksjrvQyvKM6ZCZzv9hvqLgMS/N3s7kZcMSraKwkzxCZwf0sqNPov6QGOnH?=
 =?iso-8859-1?Q?2WqdyG5M+zFgsGu4Bbq4Yr3bQtHbq6ZU7kHfM3/2MOAN5KsNtdC11qY5dV?=
 =?iso-8859-1?Q?GlaPzlUq+3XdibS1Hv8zmlwNJZaWC+CMoiwTIZeQH3Y2F3+S7hk8FtsC8B?=
 =?iso-8859-1?Q?tYyuYyR1eLTTw+2y5c9iW5dt74uFfnMI+t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbae15c-0fa3-499f-fbe1-08dd50ae34ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 06:25:29.7376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z0O3HHk2757Y1ekhxoV7L3S1foNRBCHHDom4IeQYUAVkme370ARM+JtsOsP09myVh2+7cRWhb93Lc/4yejGNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC
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

On Tue, Feb 18, 2025 at 10:08:31PM -0800, Matthew Brost wrote:
> On Wed, Feb 19, 2025 at 04:36:54PM +1100, Alistair Popple wrote:
> > On Wed, Feb 12, 2025 at 06:10:43PM -0800, Matthew Brost wrote:
> > > Avoid multiple CPU page faults to the same device page racing by trying
> > > to lock the page in do_swap_page before taking an extra reference to the
> > > page. This prevents scenarios where multiple CPU page faults each take
> > > an extra reference to a device page, which could abort migration in
> > > folio_migrate_mapping. With the device page being locked in
> > > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > > locking the fault_page argument.
> > > 
> > > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > > DRM driver) SVM implementation if enough threads faulted the same device
> > > page.
> > > 
> > > v3:
> > >  - Put page after unlocking page (Alistair)
> > >  - Warn on spliting a TPH which is fault page (Alistair)
> > >  - Warn on dst page == fault page (Alistair)
> > > 
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  mm/memory.c         | 13 ++++++---
> > >  mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
> > >  2 files changed, 55 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 539c0f7c6d54..1e010c5d67bc 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -4337,10 +4337,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >  			 * Get a page reference while we know the page can't be
> > >  			 * freed.
> > >  			 */
> > > -			get_page(vmf->page);
> > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > -			put_page(vmf->page);
> > > +			if (trylock_page(vmf->page)) {
> > > +				get_page(vmf->page);
> > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > +				unlock_page(vmf->page);
> > > +				put_page(vmf->page);
> > > +			} else {
> > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +			}
> > >  		} else if (is_hwpoison_entry(entry)) {
> > >  			ret = VM_FAULT_HWPOISON;
> > >  		} else if (is_pte_marker_entry(entry)) {
> > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > index 19960743f927..3470357d9bae 100644
> > > --- a/mm/migrate_device.c
> > > +++ b/mm/migrate_device.c
> > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  				   struct mm_walk *walk)
> > >  {
> > >  	struct migrate_vma *migrate = walk->private;
> > > +	struct folio *fault_folio = migrate->fault_page ?
> > > +		page_folio(migrate->fault_page) : NULL;
> > >  	struct vm_area_struct *vma = walk->vma;
> > >  	struct mm_struct *mm = vma->vm_mm;
> > >  	unsigned long addr = start, unmapped = 0;
> > > @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  
> > >  			folio_get(folio);
> > >  			spin_unlock(ptl);
> > > +			/* FIXME support THP */
> > > +			if (WARN_ON_ONCE(fault_folio == folio))
> > 
> > This threw me until I realised this was the THP path because we'd expect to find
> > the fault_folio during migrate_vma_collect_pmd(). Of course we don't currently
> > have DEVICE_PRIVATE THP so faulting won't ever get here which makes sense, but a
> > slightly more verbose comment along those lines would be nice.
> > 
> 
> Can make the comment a bit more verbose in the next rev.
> 
> > Otherwise it looks good and passed my tests so please add:
> > 
> > Reviewed-by: Alistair Popple <apopple@nvidia.com>
> > Tested-by: Alistair Popple <apopple@nvidia.com>
> > 
> 
> Thanks!
> 
> If Nvidia / Nova might make use of GPU SVM, Sima requested an external
> ack outside of Intel, as prerequisite to merging this series [1], on the
> documentation patch [2] detailing the design principles, current status,
> and future plans. If you think reviewing it is appropriate, any input
> would be appreciated.

Oh good idea. Both Nvidia and Nouveau drivers currently make use of GPU SVM and
I assume Nova will too (I'm currently getting up to speed on that) so will take
a look.

 - Alistair

> Matt
> 
> [1] https://patchwork.freedesktop.org/series/137870/
> [2] https://patchwork.freedesktop.org/patch/636838/?series=137870&rev=5
> 
> > > +				return migrate_vma_collect_skip(start, end,
> > > +								walk);
> > >  			if (unlikely(!folio_trylock(folio)))
> > >  				return migrate_vma_collect_skip(start, end,
> > >  								walk);
> > >  			ret = split_folio(folio);
> > > -			folio_unlock(folio);
> > > +			if (fault_folio != folio)
> > > +				folio_unlock(folio);
> > >  			folio_put(folio);
> > >  			if (ret)
> > >  				return migrate_vma_collect_skip(start, end,
> > > @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  		 * optimisation to avoid walking the rmap later with
> > >  		 * try_to_migrate().
> > >  		 */
> > > -		if (folio_trylock(folio)) {
> > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > >  			bool anon_exclusive;
> > >  			pte_t swp_pte;
> > >  
> > > @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  
> > >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > >  					set_pte_at(mm, addr, ptep, pte);
> > > -					folio_unlock(folio);
> > > +					if (fault_folio != folio)
> > > +						folio_unlock(folio);
> > >  					folio_put(folio);
> > >  					mpfn = 0;
> > >  					goto next;
> > > @@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > >  					  unsigned long npages,
> > >  					  struct page *fault_page)
> > >  {
> > > +	struct folio *fault_folio = fault_page ?
> > > +		page_folio(fault_page) : NULL;
> > >  	unsigned long i, restore = 0;
> > >  	bool allow_drain = true;
> > >  	unsigned long unmapped = 0;
> > > @@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > >  		remove_migration_ptes(folio, folio, 0);
> > >  
> > >  		src_pfns[i] = 0;
> > > -		folio_unlock(folio);
> > > +		if (fault_folio != folio)
> > > +			folio_unlock(folio);
> > >  		folio_put(folio);
> > >  		restore--;
> > >  	}
> > > @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > >  		return -EINVAL;
> > >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> > >  		return -EINVAL;
> > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > +		return -EINVAL;
> > >  
> > >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > >  	args->cpages = 0;
> > > @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > >  }
> > >  EXPORT_SYMBOL(migrate_vma_pages);
> > >  
> > > -/*
> > > - * migrate_device_finalize() - complete page migration
> > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > - * @npages: number of pages in the range
> > > - *
> > > - * Completes migration of the page by removing special migration entries.
> > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > - * before calling this.
> > > - */
> > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > -			unsigned long *dst_pfns, unsigned long npages)
> > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > +				      unsigned long *dst_pfns,
> > > +				      unsigned long npages,
> > > +				      struct page *fault_page)
> > >  {
> > > +	struct folio *fault_folio = fault_page ?
> > > +		page_folio(fault_page) : NULL;
> > >  	unsigned long i;
> > >  
> > >  	for (i = 0; i < npages; i++) {
> > > @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  
> > >  		if (!page) {
> > >  			if (dst) {
> > > +				WARN_ON_ONCE(fault_folio == dst);
> > >  				folio_unlock(dst);
> > >  				folio_put(dst);
> > >  			}
> > > @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  
> > >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> > >  			if (dst) {
> > > +				WARN_ON_ONCE(fault_folio == dst);
> > >  				folio_unlock(dst);
> > >  				folio_put(dst);
> > >  			}
> > > @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  		}
> > >  
> > >  		remove_migration_ptes(src, dst, 0);
> > > -		folio_unlock(src);
> > > +		if (fault_folio != src)
> > > +			folio_unlock(src);
> > >  
> > >  		if (folio_is_zone_device(src))
> > >  			folio_put(src);
> > > @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  			folio_putback_lru(src);
> > >  
> > >  		if (dst != src) {
> > > +			WARN_ON_ONCE(fault_folio == dst);
> > >  			folio_unlock(dst);
> > >  			if (folio_is_zone_device(dst))
> > >  				folio_put(dst);
> > > @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  		}
> > >  	}
> > >  }
> > > +
> > > +/*
> > > + * migrate_device_finalize() - complete page migration
> > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > + * @npages: number of pages in the range
> > > + *
> > > + * Completes migration of the page by removing special migration entries.
> > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > + * before calling this.
> > > + */
> > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > +			unsigned long *dst_pfns, unsigned long npages)
> > > +{
> > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > +}
> > >  EXPORT_SYMBOL(migrate_device_finalize);
> > >  
> > >  /**
> > > @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > >   */
> > >  void migrate_vma_finalize(struct migrate_vma *migrate)
> > >  {
> > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > +				  migrate->fault_page);
> > >  }
> > >  EXPORT_SYMBOL(migrate_vma_finalize);
> > >  
> > > -- 
> > > 2.34.1
> > > 
