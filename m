Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14C747A9F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 02:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCF810E092;
	Wed,  5 Jul 2023 00:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3CF10E08A;
 Wed,  5 Jul 2023 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688515756; x=1720051756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=iud/xcINVABxJ7lWJ+nqySkqmBXzNDH4omul5VQ2qX0=;
 b=ZYmYD9Sb4aBuiySvJut91S0pQwc+zW9i7vNBf9OIsF2ACLk9OsI4Emm6
 y9zY4Q/wVXgZVFfRtWgHWeEa6O5eCxxBoxsqBv47FQRYHBu28DpZEm1U5
 JA/vKLw7Vl46sGKw6us6NcKbHgDt4X5+EjJDQU9DuxFOp9Ew/NA+SMELn
 RgaAWag2+CfckLVZgs99dJRndoTEjurZg0x2NUhTEmFDvxmBvmUeEU4Sy
 bIJILomddryFrrERzXB1z1iLE96kiNWDm2v04tGc24ZRDTl4lCSHQDR13
 k3zk6qViSzcPx7kvssVj79bwFGFYPPpayLzTQ9REeJ70qelqKBLOsAmi/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342803352"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
 d="scan'208,217";a="342803352"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 17:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="788981126"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
 d="scan'208,217";a="788981126"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 17:09:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 17:09:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 17:09:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 17:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+GD2/uc8zwYZi57a/zL1BAdHh/j1cf5br9o3teqpuwGUj3Tek993BEFRIfD0zHx6FtVDMyjp33b6E9OozNeSXV6H5oxJctTifvQ8uDmIvdYcYkGisrF4Dwaq+6hdTbB7AhE1q0/0ubMj1TVqoXmyLdeVIOdVyVxgnCzWOI5F7U1yV2We3aPKtEkmnusrLOYyeEn13rmzMbrXOpBypgDZMqQNZGAtkwmD3uzv7Sm05W4Kbl7kkSLK0+tYTkatgVFTgpWjjyrJ9NlxGlhd6Vfa1fmhZzCZc6oIqilapYFCqC7sthExGSq27PJWZhcShv6OGK65EAZHa8lRQ0L8NCMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDsgML7hWgPYN98ANNlpQHFmUmRvpOb5E8Y5bqRjWDc=;
 b=ARZydtvHJ18hA8V+PcMC9oSDVQ28jofvz/hvJAtkzMaF13WquCL7sxchLXnDX08BPtL02qBunc9suS2gXiR4yT7ADY5L3Hml2t8Y0DE3nLb1vquDaaTvPqMWJI3iWEv+dEOap0mY9AzgJbBdpUEMT6KggiUjKJiDanRQgPYhbn6FDFvJVcYCQf2AZK6cYBV+lbAuMoF0FtqnGAktJpLJHqZfYg2RGqM48MlrmxkAke6ng0glCuWU/aFEczb7fGkJ0rzcSklaDfBzzPycMaVN2oA58UAibugfeU6o2HM45emA4jnlxeQzka6hiV+Uy7woiZs21l+iPihHvwriGCNSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 00:09:11 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 00:09:10 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915: Refactor PAT/cache handling
