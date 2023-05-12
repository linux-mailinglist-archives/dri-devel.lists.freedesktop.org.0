Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554606FFE0A
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 02:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8DF10E60B;
	Fri, 12 May 2023 00:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535C410E05C;
 Fri, 12 May 2023 00:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683851563; x=1715387563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=USvhsWMgy+dxxT3E1oKND05yXNeNid6kfTdUn0KPBRU=;
 b=d2isjgfbqT/Rhz7RrnYfAaWaEKSncCtIvvmfKb99XX6AOVk0ww1DHVhy
 Q5WND5QGOZozpm+p/PA4fdwA2SewI6gGVkE8BXd8D3Fbrjg+alqetpdfu
 Q2HnNwyN4lqLK1jKWeP81YeG7utEw4y0sYDMxBKv8iAFbIFTA4lX/fvN5
 l+sdBCTtK/GrpJs8VehFaXGm8IrNVV18Ro56uM6chyFFVlxQJkiddGlTy
 UimE5F2Zxcy2D4fgYpmiuiOXBeLVIVVEBiRGrN+zkBNT4JR9onfNWJRjo
 7V666v4AUkel6OcMdZuDBoGv8mjgDswANu+3TuhzW37S4RX43fKejfm/p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353787358"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="353787358"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 17:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811850496"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="811850496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 11 May 2023 17:32:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 17:32:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 17:32:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 17:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjLgzlfW/qoasTJF779EEKZSvfI6Em+qowOj0hkRLYjmTt643FzFloaGwn6Q8libPtf9VHyvO9fnbdDVfl2yUlVlyJiB3UAk27xIlNiCS1xtPfohHPplVA+aIJ5EP+h0925fKLKnLMSdEzrrpe4/1jKiXgNHT+91TDinaE7vBHUaRtaYGjgbsORJMtANV5uElFY4ti0SLTIQYdodqdSO+b6GjeWd+6dOdfPNG1tvtkDtNEPlPiAwHD3MgWIEQ98LBszhgqTS7b8JOxXXD6C+45eBCDk3Ix5vnb9v0lbdRsP81GtxpHtqSGFueL/Z6IAyUeXiPt7k5B8masy7mfzFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XwFXrLAttQP9G7zGSBRm+FhhTWlvGKB+JYmpq3Gcx8=;
 b=jM5v2ZFGgBY8AXvbk+YZ5rgCtxyxIH99DY7UQqsB0vS+nJp+3z9VQeVO1tJLEJdpm8aUa9dALy+5xQ0wvagZ1gloiwzmpGtu2NH/7LFAHKIV0X4TXdMHZIZt1rsZGyfJv/7EJAv1GdRAVjvpVDodew35lecysNnWRgowlji+oS46nTXDJot5nlA4xDhPqqOIEPEPjRvlstaaepO4w+iFaS+8MrK/REEDnsxIhSDwXytoQdcBbBuceDfQqufMgh6b957lO0ywWgjxH4k9ianfaBcUFWpWQ0/EYA+lXk+oxnVB0KGxZXJXNwyQnj9bfe3q4KxSOYSHxkmuTa+CJfQ0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 00:32:04 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%5]) with mapi id 15.20.6387.018; Fri, 12 May 2023
 00:32:04 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v11 0/8] drm/i915/pxp: Add MTL PXP Support
