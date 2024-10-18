Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB09A3761
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEE510E8BB;
	Fri, 18 Oct 2024 07:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWaLe73m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3B210E8A8;
 Fri, 18 Oct 2024 07:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4eGJjHxB2SxPv3/LJuOBpGYgYT9Bq19WG+iZnJSETJzIjQYjJKfNX6swbNYXbJlX0ST8QQbjXI7UfH94V0rQmmVqcnq+BlCQNLmtMSfoq9KmgF/hg3lOf/ty50eRKq6uPhleMeDksNwMcyo8dgn4jSG+uQHswKGm21dGmbGrA16/VY4ELXcbpIYEjR+19/bJKBNImfQ8XSUCeoDBU0H/laq0QgmI9K62KTyyy6tiIelHUe2x7AaTZq3wf6Gg4IuYpxm9RC1dNVk06LLyHrJyfT9ZbGMvBDGg3n8Pb0croBZ7MbzBFG+kdrOM7zbcMW52y+2Kgx0mNXrkHfFiSlKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0eWVdLMhmx9SED3dS5nBEgZ/e9977Bc1dWj07eDqcM=;
 b=P7urHzO8B1FvFYsk/nTYyytUyy7v6R95UwtQO4SSI+ye+nNEHmV0Ao/IJFOIHEK9dl8ihZbk5yGwHDB6Szy/bvgfZxUGiX9XFeNWcfToB4Bn4XFLWV9jvH3KyRbkvKZi62+lGA+NadOTj0XIVWKNbcJHGLcZfR8AhUwakYOf5mg9YRLzFgok/0On0dT6Ok5Gx+RI6ZBxFQP1WL9spxp0w6HtQfEGrnuvE/Rc+JzYu73zxO+QkAkpr1vAZEmm8Um2wVuKCbJ0PGI4V2Cd/S4YaQ6LC1rxC1LxbqzGXV/MDcLI5x9JIdyLvPWn9k4BRxa4BkHm9WacTsO5jnqc6wd4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0eWVdLMhmx9SED3dS5nBEgZ/e9977Bc1dWj07eDqcM=;
 b=pWaLe73m5zWXBSg5G8rWBf4M1RLVtUob6GoAIK4a3cAxH0bhcAUmBLBhEDcCfihf6/hByGhXcl7r6mpKJC377FKc9JScOTH7rmqwVvHCsciA4eAVrqyLDb1MOZ4HZpWU6RtSUtmugYyFJgq8X1GV60LgwdFTfn1s+hK44XP2tZPx+VagE3BSKV/1BGpOHu9NnPa4HZ1XhWo/PzvGaAzVBYuvFVNY2cwjO+/4IvbEciPSUdnONVOlGKP4/DbxQFdKCgMhnFJOLem2VkeX/ZPOWtBXQe6zTsUHMp4M8nR8pZFK9wrsmpq6dDNccR1uJ3qtB5a7tODv2fHwDGkrHcFN9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Fri, 18 Oct
 2024 07:39:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 07:39:27 +0000
References: <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
 <87zfn2lz6z.fsf@nvdebian.thelocal>
 <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Fri, 18 Oct 2024 18:34:13 +1100