Thread-Topic: [PATCH v2] drm/i915: Refactor PAT/cache handling
Thread-Index: AQHZqpQvF7ewKzrr+kCyWWOnY6DVxa+i6j3igAUKSACAAUhM6w==
Date: Wed, 5 Jul 2023 00:09:10 +0000
Message-ID: <BYAPR11MB2567F99FD5CFB3E709B2B3879A2EA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230629141509.3194090-1-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB256721AE29EBF133E60D7CD19A2AA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <6fcb91a4-5e93-4964-e4b1-45bf965b0011@linux.intel.com>
In-Reply-To: <6fcb91a4-5e93-4964-e4b1-45bf965b0011@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SN7PR11MB6678:EE_
x-ms-office365-filtering-correlation-id: 7fbaf4ee-0be2-4bdf-b9ae-08db7cec0ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1Yz/mMzZUPhJSIesnxytNKywuxWZVvLTWsEQunmh6V7L4VXlDIVccKHZX6tZmbRTTzOMagRZfF4ONr6gk1NeDVAhXsCGn8y3qNVc1UswTUKc2RC1ynUFFY1YlUQLVeH7nCWJLz0LSBeGfayLWm/MVxRv7q/2BWcTUkOBLO8QIfLIwElKmJR3QBi71oorF4HbGf+20W5z3MvYgakdM3bZLk2j92pN06MgXHce3Mgc4hM/YNm6qT66MMVIaIdWX2i5sh9cWLafah8Xy7DoXoORmtwdtfCcreE3HJ4gVUkrPCsDUyVxmYONOQXGtKEDHmXXH8lotq9QFa0de6NMWpZoTEfl2uwPjDNigHzH1ejwPrTjWSL5195tallHHrqW7J+DeYRiYvvwgfxtDAVdnvRX300LdyGQ/sL+zsi/bvbsuU6j+dJ4HLpePQcyg4+K7d8axrxkQwVAB3d6xhkdBhb/C7rborp0zcPa6cIpnzkKgLy0QuOfjFfoTvuXY3MxAH/9zBuFJcl5eSE42zT5cUNM1BPACOl66YXKXySYu0GaSO9HCwgKT6Ah7rVbhPJWi4ir8bszgsddQAZL38Nkr5xGi9u1CMLOQkSCmb8ipNrce9P0lX8F7bQ0LpVA+wbi0n4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(9686003)(26005)(8936002)(186003)(33656002)(30864003)(86362001)(71200400001)(8676002)(2906002)(110136005)(7696005)(19627405001)(5660300002)(52536014)(41300700001)(478600001)(38100700002)(122000001)(38070700005)(66556008)(6506007)(64756008)(55016003)(66476007)(66946007)(91956017)(66446008)(82960400001)(76116006)(4326008)(83380400001)(316002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CFtSJqqulTiKVUoVFmJDFenaBDj1WULSOgyN55fUAhoLGIZb10wl0Xkcd5?=
 =?iso-8859-1?Q?jb/I4y1Qo55hlAaesKY9Bu/xgBlZfo8tcOtV6H1vAvbNHXRzN5YfI7u/7U?=
 =?iso-8859-1?Q?TZIr22AhJhDsAlG+Cp/DwuEB2+ahsECU93O50mijFFn842T2airNVs3j85?=
 =?iso-8859-1?Q?6ycjAHgJ6ehwgkGo3nj4x4gt2c04MZ7vlc+dlj0Wm+d1wiTyAiGmuIQx+g?=
 =?iso-8859-1?Q?MmBC9c1KsQwEFdPOpYF/2XW7Kwd2lO2nw6pIzPzf4vBpHeQE61wjh+MAUr?=
 =?iso-8859-1?Q?gr+F24Ud60eAq0lpwIBDybcnxq76QfLV5wTs/Bz1W60NoUKJU0KckCKkuw?=
 =?iso-8859-1?Q?csmb+DjEnP1fH4kTOqD3/hq9CcsVtLBDXuIMV+/j+T0sB2xl364HGogLOp?=
 =?iso-8859-1?Q?WQw8bHdbLO9uCWdBmIy27xLaKz24dqdC6/Hp6zodwcwR0POeSco93117/v?=
 =?iso-8859-1?Q?wtOWrG9FPFGYNNOJpaDkhR80HdZf7EMsHl/neJwbEMaJkQXnizNffuSHTW?=
 =?iso-8859-1?Q?kuiTvfJFSL1FRjre0/H767WS018DPxXyuDvCtdpvcc+sHRIQFop1z5cC4Y?=
 =?iso-8859-1?Q?QWplMkETQTR9bpmsl0vR0kXtAPHTP0FhrCmUoYJAm5Qpfmkp21Zm5A8iXc?=
 =?iso-8859-1?Q?802yDRAhXiOZ0EPqncUnPhBewlBlo9Qpl4caMX8kqj7+K2ytVaejhWi09j?=
 =?iso-8859-1?Q?+/Yyp4Io6zfzHYTCNSn9o/0aGRwKyfQMVttDYglKLBWWmQjCY+nmVehiKf?=
 =?iso-8859-1?Q?E0GTatpWrgFn5tSVeJr7coe1FozV575ujaifnQ3dffzTPcRP9zYLsHifjH?=
 =?iso-8859-1?Q?vgSsHAY8U+eU4YkAQKSpWXrIgaDFmYBBs8BNpVn/Zwij5yDucZxh8E5jJS?=
 =?iso-8859-1?Q?DOLW9LFUYdxRWVdApF6BcBvx0kNHu9JWRI78o4IaExQ31TZyv8pa8QmNdi?=
 =?iso-8859-1?Q?+TqSHGfpjTvoi9DbH+jIaSeHwdgPZpT5YdSfUHu1CdMXZogZMQsH4gFe6T?=
 =?iso-8859-1?Q?nuxStoYNjUjMxCrWV1cfdaIo9OKMx61lek6GVF6QhRnrN1xYSHP/agsGrp?=
 =?iso-8859-1?Q?sA5B66NKPJSaQeVQQRN6DMtDp9tGcze8n5m1MPq/BatG2sYfYhlpl9CCyL?=
 =?iso-8859-1?Q?l1K2azwdjswh0sHMl27S+z+Ql/dX9wSRbFvCiU0umLfgjh8+1hkkK+v8po?=
 =?iso-8859-1?Q?xpmFnXlyAL1jJ8K/wxPVgsjMW4qAv35lgIWCPTl/Pgr7UCTNZIzJ9JuhW6?=
 =?iso-8859-1?Q?b4NzKD6Avyf0idAkokq67BsjuPqdvHaXaWN/EzLUBTgRPpbMMOcebuXgVv?=
 =?iso-8859-1?Q?eLeSf3DoT9jUq293HPSEoJTCJOUhwVHKuWS5BvjdNBEZrK6UvhrDKX2qCa?=
 =?iso-8859-1?Q?TXk09XHSF05ZGZ5GRk04ZZZtjkjynFjlvGNW5eALyOde+i/UnyXOqpsTjU?=
 =?iso-8859-1?Q?pPwGuz4wGnNrkKkIJS7hqtz3sAE7MvCnHKHClS6oQ/mm6ry0VRydxCvjej?=
 =?iso-8859-1?Q?XLZwYSl0m8NF+H38m+VTGXH2J+IpRcOlEPjPlMOAjBZfpnX3MCl+35Y3NG?=
 =?iso-8859-1?Q?4Ds/hpI6ENCAnSlxVgnFmHFWUyBlODfvx1/+lKFwR7CZKOeNUwEpxahjj/?=
 =?iso-8859-1?Q?2t15xSxFCcpsw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567F99FD5CFB3E709B2B3879A2EABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbaf4ee-0be2-4bdf-b9ae-08db7cec0ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 00:09:10.4139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2P6o6urHeafFM44ApiL4uzEzNEQcFMocNuGGGzCWyn+Jq9ghvssecqmVEvEJ5UeuIvoRIm1HWO9s2cQdl8R+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
X-OriginatorOrg: intel.com
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567F99FD5CFB3E709B2B3879A2EABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Informal commit message for now.
>>>
>>> I got a bit impatient and curious to see if the idea we discussed would
>>> work so sketched something out. I think it is what I was describing bac=
k
>>> then..
>>>
>>> So high level idea is to teach the driver what caching modes are hidden
>>> behind PAT indices. Given you already had that in static tables, if we
>>> just turn the tables a bit around and add a driver abstraction of cachi=
ng
>>> modes this is what happens:
>>>
>>>  * We can lose the ugly runtime i915_gem_get_pat_index.
>>>
>>>  * We can have a smarter i915_gem_object_has_cache_level, which now can
>>>    use the above mentioned table to understand the caching modes and so
>>>    does not have to pessimistically return true for _any_ input when us=
er
>>>    has set the PAT index. This may improve things even for MTL.
>>>
>>>  * We can simplify the debugfs printout to be platform agnostic.
>>>
>>>  * We are perhaps opening the door to un-regress the dodgy addition
>>>    made to i915_gem_object_can_bypass_llc? See QQQ/FIXME in the patch.
>>>
>>> I hope I did not forget anything, but anyway, please have a read and se=
e
>>> what you think. I think it has potential.
>>>
>>> Proper commit message can come later.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Fei Yang <fei.yang@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
>>>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
>>>  .../drm/i915/display/intel_plane_initial.c    |   4 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  66 +++++-----
>>>  drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   7 +-
>>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  13 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  10 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 116 +++++++++--------
>>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
>>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 117 +++---------------
>>>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  13 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  43 ++++---
>>>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
>>>  .../drm/i915/gem/selftests/huge_gem_object.c  |   6 +-
>>>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   8 +-
>>>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  19 +--
>>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  33 ++---
>>>  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
>>>  drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
>>>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
>>>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +-
>>>  drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
>>>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
>>>  drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
>>>  drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +--
>>>  drivers/gpu/drm/i915/gt/selftest_timeline.c   |   1 +
>>>  drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
>>>  .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
>>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
>>>  drivers/gpu/drm/i915/i915_cache.c             |  72 +++++++++++
>>>  drivers/gpu/drm/i915/i915_cache.h             |  49 ++++++++
>>>  drivers/gpu/drm/i915/i915_debugfs.c           |  65 +++-------
>>>  drivers/gpu/drm/i915/i915_driver.c            |   5 +
>>>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>>>  drivers/gpu/drm/i915/i915_gem.c               |  21 +---
>>>  drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
>>>  drivers/gpu/drm/i915/i915_pci.c               |  83 +++++++------
>>>  drivers/gpu/drm/i915/i915_perf.c              |   2 +-
>>>  drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
>>>  drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
>>>  .../gpu/drm/i915/selftests/i915_gem_evict.c   |   8 +-
>>>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  13 +-
>>>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
>>>  .../drm/i915/selftests/intel_memory_region.c  |   4 +-
>>>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  12 +-
>>>  drivers/gpu/drm/i915/selftests/mock_region.c  |   2 +-
>>>  54 files changed, 440 insertions(+), 485 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/i915/i915_cache.c
>>>  create mode 100644 drivers/gpu/drm/i915/i915_cache.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makef=
ile
>>> index 2be9dd960540..2c3da8f0c78e 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -30,6 +30,7 @@ subdir-ccflags-y +=3D -I$(srctree)/$(src)
>>>  # core driver code
>>>  i915-y +=3D i915_driver.o \
>>>            i915_drm_client.o \
>>> +         i915_cache.o \
>>>            i915_config.o \
>>>            i915_getparam.o \
>>>            i915_ioctl.o \
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm=
/i915/display/intel_dpt.c
>>> index 7c5fddb203ba..5baf0d27a288 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>>> @@ -268,7 +268,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>>>
>>>          ret =3D i915_gem_object_lock_interruptible(dpt_obj, NULL);
>>>          if (!ret) {
>>> -               ret =3D i915_gem_object_set_cache_level(dpt_obj, I915_C=
ACHE_NONE);
>>> +               ret =3D i915_gem_object_set_cache(dpt_obj, I915_CACHE(U=
C));
>>>                  i915_gem_object_unlock(dpt_obj);
>>>          }
>>>          if (ret) {
>>> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/=
drm/i915/display/intel_fb_pin.c
>>> index fffd568070d4..dcf54b354a74 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>>> @@ -66,7 +66,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
>>>                                  continue;
>>>                  }
>>>
>>> -               ret =3D i915_gem_object_set_cache_level(obj, I915_CACHE=
_NONE);
>>> +               ret =3D i915_gem_object_set_cache(obj, I915_CACHE(UC));
>>>                  if (ret)
>>>                          continue;
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drive=
rs/gpu/drm/i915/display/intel_plane_initial.c
>>> index 736072a8b2b0..9988f6562392 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>>> @@ -121,8 +121,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>>>           * cache_level during fbdev initialization. The
>>>           * unbind there would get stuck waiting for rcu.
>>>           */
>>> -       i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
>>> -                                           I915_CACHE_WT : I915_CACHE_=
NONE);
>>> +       i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ? I915_CA=
CHE(WT) :
>>> +                                                               I915_CA=
CHE(UC));
>>>
>>>          switch (plane_config->tiling) {
>>>          case I915_TILING_NONE:
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_domain.c
>>> index dfaaa8b66ac3..f899da2c622a 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>>> @@ -8,6 +8,7 @@
>>>  #include "display/intel_frontbuffer.h"
>>>  #include "gt/intel_gt.h"
>>>
>>> +#include "i915_cache.h"
>>>  #include "i915_drv.h"
>>>  #include "i915_gem_clflush.h"
>>>  #include "i915_gem_domain.h"
>>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct drm_i915_=
gem_object *obj)
>>>          if (IS_DGFX(i915))
>>>                  return false;
>>>
>>> -       /*
>>> -        * For objects created by userspace through GEM_CREATE with pat=
_index
>>> -        * set by set_pat extension, i915_gem_object_has_cache_level() =
will
>>> -        * always return true, because the coherency of such object is =
managed
>>> -        * by userspace. Othereise the call here would fall back to che=
cking
>>> -        * whether the object is un-cached or write-through.
>>> -        */
>>> -       return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) =
||
>>> -                i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>> +       return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) =
!=3D 1 &&
>>> +              i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) =
!=3D 1;
>>
>> This logic was changed for objects with pat index set by user here. It
>> used to return false
>> regardless the cache mode. But now it returns true if its cache mode is
>> neither UC nor WT.
>
> Yes, that was half of the motivation of the refactory. Before the PAT ind=
ex series code was like this:
>
>        return !(obj->cache_level =3D=3D I915_CACHE_NONE ||
>                 obj->cache_level =3D=3D I915_CACHE_WT);
>
> So kernel knew it needs to flush only if caching mode is neither UC or WT=
. With the PAT index series you changed it to:
>
>        return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>                 i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>
> And as i915_gem_object_has_cache_level was changed to always return true =
if PAT was set by user, that made the check meaningless for such objects.