Thread-Topic: [PATCH v11 0/8] drm/i915/pxp: Add MTL PXP Support
Thread-Index: AQHZhF7qYw1Nk6S7/EqZcJ0bekmm2K9VyV8A
Date: Fri, 12 May 2023 00:32:04 +0000
Message-ID: <DM4PR11MB5971E945184C58025FF06B3D87759@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230511231738.1077674-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230511231738.1077674-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|PH8PR11MB6997:EE_
x-ms-office365-filtering-correlation-id: 7f4b739f-e6bb-43c4-ac4d-08db52804f6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6SEqDrt+uKIkT8GmJOBPsiL700Dfm0qx2eVK41pRcUxR39laEsx93x0Hbvg75x0BWxJvMfFLjhLkKxsp4PQ+bH1TTb2LbmZI32/+nqYj3FHx2AsXaYuhMUwkbP+wF2NSkZfmfoS3M7K4WdA/RiBoCFOyByDHfiKcfuIBDeqOqpD1ecbKhnQVMMgmmtdPAV4B90Rewm1rGj1QxpuG1USKuc9O5CN8olJrknc9hA6RhCWNAZ9Mpc4Sryf3LjfzTukpXBokvd1cRnb9X7JwtZdjM2I/egyLB+BF3u1bkKydzQHimXDRvjhsDYnUojKDzmHSczuX55fcx/X1yaOPhBvmpN6qyuQLzgjuDMk87G+Mdxz68eimOvEGJBEfWRRrAOQ7vzA5dn6XR/ojuZhEkXKRFxAXpxtEL2RKhBepk191wEoqv8bgugQG2HvOp55VYSKHv1WUl949EgnT66tKPS8RSZEVHeB2s3HaDu/oAY0riZynyHOG//gwbAJ9NCALkQicYAb64j+Oswuq3H07u9gUTi6HbnmeeiOBdI7bxqbxI8nf43drAScgvzccimJsvXAqsObas5MMYzIdFPjQkXYMTh73tWjjXhvsbOr8NFrXr9EF/z3k+NcyaKpctZmGS/z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(9686003)(478600001)(186003)(53546011)(6506007)(107886003)(26005)(83380400001)(66899021)(33656002)(7696005)(71200400001)(8936002)(86362001)(122000001)(316002)(5660300002)(52536014)(41300700001)(38070700005)(38100700002)(55016003)(8676002)(66946007)(110136005)(64756008)(66556008)(66446008)(4326008)(2906002)(30864003)(82960400001)(54906003)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8+j/xq0KPEed0zFZPY+4BL59L+Lbt4TRlCF4tUif92sLGWThsCZ5dMc0AZCV?=
 =?us-ascii?Q?usXxsUyxuUaeUmSevLaqX8Zk/CpJrwNx13PnhoaXxNwyUmKA0CUZA+VSB9UK?=
 =?us-ascii?Q?a4G8XkESGNDzOGfaLYGJ1TulWjOuy2JksuYH5Sq4c+CeFx7RCFnJPuNt2OjC?=
 =?us-ascii?Q?lbIr+dQ9BDcsX+xFPgC+ZtvyD+TBoVeNLooxtI7iYKQREMLPnRTxZuaKIlVo?=
 =?us-ascii?Q?9Jg1P+wFjU+AqnsJjxkBpeka16mM+34XWy9iZNeBeAOdxyZqHKkol1q0xhVb?=
 =?us-ascii?Q?dfoBdnIUFeBdKCie1m22Sxm3eDCxe62TzPm2ArvWFADZjP8HAgYwxKH92+vw?=
 =?us-ascii?Q?8VKaEndEHc2saZjUuGgFqbL7cTwRBZuzXHoPWueTmxv2+ZPIK5Nz8GK4Yi/O?=
 =?us-ascii?Q?dMR45FX0isMtFp/AEYa9FRS/SzlHmHhe9d/rau9jc7Zt9GeeDTUTi/XTmj9x?=
 =?us-ascii?Q?T1+9i1kU+nesoHRFN98sha/xYfjMf+zEmkynVMwfr1qZUYqtTWbYtD15OReG?=
 =?us-ascii?Q?m1NYLkdAhoPXVg4de5rY0uoGvfDT2LOFkynHIqcd1WcV4YsXFy95Ru+xz1rF?=
 =?us-ascii?Q?mQCHy2ghjaqd0TgjGJFvt3ooIhdy/URgUYNZb4vYDSSzu8vAyo4b6QBL2cje?=
 =?us-ascii?Q?ZuhBhmMuJotY8pSbTWo6EMgDJbYKPcI94cbiJ3dDT0kAiWn89HvHn0jp3TdL?=
 =?us-ascii?Q?EGiydiR9E5k7QNduz785BSIfijT7G5DskcKMfKhG8uy41hAcXTai3yApfvsg?=
 =?us-ascii?Q?jptLzA0F/aLMoQ+M/o56hQz/WQ0iCMZvdnTKbzj15b6BjUKjUOxHCRNRLlZ/?=
 =?us-ascii?Q?yw618iraHmicefC35vt2EyclAKaDjX9sSkRWuZFDiI3OfXc6BIJn2iiWrst+?=
 =?us-ascii?Q?nZ22uHtdGwHdQ2UwZRUaJCDRzgCalE5m8vv8t++e/ZqInObCYOAK0XA41CVm?=
 =?us-ascii?Q?iVKVRRJe7guxczUZISeYfc8S5UrPYCP2zmhWiSvIF/PyoQNpkcMtdPGYfjPo?=
 =?us-ascii?Q?A2VbFs143/FwbBvky51uk5Nh328u46m7zbiSSB3xHTmJrOlDd/8UaKn8iiqe?=
 =?us-ascii?Q?GXkdByhByL84vhMrELszT/oqHJxx6V/x1mFY+fXZh5XuQaDx0TjDObYahIPs?=
 =?us-ascii?Q?QzIH3vBe/VOT/EG+KpopfCU5mlW3x76lgZ//dG0Qrp4Q7w1umxC0vte/A/ZR?=
 =?us-ascii?Q?wLDeskC5R4edVn3MyuQrwJdZU1tDmt7VUymw8maSI/m1QV8zZT/U80z1tHYq?=
 =?us-ascii?Q?HlGs60CgkaOJoyi2oej3k8hX6LXF0AgZULX6Df+XNVQgMkpEGS8q70ZozkaR?=
 =?us-ascii?Q?LxJz0tazdBVKT5hR82rmPenbKBByc778YRJSOySXzhnEr0NGYvYjrNEMd8Ld?=
 =?us-ascii?Q?GUgcdBKGJQPYEeVmCGs6e3YD+rviYMeallSLOgJMRF0QXVBirTdHdgKS/EZT?=
 =?us-ascii?Q?uy9tK0WXnFoPBoQpx9/70+5fH6jP4UPnCOM8O3l2Jioh8W6tau9yWSFra9L1?=
 =?us-ascii?Q?VadP1c6AJ3fbZDZL0f/qSDsCkUgyFgh5MDXCC97yDEDbUZqJaV32UsOKjP1d?=
 =?us-ascii?Q?xWWn7N+w7R/qV1hDXqv4N0GGgw92CbQAghJe50pRtP8356G7ya+EXI1o0qQe?=
 =?us-ascii?Q?5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4b739f-e6bb-43c4-ac4d-08db52804f6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 00:32:04.4479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDDNy/wrpOVKer/PWCsyW+mqOl1cJnix9rmaHBDQH3mRGmS1deGX4Kq3ldocTLIx+vPgzRK7JXFrLOO3vTiJBksKOGep5SOYHF2rMZJlt9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for the patches and the reviews. Pushed.