In-reply-to: <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
Message-ID: <87v7xpn9lh.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0158.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ba9be8-fc83-4014-2cb8-08dcef47fe3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y8cqn1MStSaDCU7NjJN9634YtGGE4TjalSMX1hWMKXSqqhd1wYIYS4IAh5pk?=
 =?us-ascii?Q?AbA/lO/HgygiTXmNt+1GaJ1GDyXquwPEf4iG5gyuNurYqIlOg6lR4ifpD1zR?=
 =?us-ascii?Q?X6kk90HaQm1ramqaD2v4yReVF3xBGed5kaHZ3fkt9rD2prBUhfPfx8CiyNzm?=
 =?us-ascii?Q?/Q89D2MiJQ6O8qkHEvcei4oTJqjRmOuvOnR89vgE0Z33RYY+BEWAhooWDdSR?=
 =?us-ascii?Q?4R9c5mv9Yvsh1NoUR+oHcxQwbza4xewsf2JBffHvMUrJDLR2z3QvMTt9cRbW?=
 =?us-ascii?Q?+pO7iGV68OrxkK84Yn6yBLPGG1Fx1YjaMvUbWB/gICHL9O7ZjExvG/cDNkgL?=
 =?us-ascii?Q?5yze8RxmPv2f7RKCL/O4LIUnrd+Oa7a4YPCTMjbbUIoLuX5VPQQCY02bEwhO?=
 =?us-ascii?Q?DdRhndxXrhTpI5QOeElcSXgbTKebJa5Prq7mNC33N9GXrBaNluyJ+4sD/Hn4?=
 =?us-ascii?Q?eAsWy292a2QGJyWXOR5GubGiVDFc2MN/Ll1u2hIbr9TtRLrDyFYEKlpVOFQl?=
 =?us-ascii?Q?QX2T2nvrvXT4iahTtLCIn/KDBNt6ueIA70+3BS+MIQhxsyeePNGHHf9Z1Lbs?=
 =?us-ascii?Q?sV95Mkco9PwzdCW1Km3YVs3R3xqnK2bSfoPyD5h8AwzbpuiNQS93ncegsW25?=
 =?us-ascii?Q?99P8cjR7BZawaZX5I3UFgRWCfpMYVqWK/dveePs2zQTl2jLDm5bp0nQKOQA+?=
 =?us-ascii?Q?gnhUlmq9pMN8EBVC1znn+L8C798pd4U07Q8o0J4xxrRnrBhYM7btH1CjHpXW?=
 =?us-ascii?Q?V2IqBkcB0JRdrKnWKJSKugCcNYB2PHbHS8G8wr4YGD8ANOMcp/BxJtdEkUGZ?=
 =?us-ascii?Q?dlC9O+jg1Qj0sAKqT/trKDPpNCbAU1ilHcH+ARRiJnW+jTPpvpDhwMwmw3el?=
 =?us-ascii?Q?WHIqCv+KV1V6MTpYNwbPsFHPwZJbi5g1mE9sAYo+FEX01Tdz3pbcjane6a3q?=
 =?us-ascii?Q?7p/ZNZQqG84RSs4q8JxDe2a0Nb1hzifvudDJp18gqYFp08zxpVQVfH4x3ZQO?=
 =?us-ascii?Q?DAYRO7Hu3bYlGu1GYe8cro6Gz4jGzmsGpWxUNmKddUBgGk5MdK/mbhFLg4K9?=
 =?us-ascii?Q?6o2bHdfWc/cXhuL7NXNgttYDxeOilhAT9II3TgRXxMAJTkan36H6RaxAG2xT?=
 =?us-ascii?Q?RYVQahMhfkYU7F2KStQHhqwI00m/rj05cxGcCw0wACcsF/DSVJTCXh5ayJNm?=
 =?us-ascii?Q?mh4eVjOy+MlZpXvuiJWdhONNtOfEMncKufzJ96Mqdspu03qL8240sw6I7Y8F?=
 =?us-ascii?Q?yVJ9oLHhcoS5mqn9W9tDR7Yy5faZrwOLt1Fk0bWTHDr+n0k5zYihlvQ3isJm?=
 =?us-ascii?Q?DibJbdzkpCj7mWdbIuDicp1e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKHnQdUbmRbfQi2vD5Bj1PdPZAZggscoAChNQmIQqU7lMkPwGjO0MjeuBvN8?=
 =?us-ascii?Q?/xCMwGmHYDjFNNdOiJ78NQG1ONzVMKKBE+Daw8Waonz+kvsaWwuzNfK4ztst?=
 =?us-ascii?Q?wa5BSIwciaqLcrU5ILkgep1I1POx5oX0gb8p8BsTSoJBj9Io2eP0OemR118K?=
 =?us-ascii?Q?8Gvqn/eMUc67/TNlsv6bEQ5CfPUKqUapvhl1/7XlF1I8pGCOoVXR9lJwGqxq?=
 =?us-ascii?Q?ihOYzf2tMZCblL/Y6taP6iFzTFJ35mkrJWmGk6PeoD7f5Jb1D7fLQ4dqCorb?=
 =?us-ascii?Q?gfaBt596V8ysUb0ruDsq1PsdCziJ4i1HMAkLh4MSQLW5yJm5aqSRvfXh8e9s?=
 =?us-ascii?Q?up4aEGVmtwIgX4kTnRk6+ECXgWJdigqByulXwtDoo4IY8rW8zbZRqaMXD7H5?=
 =?us-ascii?Q?v3Wwo9x8ShIRr5O6be1V4T5S6ddhV38SqVOwVSK8uuT++udRoDaXBnclNwOo?=
 =?us-ascii?Q?CE9CCl9PEsFxpJgVgWCb0XvlerJ2uGyndsZXmp6BzyPNXv1HkFoTL9Rt3LW2?=
 =?us-ascii?Q?qnlAftj1NPknmRTz8SYAqhav87l30rj8ZlUc9TZ3r8HWNmXCjvTZz/beKJ9n?=
 =?us-ascii?Q?kqairA44Umb/kLd3HRG+OIOkSRrmQ9zsrfcBHJegrc9joPTCQJoEpzVTRhGC?=
 =?us-ascii?Q?BcDSCSYDmFbzTYT8/9VDgbMcwMVUD/RCNm4bdPlxXqkqzLLVI7fDbMOKVmeO?=
 =?us-ascii?Q?hQbN9/h96z2p39VOWVtPorNgSN9a1T59ywjoifPsGLWoOaoDU74AAojs+YxR?=
 =?us-ascii?Q?0JETgodtSdgWbhUOU7enA3YNa/trFvJlpy1S1MVLQ5TmCMOCJfTHhBJL4Owh?=
 =?us-ascii?Q?baBCE6zx474f3jpBYCMDcDGyyV6NgX4zhA44WdcnulRlwcFyowOwymor/WKZ?=
 =?us-ascii?Q?FWmpou5JTokuJZadn+BMXZ+HqfNwxQZaOKwJtI2KMo3vkm0PvztfupXKJfh1?=
 =?us-ascii?Q?xrE7SRJEjD7mgH/N73uN5zm+Gdnq69i0Bfh7b16ToX35tHXEVAALXe17oncI?=
 =?us-ascii?Q?+C8mf5VAASwBnv1S7y8AjuJMLO0n/RyYcyNIY5omufL/Uypbv9bVYi14PiRK?=
 =?us-ascii?Q?e2GtsqR0CP2BjYI67mRBjxDzKF+MqDM1qLGIf32CdWlS1l8x4+7/vQ0lV8Ol?=
 =?us-ascii?Q?QAnKfWoSh+pb31TSk97dNA/1i8Dt+pKSwSPpaCAsCwdqRF4X/woFXzo8vZ6w?=
 =?us-ascii?Q?qzUZyUgxeAnVneGAUck8xF5R4mzJxDcIPi1eoO1a9gU93T5VqNzQ9rs2lHBW?=
 =?us-ascii?Q?WfXQ//3bYFlp9EGqwA3Eipti9vIYaY6u/e+4FfWSbrHqpGAJh1AFoqX7s0+g?=
 =?us-ascii?Q?OsTo3KBefnNGlwTVHgB//S9LON9r6oxmlPUYdt8PdlUN1qfzCDyTqtGGRlzd?=
 =?us-ascii?Q?QF1olRkpVzGiSGGiNCZYnUZTfMqewKsEUVwzSGrPkbVBndbUlGBnapVCNlnK?=
 =?us-ascii?Q?GQm9GY7FkAeOxjMgcJewnaYzrW07dkiCLbzX51CYU0F1TvmfxRk1VxP9MVBT?=
 =?us-ascii?Q?3GzxoWo9m+dYU2e9BSBxyLpeKNfqjMSXl2PjFjDYgCxc3HRnu6nOdhlrFEUG?=
 =?us-ascii?Q?ZDtYw+T1teFXorkaqiSpaSvuLFiewkBVdEFUi/Qf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ba9be8-fc83-4014-2cb8-08dcef47fe3b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:39:27.0073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLLOjJTewEcPmrWC4zv382fNeNa++CD1DO/DLmpzi7RvmJQKdy7Lz5blmlBiqneQY3SvVnyRaekbuuxP+Q5QMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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

