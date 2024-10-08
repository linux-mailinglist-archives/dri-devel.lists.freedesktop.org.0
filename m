Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C3995963
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E44110E5F1;
	Tue,  8 Oct 2024 21:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIKpg2Ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1226710E5E9;
 Tue,  8 Oct 2024 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423760; x=1759959760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnspTtkB0oMfPFOukJEPxy6TH24tZ1f8jqx+MhDVjsE=;
 b=UIKpg2UbFoY4dAIyao07JsSIdt+haneeCyXLiEGnMFMjz25txaw3rR1v
 ddV1nU567usyvRFEwVmgC5eeh7H+XOF6s+CmxiFgda0KzTfvYBTAZ/RMc
 rFQDkcrz4wXf5UtJXOtrZ7bykjD99TSzd1rhtP3rD5/ug42+oTdiEVxjv
 EhktXtKgKKW+L2P0RoW+jUfV90GmV3CSg1QYJRbDZqKsdOGdGnysumwZ0
 w2L0Rzzdyj2dyc0cySD1218aJ1Y81Ht6PNnojEA+FFlOTm+iBLZJ0kOeF
 1EGHdNEgjJTmPz+zirTR+4JyYQvXgS+HR4W7bLvV0cdAlqD1HBh/v/YoR w==;
X-CSE-ConnectionGUID: MqNwCGxYRoqQpZ4SDQ5VNw==
X-CSE-MsgGUID: 6iW+1aV9QM2ipiP8jK/6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45141112"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="45141112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:42:40 -0700
X-CSE-ConnectionGUID: /qGEkzsMQ4ewQaQTc/kCWg==
X-CSE-MsgGUID: ZR1wiqLSRYuaXbxSvPRU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="113460368"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:42:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:42:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:42:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk1LeoDqnT/oH9wnN783nQqWWGsXL3lA+UNj6RrPaktD94Btms8iazLR8PFR7pj18j+rGT1NJyITIhH8wgXMJ4JRDxfHhl3hB+OCg6v9dYKJqNsrnOF/OK8Wna7VqWlfY8WG44hO5bBGpALLxndKw0YEqLxc3mRPoVjDE3lwJLOv8qhQVu9FkSdNlGaJ2jur/5X/jVEsm/nziWrsPfWhRBMSFVmvPDb0lH0pEgR8rRT1DJ/Yyb9gQKk/NLLCfZO/N+KoPOz5WsLy/Bo79upYEQTXfkJlTStgYuQFJIMwXFUHpJPvbdWGgv1OBaLP/8HWCUpTH+JaQHPVOVY2oJHVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWFCXEMShd/KAp4BV4QOMJbtQaKS0FCHZF1Y6oZxb7A=;
 b=vP2DdhcRbewj5Nk+eLP0TvRWnh53IZJe3WmlYJ1n6fstJf3JMJFKnblw8+mar02cfFc5l6YSl8GY4otKiaH4KxTqS+sMTLVnNo4Za5wZNcCuLr1Nb0emj8WsXCWqA2nFJZbv7dCDexfjJGxCJfN/Aj6NMdzaTnhlceA+BRVpWiP2hc9s+kNrgikWDhCIE1ThKnLWeREUwXjc8HDYT/FG1atQNTK9jkep8UqX2Kg6p6fjLuGLS9Cnl7nTgs/vytgOdZsH4OoyPvOfqDc6HJDu1r7PZoEoN076hV+SQc5BRWfkIe2BYRTL/BLhjBT4plyV+wWkOJYxWGWi6IaX8AfJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 21:42:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:42:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 12/12] drm/client: Add client-lib module