- Radhakrishna(RK) Sripada

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Al=
an
> Previn
> Sent: Thursday, May 11, 2023 4:18 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Ursul=
in,
> Tvrtko <tvrtko.ursulin@intel.com>; Juston Li <justonli@chromium.org>; dri=
-
> devel@lists.freedesktop.org; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; Landwerlin, Lionel G
> <lionel.g.landwerlin@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Justen, Jordan L <jordan.l.justen@intel.com>
> Subject: [PATCH v11 0/8] drm/i915/pxp: Add MTL PXP Support
>=20
> This series enables PXP on MTL. On ADL/TGL platforms, we rely on
> the mei driver via the i915-mei PXP component interface to establish
> a connection to the security firmware via the HECI device interface.
> That interface is used to create and teardown the PXP ARB session.
> PXP ARB session is created when protected contexts are created.
>=20
> In this series, the front end behaviors and interfaces (uapi) remain
> the same. We add backend support for MTL but with MTL we directly use
> the GSC-CS engine on the MTL GPU device to send messages to the PXP
> (a.k.a. GSC a.k.a graphics-security) firmware. With MTL, the format
> of the message is slightly different with a 2-layer packetization
> that is explained in detail in Patch #3. Also, the second layer
> which is the actual PXP firmware packet is now rev'd to version 4.3
> for MTL that is defined in Patch #5.
>=20
> Take note that Patch #4 adds the buffer allocation and gsccs-send-
> message without actually being called by the arb-creation code
> which gets added in Patch #5. Additionally, a seperate series being
> reviewed is introducing a change for session teardown (in pxp front-
> end layer that will need backend support by both legacy and gsccs).
> If we squash all of these together (buffer-alloc, send-message,
> arb-creation and, in future, session-termination), the single patch
> will be rather large. That said, we are keeping Patch #4 and #5
> separate for now, but at merge time, we can squash them together
> if maintainer requires it.
>=20
> Changes from prior revs:
>    v1 : - fixed when building with CONFIG_PXP disabled.
>         - more alignment with gsc_mtl_header structure from the HDCP
>    v2 : - (all following changes as per reviews from Daniele)
>         - squashed Patch #1 from v1 into the next one.
>         - replaced unnecessary "uses_gsccs" boolean in the pxp
>           with "HAS_ENGINE(pxp->ctrl_gt, GSC0)".
>         - moved the stashing of gsccs resources from a dynamically
>           allocated opaque handle to an explicit sub-struct in
>           'struct intel_pxp'.
>         - moved the buffer object allocations from Patch #1 of this
>           series to Patch #5 (but keep the context allocation in
>           Patch #1).
>         - used the kernel default ppgtt for the gsccs context.
>         - optimized the buffer allocation and deallocation code
>           and drop the need to stash the drm_i915_gem_object.
>         - use a macro with the right mmio reg base (depending
>           on root-tile vs media-tile) along with common relative
>           offset to access all KCR registers thus minimizing
>           changes to the KCR register access codes.
>         - fixed bugs in the heci packet request submission code
>           in Patch #3 (of this series)
>         - add comments in the mtl-gsc-heci-header regarding the
>           host-session-handle.
>         - re-use tee-mutex instead of introducing a gsccs specific
>           cmd mutex.
>         - minor cosmetic improvements in Patch #5.
> 	- before creating arb session, ensure intel_pxp_start
>           first ensures the GSC FW is up and running.
>         - use 2 second timeout for the pending-bit scenario when
>           sending command to GSC-FW as per specs.
>         - simplify intel_pxp_get_irq_gt with addition comments
>         - redo Patch #7 to minimize the changes without introducing
>           a common  abstraction helper for suspend/resume/init/fini
>           codes that have to change the kcr power state.
>    v3 : - rebase onto latest drm-tip with the updated firmware
>           session invalidation flow
>         - on Patch#1: move 'mutex_init(&pxp->tee_mutex)' to a common
>           init place in intel_pxp_init since its needed everywhere
>           (Daniele)
>         - on Patch#1: remove unneccasary "ce->vm =3D i915_vm_get(vm);"
>           (Daniele)
>         - on Patch#2: move the introduction of host_session_handle to
>           Patch#4 where it starts getting used.
>         - on Patch#4: move host-session-handle initialization to the
>           allocate-resources during gsccs-init (away from Patch#5)
>           and add the required call to PXP-firmware to cleanup the
>           host-session-handle in destroy-resources during gsccs-fini
>         - on Patch#5: add dispatching of arb session termination
>           firmware cmd during session teardown (as per latest
>           upstream flows)
>    v4 : - Added proper initialization and cleanup of host-session-handle
>           that the gsc firmware expects.
>         - Fix the stream-session-key invalidation instruction for MTL.
>    v5 : - In Patch #4, move the tee_mutex locking to after we check for
>           valid vma allocations.
>         - In Patch #5, wait for intel_huc_is_authenticated instead of
>           intel_uc_fw_is_running(gsc-fw) before starting ARB session.
>         - In Patch #5, increase the necessary timeouts at the top-level
>           (PXP arb session creation / termination) to accomodate SLA of
>           GSC firmware when busy with pending-bit responses.
>         - In Patch #5, remove redundant host_session_handle init as
>           we need a single handle that is already initialized during
>           execution_resource init in Patch #4.
>         - In Patch #8, increase the wait timeout for termination to
>           align with the same SLA.
>    v6 : - (multiple patches) always name variables of type struct
>           gsccs_session_resources * as 'exec_res'. (Daniele).
>         - In gsccs_allocate_execution_resource, always put and take the
>           contexts vm to enforce its the default pxp->ctrl_gt->vm.
>           (Daniele)
>         - In Patch #3: Rebase with the upstream-merged version of the
>           intel_gsc_uc_heci_cmd_submit.* files that was part of the hdcp
>           merge (adding only the difference of the non-priv submision).
>           Fix the non-priv submission helper to use the ww-aware versions
>           of request creation + submission (some re-ordeing and calling
>           i915_gem_ww_ctx_init and intel_context_pin_ww). (Alan)
>         - In Patch #4: Misc coding styling improvements (Daniele).
>           Replace PXP43_MAX_HECI_IN_SIZE and PXP43_MAX_HECI_OUT_SIZE
>           with PXP43_MAX_HECI_INOUT_SIZE to simplify the size checking.
>           Clear the MTL-GSC-HECI header's validity marker of the output
>           packet before submission to avoid stale values (Daniele).
>           Fix a bug with the gsccs_allocate_execution_resource error
>           condition bailing out when out of mem (Daniele).
>         - In Patch #5: Add intel_gsc_uc_fw_proxy_init_done when starting
>           arb session (in front-end code) when called on platforms with G=
SC
>           engine (Daniele). Update the fw-response-error reporting to
>           match what is being merged upstream for the ADL case (Daniele).
>         - Old Patch #6: Remove this patch completely. We don't need to
>           use the root-gt's uncore to handle KCR irq / power registers.
>           (Daniele).
>         - New Patch #6: Update the documentation in i915 UAPI for PXP
>           context creation to include additional error meanings that was
>           always there in upstream code but just never documented. (Alan)=
.
>           Add a GET_PARAM for PXP support so that UMDs won't have to crea=
te
>           a PXP context to know if it's available since that method would
>           suffer a longer delay if called too early in kernel startup
>           because of the additional dependencies on devices with GSC engi=
ne.
>           (Tvrtko, Alan, Rodrigo, Lionel).
>         - Patch #7: Move intel_pxp_init_hw into backend code to be
>           consistent with legacy mei-pxp based tee transport. (Daniele).
>         - Patch #8: With 3 places now being aware of mei-pxp vs gsccs-pxp
>           difference in timeouts for round trip delays when communicating
>           with pxp firmware (getting fw commands sent and receiving the
>           reply), add a helper for this. (Daniele)
>    v7 : - In Patch #3: Minor cosmetics and remove unnecessary
>           EXEC_OBJECT_WRITE when moving bb to active. (Daniele)
>         - In Patch #4: Minor cosmetic fixes. (Daniele)
>         - In Patch #5: Pull in the fixups for missing documentation of
>           legacy UAPI behavior of PXP context creation errors values
>           from Patch #6 to Patch #5. Also, add a comment to explain
>           why GSC_REPLY_LATENCY_MS is 210 milisec. (Daniele)
>         - In Patch #6: See first change of Patch #5.
>    v8 : - Tweaked the GET_PARAM for PXP so that positive values returned
>           user-space can differentiate "PXP is supported and ready" vs
>           "PXP is supported but will be ready soon" (Jorden)
>    v9 : - Rebased to the latest drm-tip to resolve rebase conflicts.
>           All patches reviewed, waiting on Ack from UMD side.
>    v10: - Rebased to latest. Fixed spelling mistake in Patch6 commit msg.
>=20
> Alan Previn (8):
>   drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
>   drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
>   drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
>   drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
>   drm/i915/pxp: Add ARB session creation and cleanup
>   drm/i915/uapi/pxp: Add a GET_PARAM for PXP
>   drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
>   drm/i915/pxp: Enable PXP with MTL-GSC-CS
>=20
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   3 +-
>  .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 102 ++++
>  .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  26 +-
>  drivers/gpu/drm/i915/i915_getparam.c          |   7 +
>  drivers/gpu/drm/i915/i915_pci.c               |   1 +
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          | 102 +++-
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          |   2 +
>  .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  24 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   6 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 444 ++++++++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  43 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |   3 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_regs.h     |  27 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  25 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |   2 -
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  20 +
>  include/uapi/drm/i915_drm.h                   |  34 ++
>  18 files changed, 831 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
>=20
>=20
> base-commit: 978798460589f59097961875e0ffdbec6a11c9b5
> --
> 2.39.0