> On Fri, Oct 18, 2024 at 04:59:05PM +1100, Alistair Popple wrote:
>> 
>> Matthew Brost <matthew.brost@intel.com> writes:
>> 
>> > On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
>> >> 
>> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> 
>> >> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
>> >> >> 
>> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> 
>> >> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>> >> >> >> 
>> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> >> 
>> >> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>> >> >> >> >> 
>> >> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
>> >> >> >> >> 
>> >> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>> >> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>> >> >> >> >> 
>> >> >> >> >> [...]
>> >> >> >> >> 
>> >> >> >> >> >> > > +{
>> >> >> >> >> >> > > +	unsigned long i;
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
>> >> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
>> >> >> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> >> >> > > +			continue;
>> >> >> >> >> >> > > +		}
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +		if (!trylock_page(page)) {
>> >> >> >> >> >> > > +			src_pfns[i] = 0;
>> >> >> >> >> >> > > +			put_page(page);
>> >> >> >> >> >> > > +			continue;
>> >> >> >> >> >> > > +		}
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>> >> >> >> >> >> > 
>> >> >> >> >> >> > This needs to be converted to use a folio like
>> >> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
>> >> >> >> >> >> > a function that both migrate_device_range() and this function can call
>> >> >> >> >> >> > given this bit is identical.
>> >> >> >> >> >> > 
>> >> >> >> >> >> 
>> >> >> >> >> >> Missed the folio conversion and agree a helper shared between this
>> >> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
>> >> >> >> >> >> 
>> >> >> >> >> >
>> >> >> >> >> > Alistair,
>> >> >> >> >> >
>> >> >> >> >> > Ok, I think now I want to go slightly different direction here to give
>> >> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
>> >> >> >> >> >
>> >> >> >> >> > What if I exported the helper discussed above, e.g.,
>> >> >> >> >> >
>> >> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>> >> >> >> >> >  906 {
>> >> >> >> >> >  907         struct folio *folio;
>> >> >> >> >> >  908
>> >> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>> >> >> >> >> >  910         if (!folio)
>> >> >> >> >> >  911                 return 0;
>> >> >> >> >> >  912
>> >> >> >> >> >  913         if (!folio_trylock(folio)) {
>> >> >> >> >> >  914                 folio_put(folio);
>> >> >> >> >> >  915                 return 0;
>> >> >> >> >> >  916         }
>> >> >> >> >> >  917
>> >> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> >> >> >> >> >  919 }
>> >> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>> >> >> >> >> >
>> >> >> >> >> > And then also export migrate_device_unmap.
>> >> >> >> >> >
>> >> >> >> >> > The usage here would be let a driver collect the device pages in virtual
>> >> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
>> >> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
>> >> >> >> >> > migrate_device_unmap.
>> >> >> >> >> 
>> >> >> >> >> I'm still working through this series but that seems a bit dubious, the
>> >> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
>> >> >> >> >> would help me a lot in understanding what you're suggesting.
>> >> >> >> >>
>> >> >> >> >
>> >> >> >> > For sure locking in tricky, my mistake on not working through this
>> >> >> >> > before sending out the next rev but it came to mind after sending +
>> >> >> >> > regarding some late feedback from Thomas about using hmm for eviction
>> >> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
>> >> >> >> > doesn't work for coherent pages, while something like below does.
>> >> >> >> >
>> >> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>> >> >> >> >
>> >> >> >> > Here is a snippet I have locally which seems to work.
>> >> >> >> >
>> >> >> >> > 2024 retry:
>> >> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> >> >> > 2026         hmm_range.hmm_pfns = src;
>> >> >> >> > 2027
>> >> >> >> > 2028         while (true) {
>> >> >> >> > 2029                 mmap_read_lock(mm);
>> >> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
>> >> >> >> > 2031                 mmap_read_unlock(mm);
>> >> >> >> > 2032                 if (err == -EBUSY) {
>> >> >> >> > 2033                         if (time_after(jiffies, timeout))
>> >> >> >> > 2034                                 break;
>> >> >> >> > 2035
>> >> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> >> >> >> > 2037                         continue;
>> >> >> >> > 2038                 }
>> >> >> >> > 2039                 break;
>> >> >> >> > 2040         }
>> >> >> >> > 2041         if (err)
>> >> >> >> > 2042                 goto err_put;
>> >> >> >> > 2043
>> >> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
>> >> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> >> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>> >> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
>> >> >> >> > 2048                 goto retry;
>> >> >> >> > 2049         }
>> >> >> >> > 2050         for (i = 0; i < npages; ++i) {
>> >> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
>> >> >> >> > 2052
>> >> >> >> > 2053                 if (page && (is_device_private_page(page) ||
>> >> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
>> >> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
>> >> >> >> > 2056                 else
>> >> >> >> > 2057                         src[i] = 0;
>> >> >> >> > 2058                 if (src[i])
>> >> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
>> >> >> >> > 2060         }
>> >> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
>> >> >> >> 
>> >> >> >> Practically for eviction isn't this much the same as calling
>> >> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
>> >> >> >> probably shouldn't be looking at mm/vma structs.
>> >> >> >> 
>> >> >> >
>> >> >> > hmm_range_fault is just collecting the pages, internally I suppose it
>> >> >> > does look at a VMA (struct vm_area_struct) but I think the point is
>> >> >> > drivers should not be looking at VMA here.
>> >> >> 
>> >> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
>> >> >> so in general I don't see a problem with drivers looking up vma's. The
>> >> >> problem arises specifically for eviction and whether or not that happens
>> >> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
>> >> >> issues there (see below).
>> >> >> 
>> >> >
>> >> > Ok, if you think it ok for drivers to lookup the VMA then purposed
>> >> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
>> >> > needed, rather just the original function exported in the this patch.
>> >> >
>> >> > More below too.
>> >> >
>> >> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
>> >> >> >> > ...
>> >> >> >> > 2101         migrate_device_pages(src, dst, npages);
>> >> >> >> > 2102         migrate_device_finalize(src, dst, npages);
>> >> >> >> >
>> >> >> >> >
>> >> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
>> >> >> >> >> > lookup during eviction cases and this would let me fixup
>> >> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
>> >> >> >> >> 
>> >> >> >> >> That sounds reasonable but for context do you have a link to the
>> >> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
>> >> >> >> >> just missed it.
>> >> >> >> >> 
>> >> >> >> >
>> >> >> >> > See in [4], search for '2. eviction' comment from sima.
>> >> >> >> 
>> >> >> >> Thanks for pointing that out. For reference here's Sima's comment:
>> >> >> >> 
>> >> >> >> > 2. eviction
>> >> >> >> > 
>> >> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
>> >> >> >> > migration gurantee:
>> >> >> >> > 
>> >> >> >> > - Only looking at physical memory datastructures and locks, no looking at
>> >> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
>> >> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
>> >> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
>> >> >> >>
>> >> >> >> I also very much agree with this. That's basically why I added
>> >> >> >> migrate_device_range(), so that we can forcibly evict pages when the
>> >> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
>> >> >> >> general it is impossible to guarantee eviction og all pages using just
>> >> >> >> hmm_range_fault().
>> >> >> >> 
>> >> >> >
>> >> >> > In this code path we don't have device pages available, hence the
>> >> >> > purposed collection via hmm_range_fault.
>> >> >> 
>> >> >> Why don't you have the pfns requiring eviction available? I need to read
>> >> >> this series in more depth, but generally hmm_range_fault() can't
>> >> >> gurantee you will find every device page.
>> >> >> 
>> >> >
>> >> > There are two cases for eviction in my series:
>> >> >
>> >> > 1. TTM decides it needs to move memory. This calls
>> >> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
>> >> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
>> >> > here albiet with the new function added in this patch as device pfns may
>> >> > be non-contiguous.
>> >> 
>> >> That makes sense and is generally what I think of when I'm thinking of
>> >> eviction. The new function makes sense too - migrate_device_range() was
>> >> primarily introduced to allow a driver to evict all device-private pages
>> >> from a GPU so didn't consider non-contiguous cases, etc.
>> >> 
>> >> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
>> >> > partial unmap of a range, etc...). Here we want to evict the range ram
>> >> > to make the state consistent. No device pages are available due to an
>> >> > intentional disconnect between a virtual range and physical
>> >> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
>> >> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
>> >> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
>> >> > using hmm_range_fault like I have suggested here.
>> >> 
>> >> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
>> >> fine for this usage and is exactly what you want - it was designed to
>> >> either select all the system memory pages or device-private pages within
>> >> a VA range and migrate them.
>> >> 
>> >> FWIW I have toyed with the idea of a combined
>> >> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
>> >> migrate_vma_*() process but haven't come up with something nice as
>> >> yet. I don't think mixing the two in an open-coded fashion is a good
>> >> idea though, I'd rather we come up with a new API that addresses the
>> >> short-comings of migrate_vma_setup().
>> >> 
>> >
>> > I think that would good. Here we actually need to lookup multiple VMAs
>> > and have a sequence of migrate_vma_* calls as it possible for VMAs to
>> > have changed after the driver range was created. It might be nice to
>> > hide the VMA lookup from the drivers with an API saying collect and
>> > migrate all pages of a type in a VA range much like hmm_range_fault. If
>> > the range spans multiple VMAs that would be hidden from the caller.
>> 
>> Ok. I wasn't really considering multiple VMAs. UVM and Nouveau don't
>> really have a requirement to migrate across multiple VMAs but if that's
>> neccessary I think an API that hides that specifically for working with
>> migrate_vma_*() might make sense.
>> 
>
> We can run into multiple VMA scenarios if a user does something rude
> like this:

fork and mremap were the other "rude" things we've had fun with. They
basically mean you can get references to device pages which a driver
can't track with virtual addresses.

> mmap	0x000000...0x1fffff -> fault migrates 2M to VRAM and creates an internal range to track
> munmap	0x080000...0x17ffff -> now we have two VMAs instead of one and the range has a hole in it
>
> In this scenario, which we believe to rare / unsual, we just evict
> remaining VRAM pages to SRAM, destroy range, and fixup on next GPU
> fault.
>
>> > Matt
>> >
>> >> > Note #2 may be removed or unnecessary at some point if we decide to add
>> >> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
>> >> > now though. See 'Ranges with mixed system and device pages' in [5].
>> 
>> As someone not very familiar with some of the DRM layers can I ask why
>> having virtual address ranges with a mix of system and device pages is
>> hard to support? It seems to me that in practice it might be quite
>> difficult to keep a VMA range as exclusively all in system memory or all
>> in device memory.
>>
>
> A few things that make this difficult are:
>
> - Our (Xe) bind code would need to be updated to support this
> - TTM / DRM buddy allocator doesn't support freeing / reallocation of
>   individual pages rather aligned chunks of initial allocation size
>   (e.g., 2M would be common allocation size).
> - Spliting ranges would add complications
>
> All workable problems but since we are writing a new common
> implementation trying to keep it as simple as possible for initial merge
> of the design. Almost certainly at some point we will add support for
> mixed ranges to the common GPU SVM layer with a driver choosing if it
> wants mixed or non-mixed ranges via a flag to function calls.
>
> wrt to being difficult keeping exclusively in system or vram, in
> addition to the above case the only other case I have found in which
> this occurs is CPU and GPU faults to same address range racing. This can
> cause hmm_range_fault to grab a set mixed pages. In this case again we
> do an eviction remaining page and restart the GPU fault.
>
> I don't have real workloads yet but I do have a very aggressive test
> case that intentionally does things which could break the design in a
> highly parallel manner and the design as work. Is it ideal? Maybe not.
> But getting in a simple design which we can build upon is the current
> goal.

Taking a simple approach first definitely sounds lie the right approach
to me. I was just interested in the background because it wasn't
something I'd run into (though we built on top of something quite
different to the DRM layer). But I have often thought that the
interfaces we have between core mm and GPU drivers is still a bit too
low level at the moment and is calling out for a slightly higher level
common implementation in the middle so am very interested to see where
this all goes. Thanks.

 - Alistair