But the point is that the KMD should not flush the cache for objects with
PAT set by user because UMD is handling the cache conherency. That is the
design. Well doing so wouldn't cause functional issue, but it's unecessary
and might have performance impact.

> With my refactoring it becomes meaningful again and restores to the origi=
nal behaviour. That's the intent at least.
>
>>>  bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>>> @@ -255,9 +249,9 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_g=
em_object *obj, bool write)
>>>  }
>>>
>>>  /**
>>> - * i915_gem_object_set_cache_level - Changes the cache-level of an obj=
ect across all VMA.
>>> + * i915_gem_object_set_cache - Changes the cache-level of an object ac=
ross all VMA.
>>>   * @obj: object to act on
>>> - * @cache_level: new cache level to set for the object
>>> + * @cache: new caching mode to set for the object
>>>   *
>>>   * After this function returns, the object will be in the new cache-le=
vel
>>>   * across all GTT and the contents of the backing storage will be cohe=
rent,
>>> @@ -269,19 +263,28 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915=
_gem_object *obj, bool write)
>>>   * cache coherency) and all non-MOCS GPU access will also be uncached =
so
>>>   * that all direct access to the scanout remains coherent.
>>>   */
>>> -int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
>>> -                                   enum i915_cache_level cache_level)
>>> +int i915_gem_object_set_cache(struct drm_i915_gem_object *obj,
>>> +                             i915_cache_t cache)
>>>  {
>>> +       struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>>>          int ret;
>>>
>>> -       /*
>>> -        * For objects created by userspace through GEM_CREATE with pat=
_index
>>> -        * set by set_pat extension, simply return 0 here without touch=
ing
>>> -        * the cache setting, because such objects should have an immut=
able
>>> -        * cache setting by desgin and always managed by userspace.
>>> -        */
>>> -       if (i915_gem_object_has_cache_level(obj, cache_level))
>>> +       ret =3D i915_cache_find_pat(i915, cache);
>>> +       if (ret < 0) {
>>> +               struct drm_printer p =3D
>>> +                       drm_err_printer("Attempting to use unknown cach=
ing mode ");
>>> +
>>> +               i915_cache_print(&p, cache);
>>> +               drm_puts(&p, "!\n");
>>> +
>>> +               return -EINVAL;
>>> +       } else if (ret =3D=3D obj->pat_index) {
>>>                  return 0;
>>
>> We will have to do this conversion and checking again later in this
>> function when calling i915_gem_object_set_cache_coherency().
>
> Yes the double lookup part is a bit naff. It is not super required
> apart for validating internal callers (could be a debug build only
> feature perhaps) and to see if PAT index has changed and so whether
> it needs to call i915_gem_object_wait before proceeding to
> i915_gem_object_set_cache_coherency...
>
>> My thought was to simply remove the use of cache_level/cache and replace
>> it with pat_idex. Conversion from cache modes to pat index should be don=
e
>> before calling any function used to consume cache_level/cache.
>
> ... I could probably call the setter which takes PAT index instead of
> i915_gem_object_set_cache_coherency few lines below. That would skip the
> double lookup and make you happy(-ier)?

Do you see any problem just letting these functions take pat_index as the
second argument? These functions are currently called with a constant
cache_level/mode, if we have INTEL_INFO(i915)->pat_uc/wt/wb set properly,
using pat index makes no difference, right?

>>
>>> +       } else if (obj->pat_set_by_user) {
>>
>> Shouldn't this if-statement be placed at the beginning of this function?
>> the original
>> i915_gem_object_has_cache_level() would return true if
>> (obj->pat_set_by_user), so the
>> function returns right away.
>>
>>> +               drm_notice_once(&i915->drm,
>>> +                               "Attempting to change caching mode on a=
n object with fixed PAT!\n");
>>> +               return -EINVAL;
>>> +       }
>>>
>>>          ret =3D i915_gem_object_wait(obj,
>>>                                     I915_WAIT_INTERRUPTIBLE |
>>> @@ -291,7 +294,7 @@ int i915_gem_object_set_cache_level(struct drm_i915=
_gem_object *obj,
>>>                  return ret;
>>>
>>>          /* Always invalidate stale cachelines */
>>> -       i915_gem_object_set_cache_coherency(obj, cache_level);
>>> +       i915_gem_object_set_cache_coherency(obj, cache);
>>>          obj->cache_dirty =3D true;
>>>
>>>          /* The cache-level will be applied when each vma is rebound. *=
/
>>> @@ -326,10 +329,9 @@ int i915_gem_get_caching_ioctl(struct drm_device *=
dev, void *data,
>>>                  goto out;
>>>          }
>>>
>>> -       if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
>>> -           i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>>> +       if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB))
>>
>> This looks wrong, at least for MTL. Prior to MTL the GPU automatically s=
noop
>> CPU cache, but from MTL onward you have to specify if WB or WB + 1-WAY
>> COH is needed. And for KMD, cacheable mode means WB + 1-WAY COH for MTL =
to keep the
>> behavior consistent.
>>
>> This used to be taken care of by i915_gem_get_pat_index() call. With
>> that being replaced by i915_cache_find_pat(), you would need to do somet=
hing there.
>> But, without cachelevel_to_pat[], you might end up hard coding something
>> directly in the function, and that is platform dependent. hmm..., I don'=
t really
>> like this idea.
>>
>> That's why I commented in v1 that we should use INTEL_INFO(i915)->pat_uc=
/wb/wt
>> instead of enum i915_cache_level or i915_cache_t.
>
> I think I get it. I hope so.. So if I made the tables like this:
>
> #define LEGACY_CACHE_MODES \
>        .cache_modes =3D { \
>                [0] =3D I915_CACHE(UC), \
>                [1] =3D _I915_CACHE(WB, COH1W), \
>                [2] =3D _I915_CACHE(WB, COH1W | L3), \ // 2way??
>                [3] =3D I915_CACHE(WT), \
>         }
>
> #define GEN12_CACHE_MODES \
>        .cache_modes =3D { \
>                [0] =3D _I915_CACHE(WB, COH1W), \
>                [1] =3D I915_CACHE(WC), \
>                [2] =3D I915_CACHE(WT), \
>                [3] =3D I915_CACHE(UC), \
>         }
>
> #define MTL_CACHE_MODES \
>        .cache_modes =3D { \
>                [0] =3D _I915_CACHE(WB, COH1W), \
>                [1] =3D I915_CACHE(WT), \
>                [2] =3D I915_CACHE(UC), \
>                [3] =3D _I915_CACHE(WB, COH1W), \
>                [4] =3D _I915_CACHE(WB, COH2W), \
>
> And made i915->pat_wc look up _I915_CACHE(WB, COH1W) would that work?
> Hmm and also all "has cache level" call sites would need to look not just
> for WB but WB+COH1W.
>
> Would it work? Too ugly?

I don't think this would work. The cache_modes needs to be aligned with BSp=
ec,
otherwise checkings for INTEL_INFO(i915)->cache_modes[obj->pat_index] might
become invalid. Also, COH1W/2W were not even there for platforms prior to M=
TL.

I still think setting INTEL_INFO(i915)->pat_uc/wt/wb is the best solution.
With that we can also eliminate the use of I915_CACHE({UC|WT|WB}).

>>
>>>                  args->caching =3D I915_CACHING_CACHED;
>>> -       else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>>> +       else if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT=
))
>>>                  args->caching =3D I915_CACHING_DISPLAY;
>>>          else
>>>                  args->caching =3D I915_CACHING_NONE;
>>> @@ -344,7 +346,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *d=
ev, void *data,
>>>          struct drm_i915_private *i915 =3D to_i915(dev);
>>>          struct drm_i915_gem_caching *args =3D data;
>>>          struct drm_i915_gem_object *obj;
>>> -       enum i915_cache_level level;
>>> +       i915_cache_t cache;
>>>          int ret =3D 0;
>>>
>>>          if (IS_DGFX(i915))
>>> @@ -355,7 +357,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *d=
ev, void *data,
>>>
>>>          switch (args->caching) {
>>>          case I915_CACHING_NONE:
>>> -               level =3D I915_CACHE_NONE;
>>> +               cache =3D I915_CACHE(UC);
>>
>> For code like this, my thought was
>>
>> -               level =3D I915_CACHE_NONE;
>> +               pat_index =3D INTEL_INFO(i915)->pat_uc;
>>
>> And later the set_cache call should take pat_index as argument instead
>> of cache mode.
>>
>>>                  break;
>>>          case I915_CACHING_CACHED:
>>>                  /*
>>> @@ -367,10 +369,10 @@ int i915_gem_set_caching_ioctl(struct drm_device =
*dev, void *data,
>>>                  if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
>>>                          return -ENODEV;
>>>
>>> -               level =3D I915_CACHE_LLC;
>>> +               cache =3D I915_CACHE(WB);
>>
>> -               level =3D I915_CACHE_LLC;
>> +               pat_index =3D INTEL_INFO(i915)->pat_wb;
>>
>> This should take care of the WB + 1-WAY COH issue for MTL mentioned abov=
e,
>> assuming the i915_cache_init() set pat_wb properly, and the
>> i915_gem_object_set_cache() consumes pat_index instead of cache mode.
>
> That works too yes.
>
>>
>>>                  break;
>>>          case I915_CACHING_DISPLAY:
>>> -               level =3D HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NON=
E;
>>> +               cache =3D HAS_WT(i915) ? I915_CACHE(WT) : I915_CACHE(UC=
);
>>>                  break;
>>>          default:
>>>                  return -EINVAL;
>>> @@ -409,7 +411,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *d=
ev, void *data,
>>>          if (ret)
>>>                  goto out;
>>>
>>> -       ret =3D i915_gem_object_set_cache_level(obj, level);
>>> +       ret =3D i915_gem_object_set_cache(obj, cache);
>>>          i915_gem_object_unlock(obj);
>>>
>>>  out:
>>> @@ -448,9 +450,9 @@ i915_gem_object_pin_to_display_plane(struct drm_i91=
5_gem_object *obj,
>>>           * of uncaching, which would allow us to flush all the LLC-cac=
hed data
>>>           * with that bit in the PTE to main memory with just one PIPE_=
CONTROL.
>>>           */
>>> -       ret =3D i915_gem_object_set_cache_level(obj,
>>> -                                             HAS_WT(i915) ?
>>> -                                             I915_CACHE_WT : I915_CACH=
E_NONE);
>>> +       ret =3D i915_gem_object_set_cache(obj,
>>> +                                       HAS_WT(i915) ?
>>> +                                       I915_CACHE(WT) : I915_CACHE(UC)=
);
>>>          if (ret)
>>>                  return ERR_PTR(ret);
>>>

[...]

>>>
>>>  bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>> @@ -215,6 +222,7 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>>          /*
>>>           * Always flush cache for UMD objects at creation time.
>>>           */
>>> +       /* QQQ/FIXME why? avoidable performance penalty? */

This is needed because UMD's assume zero-initialized BO's are really zero'e=
d out
before getting the handles to the BO's (See VLK-46522). Otherwise UMD's cou=
ld read
stale data, thus cause security issues.

>>>          if (obj->pat_set_by_user)
>>>                  return true;
>>>

[...]

>>> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm=
/i915/intel_device_info.h
>>> index dbfe6443457b..f48a21895a85 100644
>>> --- a/drivers/gpu/drm/i915/intel_device_info.h
>>> +++ b/drivers/gpu/drm/i915/intel_device_info.h
>>> @@ -27,6 +27,8 @@
>>>
>>>  #include <uapi/drm/i915_drm.h>
>>>
>>> +#include "i915_cache.h"
>>> +
>>>  #include "intel_step.h"
>>>
>>>  #include "gt/intel_engine_types.h"
>>> @@ -243,8 +245,8 @@ struct intel_device_info {
>>>           */
>>>          const struct intel_runtime_info __runtime;
>>>
>>> -       u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
>>> -       u32 max_pat_index;
>>> +       i915_cache_t cache_modes[9];
>>
>> I was commenting on the array size here. It's probably better to make it=
 16
>> because there are 4 PAT index bits defined in the PTE. Indices above
>> max_pat_index
>> are not used, but theoretically new mode could be added. Well, it's up
>> to you,
>> not likely to happen anyway.
>
> Ah okay. I am not too concerned. Compiler will let us know if it happens.
>
> Unrelated to this comment - what about i915_gem_object_can_bypass_llc?
> Could we do better (less pessimistic) with something like my approach and
> so maybe penalize MTL less?

The problem is that, for the BO's managed by UMD's, the KMD doesn't know
whether they are going to be mapped as cacheable or uncacheable on the CPU
side. The PAT index controls GPU access only. That's why we make sure all
BO's with PAT set by UMD (which means UMD will take control and managing th=
e
coherency) are clflush'ed.

-Fei

> Regards,
>
> Tvrtko


--_000_BYAPR11MB2567F99FD5CFB3E709B2B3879A2EABYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<div class=3D"ContentPasted0">&gt;&gt;&gt; From: Tvrtko Ursulin &lt;tvrtko.=
ursulin@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Informal commit message for now.=
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; I got a bit impatient and curiou=
s to see if the idea we discussed would</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; work so sketched something out. =
I think it is what I was describing back</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; then..</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; So high level idea is to teach t=
he driver what caching modes are hidden</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; behind PAT indices. Given you al=
ready had that in static tables, if we</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; just turn the tables a bit aroun=
d and add a driver abstraction of caching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; modes this is what happens:</div=
>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;* We can lose the ugly run=
time i915_gem_get_pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;* We can have a smarter i9=
15_gem_object_has_cache_level, which now can</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp;use the above menti=
oned table to understand the caching modes and so</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp;does not have to pe=
ssimistically return true for _any_ input when user</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp;has set the PAT ind=
ex. This may improve things even for MTL.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;* We can simplify the debu=
gfs printout to be platform agnostic.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;* We are perhaps opening t=
he door to un-regress the dodgy addition</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp;made to i915_gem_ob=
ject_can_bypass_llc? See QQQ/FIXME in the patch.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; I hope I did not forget anything=
, but anyway, please have a read and see</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; what you think. I think it has p=
otential.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Proper commit message can come l=
ater.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Signed-off-by: Tvrtko Ursulin &l=
t;tvrtko.ursulin@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Cc: Fei Yang &lt;fei.yang@intel.=
com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/Makef=
ile &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 1 +</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/displ=
ay/intel_dpt.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/displ=
ay/intel_fb_pin.c &nbsp; | &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../drm/i915/display/intel=
_plane_initial.c &nbsp; &nbsp;| &nbsp; 4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_domain.c &nbsp; &nbsp;| &nbsp;66 +++++-----</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_domain.h &nbsp; &nbsp;| &nbsp; 7 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/gem/i915_=
gem_execbuffer.c &nbsp; &nbsp;| &nbsp;13 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_internal.c &nbsp;| &nbsp; 6 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_mman.c &nbsp; &nbsp; &nbsp;| &nbsp;10 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_object.c &nbsp; &nbsp;| 116 +++++++++--------</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_object.h &nbsp; &nbsp;| &nbsp; 9 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/gem/i915_=
gem_object_types.h &nbsp;| 117 +++---------------</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_shmem.c &nbsp; &nbsp; | &nbsp;10 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_stolen.c &nbsp; &nbsp;| &nbsp;13 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_ttm_move.c &nbsp;| &nbsp;43 ++++---</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gem/i=
915_gem_userptr.c &nbsp; | &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../drm/i915/gem/selftests=
/huge_gem_object.c &nbsp;| &nbsp; 6 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/gem/selft=
ests/huge_pages.c &nbsp; | &nbsp; 8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/ge=
n6_ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/ge=
n8_ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;19 +--</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_engine_cs.c &nbsp; &nbsp; | &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_ggtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;33 ++---</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_ggtt_gmch.c &nbsp; &nbsp; | &nbsp; 4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_gtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_gtt.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 3 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_migrate.c &nbsp; &nbsp; &nbsp; | &nbsp;11 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 6 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/gt/intel_=
ring_submission.c &nbsp; | &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/in=
tel_timeline.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/se=
lftest_hangcheck.c &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/se=
lftest_migrate.c &nbsp; &nbsp;| &nbsp; 9 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/se=
lftest_reset.c &nbsp; &nbsp; &nbsp;| &nbsp;14 +--</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/se=
lftest_timeline.c &nbsp; | &nbsp; 1 +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/se=
lftest_tlb.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 5 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/gt/selfte=
st_workarounds.c &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/uc=
/intel_guc.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/gt/uc=
/intel_uc_fw.c &nbsp; &nbsp; &nbsp;| &nbsp; 8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
cache.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;72 +++++++++++</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
cache.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;49 ++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
debugfs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;65 +++-------</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
driver.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 5 +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
drv.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 3 +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
gem.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;21 +---</div=
>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
gpu_error.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 7 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
pci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;83 +++++++--=
----</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/i915_=
perf.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/intel=
_device_info.h &nbsp; &nbsp; &nbsp;| &nbsp; 6 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/selft=
ests/i915_gem.c &nbsp; &nbsp; | &nbsp; 5 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/selftests=
/i915_gem_evict.c &nbsp; | &nbsp; 8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/selft=
ests/i915_gem_gtt.c | &nbsp;13 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/selft=
ests/igt_spinner.c &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../drm/i915/selftests/int=
el_memory_region.c &nbsp;| &nbsp; 4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;.../gpu/drm/i915/selftests=
/mock_gem_device.c &nbsp;| &nbsp;12 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;drivers/gpu/drm/i915/selft=
ests/mock_region.c &nbsp;| &nbsp; 2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;54 files changed, 440 inse=
rtions(+), 485 deletions(-)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;create mode 100644 drivers=
/gpu/drm/i915/i915_cache.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;create mode 100644 drivers=
/gpu/drm/i915/i915_cache.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/Makefile b/drivers/gpu/drm/i915/Makefile</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index 2be9dd960540..2c3da8f0c78e=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/Makef=
ile</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/Makef=
ile</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -30,6 +30,7 @@ subdir-ccflags=
-y +=3D -I$(srctree)/$(src)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;# core driver code</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;i915-y +=3D i915_driver.o =
\</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_drm_client.o \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; i9=
15_cache.o \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_config.o \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_getparam.o \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_ioctl.o \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index 7c5fddb203ba..5baf0d27a288=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/displ=
ay/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/displ=
ay/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -268,7 +268,7 @@ intel_dpt_cr=
eate(struct intel_framebuffer *fb)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;ret =3D i915_gem_object_lock_interruptible(dpt_obj, NULL);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (!ret) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; ret =3D i915_gem_object_set_cache_level(dpt_obj, I915_CA=
CHE_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; ret =3D i915_gem_object_set_cache(dpt_obj, I915_CACHE(UC=
));</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_unlock(dpt_obj);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;}</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (ret) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c</div=
>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index fffd568070d4..dcf54b354a74=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/displ=
ay/intel_fb_pin.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/displ=
ay/intel_fb_pin.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -66,7 +66,7 @@ intel_pin_fb_o=
bj_dpt(struct drm_framebuffer *fb,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;continue;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; ret =3D i915_gem_object_set_cache_level(obj, I915_CACHE_=
NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; ret =3D i915_gem_object_set_cache(obj, I915_CACHE(UC));<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if (ret)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_=
initial.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index 736072a8b2b0..9988f6562392=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/displ=
ay/intel_plane_initial.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/displ=
ay/intel_plane_initial.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -121,8 +121,8 @@ initial_plan=
e_vma(struct drm_i915_private *i915,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; * cache_level during fbdev initialization. The</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; * unbind there would get stuck waiting for rcu.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; i915_gem_=
object_set_cache_coherency(obj, HAS_WT(i915) ?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE_WT : I915_CACHE_NONE);=
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; i915_gem_=
object_set_cache_coherency(obj, HAS_WT(i915) ? I915_CACHE(WT) :</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE(UC));</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;switch (plane_config-&gt;tiling) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;case I915_TILING_NONE:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index dfaaa8b66ac3..f899da2c622a=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i=
915_gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i=
915_gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -8,6 +8,7 @@</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;display/int=
el_frontbuffer.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;gt/intel_gt=
.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +#include &quot;i915_cache.h&quo=
t;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;i915_drv.h&=
quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;i915_gem_cl=
flush.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;i915_gem_do=
main.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -27,15 +28,8 @@ static bool g=
pu_write_needs_clflush(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (IS_DGFX(i915))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* F=
or objects created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* s=
et by set_pat extension, i915_gem_object_has_cache_level() will</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* a=
lways return true, because the coherency of such object is managed</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* b=
y userspace. Othereise the call here would fall back to checking</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* w=
hether the object is un-cached or write-through.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;*/<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; return !(=
i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;i915_gem_object_has_cache_level(obj, I915_CACHE_WT=
));</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; return i9=
15_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) !=3D 1 &amp;&amp;</di=
v>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) !=
=3D 1;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This logic was changed for objects w=
ith pat index set by user here. It</div>
<div class=3D"ContentPasted0">&gt;&gt; used to return false</div>
<div class=3D"ContentPasted0">&gt;&gt; regardless the cache mode. But now i=
t returns true if its cache mode is</div>
<div class=3D"ContentPasted0">&gt;&gt; neither UC nor WT.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Yes, that was half of the motivation of =
the refactory. Before the PAT index series code was like this:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp;return !(obj-=
&gt;cache_level =3D=3D I915_CACHE_NONE ||</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; obj-&gt;cache_level =3D=3D I915_CACHE_WT);</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; So kernel knew it needs to flush only if=
 caching mode is neither UC or WT. With the PAT index series you changed it=
 to:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp;return !(i915=
_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; i915_gem_object_has_cache_level(obj, I915_CACHE_WT));</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; And as i915_gem_object_has_cache_level w=
as changed to always return true if PAT was set by user, that made the chec=
k meaningless for such objects.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">But the point is that the KMD should not flus=
h the cache for objects with</div>
<div class=3D"ContentPasted0">PAT set by user because UMD is handling the c=
ache conherency. That is the</div>
<div class=3D"ContentPasted0">design. Well doing so wouldn't cause function=
al issue, but it's unecessary</div>
<div class=3D"ContentPasted0">and might have performance impact.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; With my refactoring it becomes meaningfu=
l again and restores to the original behaviour. That's the intent at least.=
</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;bool i915_gem_cpu_write_ne=
eds_clflush(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -255,9 +249,9 @@ i915_gem_obj=
ect_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;/**</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - * i915_gem_object_set_cache_le=
vel - Changes the cache-level of an object across all VMA.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + * i915_gem_object_set_cache - =
Changes the cache-level of an object across all VMA.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; * @obj: object to act on<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - * @cache_level: new cache leve=
l to set for the object</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + * @cache: new caching mode to =
set for the object</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; * After this function ret=
urns, the object will be in the new cache-level</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; * across all GTT and the =
contents of the backing storage will be coherent,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -269,19 +263,28 @@ i915_gem_o=
bject_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; * cache coherency) and al=
l non-MOCS GPU access will also be uncached so</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; * that all direct access =
to the scanout remains coherent.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; -int i915_gem_object_set_cache_l=
evel(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; enum i915_cache_level cache_level)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +int i915_gem_object_set_cache(s=
truct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_ca=
che_t cache)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;{</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; struct dr=
m_i915_private *i915 =3D to_i915(obj-&gt;base.dev);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;int ret;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* F=
or objects created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* s=
et by set_pat extension, simply return 0 here without touching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* t=
he cache setting, because such objects should have an immutable</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;* c=
ache setting by desgin and always managed by userspace.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;*/<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; if (i915_=
gem_object_has_cache_level(obj, cache_level))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; ret =3D i=
915_cache_find_pat(i915, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; if (ret &=
lt; 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; struct drm_printer p =3D</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_err_printer(&quot;Attemp=
ting to use unknown caching mode &quot;);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; i915_cache_print(&amp;p, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; drm_puts(&amp;p, &quot;!\n&quot;);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; } else if=
 (ret =3D=3D obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return 0;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; We will have to do this conversion a=
nd checking again later in this</div>
<div class=3D"ContentPasted0">&gt;&gt; function when calling i915_gem_objec=
t_set_cache_coherency().</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Yes the double lookup part is a bit naff=
. It is not super required</div>
<div class=3D"ContentPasted0">&gt; apart for validating internal callers (c=
ould be a debug build only</div>
<div class=3D"ContentPasted0">&gt; feature perhaps) and to see if PAT index=
 has changed and so whether</div>
<div class=3D"ContentPasted0">&gt; it needs to call i915_gem_object_wait be=
fore proceeding to</div>
<div class=3D"ContentPasted0">&gt; i915_gem_object_set_cache_coherency...</=
div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; My thought was to simply remove the =
use of cache_level/cache and replace</div>
<div class=3D"ContentPasted0">&gt;&gt; it with pat_idex. Conversion from ca=
che modes to pat index should be done</div>
<div class=3D"ContentPasted0">&gt;&gt; before calling any function used to =
consume cache_level/cache.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; ... I could probably call the setter whi=
ch takes PAT index instead of</div>
<div class=3D"ContentPasted0">&gt; i915_gem_object_set_cache_coherency few =
lines below. That would skip the</div>
<div class=3D"ContentPasted0">&gt; double lookup and make you happy(-ier)?<=
/div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Do you see any problem just letting these fun=
ctions take pat_index as the</div>
<div class=3D"ContentPasted0">second argument? These functions are currentl=
y called with a constant</div>
<div class=3D"ContentPasted0">cache_level/mode, if we have INTEL_INFO(i915)=
-&gt;pat_uc/wt/wb set properly,</div>
<div class=3D"ContentPasted0">using pat index makes no difference, right?</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; } else if=
 (obj-&gt;pat_set_by_user) {</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Shouldn't this if-statement be place=
d at the beginning of this function?</div>
<div class=3D"ContentPasted0">&gt;&gt; the original</div>
<div class=3D"ContentPasted0">&gt;&gt; i915_gem_object_has_cache_level() wo=
uld return true if</div>
<div class=3D"ContentPasted0">&gt;&gt; (obj-&gt;pat_set_by_user), so the</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; function returns right away.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; drm_notice_once(&amp;i915-&gt;drm,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&quot;Attempting to change caching mode on an object with fixed PAT!\n&quot=
;);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;ret =3D i915_gem_object_wait(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; I915_WAIT_INTERRUPTIBLE |</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -291,7 +294,7 @@ int i915_gem=
_object_set_cache_level(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return ret;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* Always invalidate stale cachelines */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; i915_gem_=
object_set_cache_coherency(obj, cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; i915_gem_=
object_set_cache_coherency(obj, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj-&gt;cache_dirty =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* The cache-level will be applied when each vma is rebound. */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -326,10 +329,9 @@ int i915_ge=
m_get_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;}</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; if (i915_=
gem_object_has_cache_level(obj, I915_CACHE_LLC) ||</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; if (i915_=
gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB))</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This looks wrong, at least for MTL. =
Prior to MTL the GPU automatically snoop</div>
<div class=3D"ContentPasted0">&gt;&gt; CPU cache, but from MTL onward you h=
ave to specify if WB or WB + 1-WAY</div>
<div class=3D"ContentPasted0">&gt;&gt; COH is needed. And for KMD, cacheabl=
e mode means WB + 1-WAY COH for MTL to keep the</div>
<div class=3D"ContentPasted0">&gt;&gt; behavior consistent.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This used to be taken care of by i91=
5_gem_get_pat_index() call. With</div>
<div class=3D"ContentPasted0">&gt;&gt; that being replaced by i915_cache_fi=
nd_pat(), you would need to do something there.</div>
<div class=3D"ContentPasted0">&gt;&gt; But, without cachelevel_to_pat[], yo=
u might end up hard coding something</div>
<div class=3D"ContentPasted0">&gt;&gt; directly in the function, and that i=
s platform dependent. hmm..., I don't really</div>
<div class=3D"ContentPasted0">&gt;&gt; like this idea.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; That's why I commented in v1 that we=
 should use INTEL_INFO(i915)-&gt;pat_uc/wb/wt</div>
<div class=3D"ContentPasted0">&gt;&gt; instead of enum i915_cache_level or =
i915_cache_t.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; I think I get it. I hope so.. So if I ma=
de the tables like this:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; #define LEGACY_CACHE_MODES \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cache_modes =
=3D { \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[0] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[1] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[2] =3D _I915_CACHE(WB, COH1W | L3), \ // 2way??</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[3] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt; </div>
<div class=3D"ContentPasted0">&gt; #define GEN12_CACHE_MODES \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cache_modes =
=3D { \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[0] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[1] =3D I915_CACHE(WC), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[2] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[3] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt; </div>
<div class=3D"ContentPasted0">&gt; #define MTL_CACHE_MODES \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cache_modes =
=3D { \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[0] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[1] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[2] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[3] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;[4] =3D _I915_CACHE(WB, COH2W), \</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; And made i915-&gt;pat_wc look up _I915_C=
ACHE(WB, COH1W) would that work?</div>
<div class=3D"ContentPasted0">&gt; Hmm and also all &quot;has cache level&q=
uot; call sites would need to look not just</div>
<div class=3D"ContentPasted0">&gt; for WB but WB+COH1W.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Would it work? Too ugly?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I don't think this would work. The cache_mode=
s needs to be aligned with BSpec,</div>
<div class=3D"ContentPasted0">otherwise checkings for INTEL_INFO(i915)-&gt;=
cache_modes[obj-&gt;pat_index] might</div>
<div class=3D"ContentPasted0">become invalid. Also, COH1W/2W were not even =
there for platforms prior to MTL.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I still think setting INTEL_INFO(i915)-&gt;pa=
t_uc/wt/wb is the best solution.</div>
<div class=3D"ContentPasted0">With that we can also eliminate the use of I9=
15_CACHE({UC|WT|WB}).</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;args-&gt;caching =3D I915_CACHING_CACHED;</di=
v>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; else if (=
i915_gem_object_has_cache_level(obj, I915_CACHE_WT))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; else if (=
i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;args-&gt;caching =3D I915_CACHING_DISPLAY;</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;else</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;args-&gt;caching =3D I915_CACHING_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -344,7 +346,7 @@ int i915_gem=
_set_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct drm_i915_private *i915 =3D to_i915(dev);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct drm_i915_gem_caching *args =3D data;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct drm_i915_gem_object *obj;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; enum i915=
_cache_level level;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; i915_cach=
e_t cache;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;int ret =3D 0;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (IS_DGFX(i915))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -355,7 +357,7 @@ int i915_gem=
_set_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;switch (args-&gt;caching) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;case I915_CACHING_NONE:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; level =3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; cache =3D I915_CACHE(UC);</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; For code like this, my thought was</=
div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; level =3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; pat_index =3D INTEL_INFO(i915)-&gt;pat_uc;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; And later the set_cache call should =
take pat_index as argument instead</div>
<div class=3D"ContentPasted0">&gt;&gt; of cache mode.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;case I915_CACHING_CACHED:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -367,10 +369,10 @@ int i915_g=
em_set_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if (!HAS_LLC(i915) &amp;&amp; !HAS_SNOOP(i915=
))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENODEV;</=
div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; level =3D I915_CACHE_LLC;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; cache =3D I915_CACHE(WB);</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; level =3D I915_CACHE_LLC;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; pat_index =3D INTEL_INFO(i915)-&gt;pat_wb;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This should take care of the WB + 1-=
WAY COH issue for MTL mentioned above,</div>
<div class=3D"ContentPasted0">&gt;&gt; assuming the i915_cache_init() set p=
at_wb properly, and the</div>
<div class=3D"ContentPasted0">&gt;&gt; i915_gem_object_set_cache() consumes=
 pat_index instead of cache mode.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; That works too yes.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;case I915_CACHING_DISPLAY:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; level =3D HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE=
;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; cache =3D HAS_WT(i915) ? I915_CACHE(WT) : I915_CACHE(UC)=
;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;default:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -409,7 +411,7 @@ int i915_gem=
_set_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (ret)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; ret =3D i=
915_gem_object_set_cache_level(obj, level);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; ret =3D i=
915_gem_object_set_cache(obj, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;i915_gem_object_unlock(obj);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;out:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -448,9 +450,9 @@ i915_gem_obj=
ect_pin_to_display_plane(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; * of uncaching, which would allow us to flush all the LLC-cached data</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; * with that bit in the PTE to main memory with just one PIPE_CONTROL.</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; ret =3D i=
915_gem_object_set_cache_level(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; HAS_WT(i915) ?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE_WT : I915_CACHE=
_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; ret =3D i=
915_gem_object_set_cache(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; HAS_WT(i915) ?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE(WT) : I915_CACHE(UC));</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (ret)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return ERR_PTR(ret);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">[...]</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;bool i915_gem_object_can_b=
ypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -215,6 +222,7 @@ bool i915_ge=
m_object_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; * Always flush cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; /* QQQ/FI=
XME why? avoidable performance penalty? */</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">This is needed because UMD's assume zero-init=
ialized BO's are really zero'ed out</div>
<div class=3D"ContentPasted0">before getting the handles to the BO's (See V=
LK-46522). Otherwise UMD's could read</div>
<div class=3D"ContentPasted0">stale data, thus cause security issues.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (obj-&gt;pat_set_by_user)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return true;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">[...]</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; diff --git a/drivers/gpu/drm/i91=
5/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index dbfe6443457b..f48a21895a85=
 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/intel=
_device_info.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/intel=
_device_info.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -27,6 +27,8 @@</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &lt;uapi/drm/i915=
_drm.h&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +#include &quot;i915_cache.h&quo=
t;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;intel_step.=
h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp;#include &quot;gt/intel_en=
gine_types.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; @@ -243,8 +245,8 @@ struct intel=
_device_info {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;const struct intel_runtime_info __runtime;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; u32 cache=
level_to_pat[I915_MAX_CACHE_LEVEL];</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; u32 max_p=
at_index;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; i915_cach=
e_t cache_modes[9];</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; I was commenting on the array size h=
ere. It's probably better to make it 16</div>
<div class=3D"ContentPasted0">&gt;&gt; because there are 4 PAT index bits d=
efined in the PTE. Indices above</div>
<div class=3D"ContentPasted0">&gt;&gt; max_pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; are not used, but theoretically new =
mode could be added. Well, it's up</div>
<div class=3D"ContentPasted0">&gt;&gt; to you,</div>
<div class=3D"ContentPasted0">&gt;&gt; not likely to happen anyway.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Ah okay. I am not too concerned. Compile=
r will let us know if it happens.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Unrelated to this comment - what about i=
915_gem_object_can_bypass_llc?</div>
<div class=3D"ContentPasted0">&gt; Could we do better (less pessimistic) wi=
th something like my approach and</div>
<div class=3D"ContentPasted0">&gt; so maybe penalize MTL less?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">The problem is that, for the BO's managed by =
UMD's, the KMD doesn't know</div>
<div class=3D"ContentPasted0">whether they are going to be mapped as cachea=
ble or uncacheable on the CPU</div>
<div class=3D"ContentPasted0">side. The PAT index controls GPU access only.=
 That's why we make sure all</div>
<div class=3D"ContentPasted0">BO's with PAT set by UMD (which means UMD wil=
l take control and managing the</div>
<div class=3D"ContentPasted0">coherency) are clflush'ed.</div>
<div><br class=3D"ContentPasted0">
</div>
<div>-Fei</div>
<div class=3D"ContentPasted0"><br>
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567F99FD5CFB3E709B2B3879A2EABYAPR11MB2567namp_--