Thread-Topic: [PATCH v3 12/12] drm/client: Add client-lib module
Thread-Index: AQHbGXqp7p1miKa7GUiRVL/McbSgYrJ9VUCg
Date: Tue, 8 Oct 2024 21:42:35 +0000
Message-ID: <CH0PR11MB5444A6E3E98CEC438C3B5A8AE57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-13-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-13-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6667:EE_
x-ms-office365-filtering-correlation-id: 05ecec38-d813-47c1-a844-08dce7e21f6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lz1+T6izaoEGRPcHUWC92m1M412WpzmMT7bC+4h4jYtYwo5RuRFnhwIK3BUT?=
 =?us-ascii?Q?w+2PQocGiHBwuraiP80NhZMSKvZDnZ+rVvHmcvOD7mB/6CoHcVl0AMr6jqx+?=
 =?us-ascii?Q?vU+cMp95HKho/eTJqI6/rsMEyOnkmJwbXenlw1ej1hYjT65KTjFBbYHiioHA?=
 =?us-ascii?Q?BkJv48PBMkoa2DJ5XgyvqqKtpWVgNk9YsXqHXIDD/PJYyt/mQrhj0FEOTtJc?=
 =?us-ascii?Q?cbb4YLBfczyu4YSf+P19l2v6u7fGT0qRWkuUZtvr8yeJhKlDjYeMmKyQc1mu?=
 =?us-ascii?Q?PztyGiW/CsNA2UV6nCMwUQu89jRXD45zCTEzsYcVVH4dSiEr++nFCOOn5dJu?=
 =?us-ascii?Q?FzTYCUQpbAqZgf6iyiCbvHNe2VXIDE81apkSJyfZ6KULLnlP351GHl3HvVv3?=
 =?us-ascii?Q?DzSPCM56nmCWjaSLBXDoMYY2x7zQFmHn0ExPARClQ/T72NGX6H2cy7kcAo2w?=
 =?us-ascii?Q?K7n8gGufHsWVdZNlbF8/Xtc2gy+Yy93SHTCkjAxSfH78aNVlrKb95vZF5bRX?=
 =?us-ascii?Q?y7Ful2Ma2I4uH/GzOQ+Ij2VkN8qzqhq4Kb+QOXjRqW5DA//Ke/ThZvKEezKi?=
 =?us-ascii?Q?nXpEekfFPKCv3+YqcjmZ9f9pID6zIl7LvlT+ScSAQUNQ5GweylA5l9wCuvzL?=
 =?us-ascii?Q?djs3jtrkU+KnTTqgvptscSgPn/oMFb/5P93TTXDlXa6n9fpFvjMDtJyxFoCd?=
 =?us-ascii?Q?ZOsX34RIbcTZ9L6dJnOim7j0JWuoVeQnzSqCSHhnPKaYO6l88ZqhwNmOUXlY?=
 =?us-ascii?Q?egRqiBZTvfFDTw4YXQi6XiPe8BxXCSlXcmDBKsx0qtk+0iEfsf1vWeZv2/IH?=
 =?us-ascii?Q?sS/7EbQUshxTFBiysEL6rv0PGS3aoyb9r+puAYzhn2It9KKjJ9PE4SipzWh5?=
 =?us-ascii?Q?vCP1n4lILKBv/RWY7fIGiR3ufQ3yz9j5tSa8hxi9b6VdkqkCOKio9G+S0I1E?=
 =?us-ascii?Q?vq6fOWR1bEJpGpb4sKOpgXD1KTRjvpXjGzZ4gpkdU1+4BgfiB+9sektjEEe9?=
 =?us-ascii?Q?N1bmweet/JdxhF72oRZg9yoEsMwrNOXTFeIzMBvmoGQgWsgH1kvN9V7cZqjP?=
 =?us-ascii?Q?NH4lInWIhKLsNJmna+byCgP3DcrydJDxGKFnGpa/aZtS/kqvboAHtQDyU04F?=
 =?us-ascii?Q?cE9ZHDQhath4HMmouaZevksYfhLcjoYXcV5TeebOkonVeweHRpQxR86gEG8K?=
 =?us-ascii?Q?FL7aVDzxzGb/c7pwBgu0cL0WrhkKXrZIrEBA2ej/aNpB0P7DsloWBSyQZ0iU?=
 =?us-ascii?Q?Z0fK/5Qlxifb4LOwwQrwGO6yRGgoA6QAGipnhU1n25Wnn8xWmleTEg8JGqoF?=
 =?us-ascii?Q?PyWT0OwHDfbrQZc9DwbcHirdDI9e6skvEbjYNuZ5rqs4kg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z76LcrbkzOPRLxB1H8GUXm5++W2kBVlrY1/lnvK85XboFhrB6SoXVSxq/E2p?=
 =?us-ascii?Q?Uk4F3lX05LWDNY5B9xlpJOHqFTZhi4+t6t/koemz+9/UDfaCLBEmPzwNUQkb?=
 =?us-ascii?Q?4hd9Zf21LTvUJsqcH7MAP5FYHtPfd1hXhpf3PGD7qt5lsKboFDg5guZ9hSfb?=
 =?us-ascii?Q?w7WTcsZ/AcVtWqsOqubl8eOkoSP/IDrAu56b/HzeDCwpz21Xo8WfetglmZ5C?=
 =?us-ascii?Q?Rj/9jYwpmP9gcfMken/jyp4SN+XdPNvlavuWT3RGeOOywYQ8L5u3UEi9w3Ib?=
 =?us-ascii?Q?7SU5a7My84L9sx4kVbO6zGbv+KF+qTmQ8/wPwFOjl0UQWNdTkdE4/Tz4iSI5?=
 =?us-ascii?Q?IsGlMHdAjjdftaVUHtjZzK0NPyTt7LKLpcBb3PujImoz6e3oH6hftKAQsR8T?=
 =?us-ascii?Q?+p34FVfAZe9x5amjrfl2dPlhuJCHWFDffcNFlBmyQuOxVtUqCyJxBgk+f5WS?=
 =?us-ascii?Q?6rA+kygrpglPKonLKOk/lUQxwKnvVUItb1HWj+E0ii9tEwpt9nq/6RmYWDKh?=
 =?us-ascii?Q?yJsuyaCxEygq2Ekl3j4xwlkYmt25qwDTJyHHlYLyA9PVsQTIsUUSNNCiNbvl?=
 =?us-ascii?Q?2iLfmHeHD+9KOvRi8cODOv83dN1wE3NhZ8QezHOuggTb8qTg18EA/TQtqb3p?=
 =?us-ascii?Q?C9BQFksrj413z5v6ycUxe+Euu29uZL2cX/Lan6BZOkcE83kBtVgJDAEnhBDO?=
 =?us-ascii?Q?c2XoRXC7KvC3LiK9O6q7QE1qnvL93Qd6p5MSHWZxJQkT8B1oznh4Ar2NpuaS?=
 =?us-ascii?Q?s7TuKHhan+UKxDCNo3/i5CbeuITptTGMgw/SDB8cO/xEmg/LvWVuZw5neUZ1?=
 =?us-ascii?Q?awHsKX6tIUBPL4kpNMjj/hJU9f3N97ZKYb6xc5Vc0RPSFj+BXGPzG8TU8njL?=
 =?us-ascii?Q?92xlueyvFWuAIzNm1zNvY/X+oR7T/5DJhT3aT0oA5HNk6p1INKfAUTCp5LPo?=
 =?us-ascii?Q?BvgOpIVTeiwwAvvKI8EJXDIdFpoj9WKoJUgJoN8AEWa+70TCJ/akqTAZG5+U?=
 =?us-ascii?Q?Apwcg7TSXqBrgX8t+APxKlTiWMde+DmHN3CX2pjAigdgkCWaG/6tVek/L+x/?=
 =?us-ascii?Q?Ks0ZJYLmaDBfcj8qHPmgxcUkS8Nls0GpspJY++pIeHiv6Vsomq0XGyxztZdb?=
 =?us-ascii?Q?Q7RoYXGEWMMQtCId8UJmqdDgCsY+JYndeUUTiiagfSqnQn/jhO3kJVJ7JQjw?=
 =?us-ascii?Q?SVxUIzoI8Eq2EbYFRfOmWlMp4Ba24ChDpA9CbSQKyRNBi+xEMN4X/ylD1Moh?=
 =?us-ascii?Q?J9gODd0JZ/BFfUzK+eiAo7r0vTEtG29O/n+2I2CzGgzSKEKdJi6pqIM9WB4h?=
 =?us-ascii?Q?r7/mZ/6N71ttOnaWz3WsQHZQo2itqoRaartWiqO7kzsKxP3EVVK3nWArAAjU?=
 =?us-ascii?Q?m+HBlknNeb7Px6+4G7GukJ7F9aFFxrJw3Y0yI9kPj97+AhRVm8d5fJK2/Dex?=
 =?us-ascii?Q?eEk3ZJRYvHdigkgtxhbkQuLZAAY5QIsVejDr3HpPAPqn3GXPUcE+C8oHVEdK?=
 =?us-ascii?Q?4gLgilT71rhAaVAnzN04RBh65EpOtkv5fSrrGIarVTVC9raGaVa3594cLyx0?=
 =?us-ascii?Q?JlTuuRhBNtt3vjd/zuv6TUvQfV378EBpaVnXg2C5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ecec38-d813-47c1-a844-08dce7e21f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:42:35.5506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKM2TLvhTwbl6QIfanhAMkYBHyQ3nPpjzPz3N08wi1PanJung096Z3FdKBapEs6MoVX6XXdi45WHEfQxDyhuwJulMijIg4HJYY/bK9MdYtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-----Original Message-----