> Matt
>
>> >> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
>> >> >
>> >> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
>> >> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>> >> >> >> >
>> >> >> >> >> > It would also make the function exported in this patch unnecessary too
>> >> >> >> >> > as non-contiguous pfns can be setup on driver side via
>> >> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
>> >> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>> >> >> >> >> > in [1].
>> >> >> >> >> >
>> >> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
>> >> >> >> >> > migrate_device_unmap?
>> >> >> >> >> 
>> >> >> >> >> If there is a good justification for it I can't see a problem with
>> >> >> >> >> exporting it. That said I don't really understand why you would
>> >> >> >> >> want/need to split those steps up but I'll wait to see the code.
>> >> >> >> >>
>> >> >> >> >
>> >> >> >> > It is so the device pages returned from hmm_range_fault, which are only
>> >> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
>> >> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
>> >> >> >> > MMU invalidation which takes the notifier lock thus calling the function
>> >> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>> >> >> >> >
>> >> >> >> > I think this flow makes sense and agree in general this likely better
>> >> >> >> > than looking at a CPUVMA.
>> >> >> >> 
>> >> >> >> I'm still a bit confused about what is better with this flow if you are
>> >> >> >> still calling hmm_range_fault(). How is it better than just calling
>> >> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
>> >> >> >
>> >> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
>> >> >> > vm_area_struct argument whereas hmm_range_fault does not.
>> >> >> 
>> >> >> I'm not sure that's a good enough justfication because the problem isn't
>> >> >> whether you're looking up vma's in driver code or mm code. The problem
>> >> >> is you are looking up vma's at all and all that goes with that (mainly
>> >> >> taking mmap lock, etc.)
>> >> >> 
>> >> >> And for eviction hmm_range_fault() won't even find all the pages because
>> >> >> their virtual address may have changed - consider what happens in cases
>> >> >> of mremap(), fork(), etc. So eviction really needs physical pages
>> >> >> (pfn's), not virtual addresses.
>> >> >>
>> >> >
>> >> > See above, #1 yes we use a physical pages. For #2 it is about making the
>> >> > state consistent within a virtual address range.
>> >> 
>> >> Yep, makes sense now. For migration of physical pages you want
>> >> migrate_device_*, virtual address ranges want migrate_vma_*
>> >> 
>> >>  - Alistair
>> >> 
>> >> > Matt
>> >> >  
>> >> >> >> we're talking about eviction here so I don't understand why that would
>> >> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
>> >> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
>> >> >> >
>> >> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
>> >> >> > as argument. This is about avoiding a driver side lookup of the VMA.
>> >> >> >
>> >> >> > CPUVMA == struct vm_area_struct in this email.
>> >> >> 
>> >> >> Thanks for the clarification.
>> >> >> 
>> >> >>  - Alistair
>> >> >> 
>> >> >> > Matt
>> >> >> >
>> >> >> >> specific concept?
>> >> >> >> 
>> >> >> >> Thanks.
>> >> >> >> 
>> >> >> >>  - Alistair
>> >> >> >> 
>> >> >> >> > Matt
>> >> >> >> >  
>> >> >> >> >>  - Alistair
>> >> >> >> >> 
>> >> >> >> >> > Matt
>> >> >> >> >> >
>> >> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>> >> >> >> >> >
>> >> >> >> >> >> Matt
>> >> >> >> >> >> 
>> >> >> >> >> >> > > +	}
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > > +	return 0;
>> >> >> >> >> >> > > +}
>> >> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>> >> >> >> >> >> > > +
>> >> >> >> >> >> > >  /*
>> >> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
>> >> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
>> >> >> >> >> >> > 
>> >> >> >> >> 
>> >> >> >> 
>> >> >> 
>> >> 
>> 