From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Thom=
as Zimmermann
Sent: Tuesday, October 8, 2024 5:00 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>
Subject: [PATCH v3 12/12] drm/client: Add client-lib module
>=20
> Add drm_client_lib.ko to contain DRM's built-in client. Move the
> existing client for fbdev emulation into the new module. Protect the
> new module behind CONFIG_DRM_CLIENT_LIB.
>=20
> The Kconfig rules separate the DRM drivers from the DRM clients. A
> driver can opt into the default clients, but the user configures
> each client individually. To do so, DRM drivers still select
> DRM_CLIENT_SELECTION. The option is now a tristate that further
> selects all dependencies of the enabled DRM clients. There's
> a menu option for each client. Enabling at least one client also
> selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
> New DRM clients should depend on DRM_CLIENT_SELECTION.
>=20
> There are existing kernel options in drm_fb_helper.o, so leave this
> file in the KMS-helper module for now.
>=20
> v3:
> - fix commit changelog
> v2:
> - keep client code in core
> - protect lib with DRM_CLIENT_LIB
> - remove duplicate line from Makefile (Jocelyn)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/Kconfig                 | 26 ++++++++++++++++++++-----
>  drivers/gpu/drm/Makefile                | 14 +++++++++----
>  drivers/gpu/drm/drm_client_setup.c      |  3 +++
>  drivers/gpu/drm/drm_kms_helper_common.c |  3 +++
>  4 files changed, 37 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ea1cc924528c..a9055c0b9a1a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -9,8 +9,6 @@ menuconfig DRM
>  	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI suppor=
t)"
>  	depends on (AGP || AGP=3Dn) && !EMULATED_CMPXCHG && HAS_DMA
>  	select DRM_PANEL_ORIENTATION_QUIRKS
> -	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> -	select FB_CORE if DRM_FBDEV_EMULATION
>  	select HDMI
>  	select I2C
>  	select DMA_SHARED_BUFFER
> @@ -218,10 +216,19 @@ config DRM_CLIENT
>  	  option. Drivers that support the default clients should
>  	  select DRM_CLIENT_SELECTION instead.
> =20
> +config DRM_CLIENT_LIB
> +	tristate
> +	depends on DRM
> +	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> +	select FB_CORE if DRM_FBDEV_EMULATION
> +	help
> +	  This option enables the DRM client library and selects all
> +	  modules and components according to the enabled clients.
> +
>  config DRM_CLIENT_SELECTION
> -	bool
> +	tristate
>  	depends on DRM
> -	select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
> +	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
>  	help
>  	  Drivers that support in-kernel DRM clients have to select this
>  	  option.
> @@ -229,11 +236,18 @@ config DRM_CLIENT_SELECTION
>  config DRM_CLIENT_SETUP
>  	bool
>  	depends on DRM_CLIENT_SELECTION
> +	help
> +	  Enables the DRM client selection. DRM drivers that support the
> +	  default clients should select DRM_CLIENT_SELECTION instead.
> +
> +menu "Supported DRM clients"
> +	depends on DRM_CLIENT_SELECTION
> =20
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
> -	depends on DRM
> +	depends on DRM_CLIENT_SELECTION
>  	select DRM_CLIENT
> +	select DRM_CLIENT_SETUP
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	default FB
>  	help
> @@ -272,6 +286,8 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
>  	  If in doubt, say "N" or spread the word to your closed source
>  	  library vendor.
> =20
> +endmenu
> +
>  config DRM_LOAD_EDID_FIRMWARE
>  	bool "Allow to specify an EDID data set instead of probing for it"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c3e5d353588e..edfd2ebaf153 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -145,13 +145,19 @@ drm_kms_helper-y :=3D \
>  	drm_probe_helper.o \
>  	drm_self_refresh_helper.o \
>  	drm_simple_kms_helper.o
> -drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) +=3D \
> -	drm_client_setup.o
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) +=3D bridge/panel.o
> -drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=3D \
> +obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
> +
> +#
> +# DRM clients
> +#
> +
> +drm_client_lib-y :=3D \
> +	drm_client_setup.o
> +drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) +=3D \
>  	drm_fbdev_client.o \
>  	drm_fb_helper.o
> -obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
> +obj-$(CONFIG_DRM_CLIENT_LIB) +=3D drm_client_lib.o
> =20
>  #
>  # Drivers and the rest
> diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_cli=
ent_setup.c
> index 5969c4ffe31b..c14221ca5a0d 100644
> --- a/drivers/gpu/drm/drm_client_setup.c
> +++ b/drivers/gpu/drm/drm_client_setup.c
> @@ -64,3 +64,6 @@ void drm_client_setup_with_color_mode(struct drm_device=
 *dev, unsigned int color
>  	drm_client_setup_with_fourcc(dev, fourcc);
>  }
>  EXPORT_SYMBOL(drm_client_setup_with_color_mode);
> +
> +MODULE_DESCRIPTION("In-kernel DRM clients");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/dr=
m_kms_helper_common.c
> index cfdbc1ac88dc..ecff0b1414ac 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -31,11 +31,13 @@
> =20
>  #if defined(CONFIG_DRM_FBDEV_EMULATION)
>  bool drm_fbdev_emulation =3D true;
> +EXPORT_SYMBOL(drm_fbdev_emulation);
>  module_param_named(fbdev_emulation, drm_fbdev_emulation, bool, 0600);
>  MODULE_PARM_DESC(fbdev_emulation,
>  		 "Enable legacy fbdev emulation [default=3Dtrue]");
> =20
>  int drm_fbdev_overalloc =3D CONFIG_DRM_FBDEV_OVERALLOC;
> +EXPORT_SYMBOL(drm_fbdev_overalloc);
>  module_param(drm_fbdev_overalloc, int, 0444);
>  MODULE_PARM_DESC(drm_fbdev_overalloc,
>  		 "Overallocation of the fbdev buffer (%) [default=3D"
> @@ -55,6 +57,7 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
>   * considered as a broken and legacy behaviour from a modern fbdev devic=
e.
>   */
>  bool drm_leak_fbdev_smem;
> +EXPORT_SYMBOL(drm_leak_fbdev_smem);
>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>  module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
>  MODULE_PARM_DESC(drm_leak_fbdev_smem,
> --=20
> 2.46.0
>=20
>=20
