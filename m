Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F180DE01
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 23:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332C610E516;
	Mon, 11 Dec 2023 22:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFB010E50A;
 Mon, 11 Dec 2023 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702332593; x=1733868593;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Jv2PALytiPYlb8+p2AA28foNYJEsrUQU264OX0MU/Cc=;
 b=YLpEbmf5+NVl3sxfBmSjoW1xwkXDYQFOdFNj69SE8w3u8AFwGGAo0L1m
 22rAn8phc9jqxp0fNaL7DR+5AUahQDKnsjVTLSD51keYFfZHL5lH/z8SP
 nDM1t2Ga8cDGKVK6aFbn9sdU/OkstSvCBBl/xCCnWu4IKBp6rirn5zLaH
 qezOxNqLeKFAkqXvZE9D/ri/mI94NuN9waLyF90TeKUx8VF+7igS7ZWIi
 CpZy4o0W8iqQ8jjeZm20VhHnVomJV7s7iq7AC0bUmAzikWnDYhV3OqeV0
 x9E2hRiyrjPxjqkHacs7d4YuotNZ/vMfWxX+0dwXmuB1fe6YuxSChqhf3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8079332"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8079332"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 14:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917029627"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="917029627"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 14:09:50 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 14:09:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 14:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Isu2wUJO18jWOm04zcf+/crnhLADtE70AIpFGJR3DC3wqUYRYWat4DlpAMbdGH9WrhNVWJTjvttii327ygyTdSDZmphwgD9Qv64yFi62zYVyIsotTc3Gjyoz2xlmKH0vZoP69uH8Pcpj6f2/Z8OXDQ1zZiyelRWacVd5NF5OTGNERgrAtIrshcBZBSNt+XQPmhhsFdg3mPEJYRhSways1BN7PO+G6Ip0wPkj8ub/6YKGi68rW9hOeLJrCum+YtAHs2mpGpX5FpinXm1Pc/LToEDN58pPHB8RVO9w2Tdd5+0M2xBnJ8AZAAhQIk6cFpoxIrqEb20VioL4z/6ynPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roOp/I38EPzS4BvAr9t06KpXGPNrt6zFFEcVA2a7nng=;
 b=gRUlwnZ9wdCapasyKXdNjLu3eKcLs5XLd9UWKo3+Y31gpDYHDSxkrsn7rTQMRKMqBa7Zb1ctBc2MTAlpxCnTREa7/CtgdY10Fs80FP48kYn1jOPOs2cSq3/7ehj1fpzM7+Zk2Cm/8pdd0bMVLp74S08WK04WeLn1nZ5CybR0jpBCxThN9dSihoJW34gMfk5QQge1uOcAUs7vAld40YLMpVKsw9TZHsHpXLfvHcKWm3fqTR0ubi3ucTcvLrtwHKia5kpnsORczjWpOP+GcMAq/dxXL4ZX6WjUKTwOKcaWodLrW3waZB2s46az+q50Ugyj7PL6Zdh/GqYVt4JNS70CUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 22:09:45 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 22:09:45 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] drm/managed: Add drmm_release_action
Date: Mon, 11 Dec 2023 23:09:36 +0100
Message-ID: <20231211220939.215024-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2355a2-4bbf-4144-3e0e-08dbfa95e246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXPelzIAmTFlLHJVakj0yFj1AbWt+R6uxlEjQc8oFZ5onHjWM4gDl0tINB2y+/OgC0/+WAW08of8isRS2XM5A/4raTpwVaBD0KxkljGGJPJsmTjkl54oM9/4Q1PYF90+QGw9xjXNhgcTkVVwVPZe3YH+XAPaIxCL5xXPBefYCC1TBV0yYP2ZFj6+PMqJmDAEu36gMrUfYDFFIHWVGS83nZlJ/uZB5rE7vcYeALWXkGA1W+TGk8V0iTP/pgTvWyo0TnOufSi4OHU/E9a5ka0IEEmKAj1xpkWq0Of+DktNC4EwH64QcyMavkGjV+d3L4KjupL3QbfSsr819iFoLi0WOAAjZFr6IvRTLpA9eynMSN+ziLrP5hP9P3y4rKF/JG97pt9VMLV8/3T/TkjDK5m/rWoyJV76xnJXA2FNLX2/l3bz9p3Erdd/hLRopCMlHkLlMdEkvFZ50fgq7iov+iWwLMLbYtwqGctdG0iiAhrXfkTqD3X5lVq5MqAVeHrua4M855RejqDnVQU71QYncNEayuJoKWFKAd65503KeYlPcoltim0sYXN+FlbIlFZ2B0LD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(1076003)(26005)(83380400001)(2616005)(82960400001)(86362001)(36756003)(38100700002)(5660300002)(316002)(8936002)(8676002)(4326008)(2906002)(7416002)(6666004)(6512007)(6506007)(66476007)(54906003)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lJN2JWUjQwQTlGM0dZVkhjbENBd2lXUGlockNYeHJPYW9sbDZjeHh4ZDRH?=
 =?utf-8?B?UUYxYTVFcEpCeEFhVkExNmkzcmpQK2xYaTRTekVYdVUvcEcwaCtWOEtLb0JQ?=
 =?utf-8?B?MDl4N0ZjbTgxNDMzb2VVVFJmOXMyYWdjRXh5ZVkwcTlwNENwclkvdXpDRnh3?=
 =?utf-8?B?K0pPcEZXZGlralFEcklyYytzajNmTTBqM3Zza016TzNFZUVWUFdFdnJxclVN?=
 =?utf-8?B?MXdYbitpTzB0bVVkNXRiaCtyNmxkeTBQK0hLY2wrM0Rvcmd4eVQ3U05OTGgr?=
 =?utf-8?B?VGpRZFQ5b2pyT1hvdHhIK2FFd053NkFTVGZzRm5ONW9jbU1YYjhrWEd2eFZr?=
 =?utf-8?B?U2pGZjd0SUZrNmJ3dnJwZHA5emlxd3Fka0RKU0FuRDc3ZGxRSTMxaDFBblV1?=
 =?utf-8?B?ZkhwYlI3Z3BmeiszdXdzK3EzY1cvWG9zSmk5NzU5TEJzS0VjYU42T2pqZmlD?=
 =?utf-8?B?eVhVM2ZKTis5T2FBWUhVSlFWSzZZcE5LL3dtcXArYWZINjhYeGRESnJlNzJz?=
 =?utf-8?B?emRSSWRsd1JROHBQV2lZVDE3cXh2NkZ6SmVrY1d5dFZKeEN3c0p5SmtrcTFs?=
 =?utf-8?B?czhBREp5aEk0NW1iMFhuUlNaaStKMGpCTldzdHBSZnlINlFmblNDK01sajlV?=
 =?utf-8?B?dVFTdkNYVll5SDVPck5HQ1B6bHlnY2pRMXl4WFE5SHJyOVNjeDIxYjBZU3h0?=
 =?utf-8?B?K1FyZC9rRWVxUUNjOGN5NWVhYkVPVnJLbjl0RlR6Q2M1a1U4bStRa1NEemxp?=
 =?utf-8?B?dU8vTFB3aHloWjR2NDNUOGk0aTQ0ZUJOTGhXR0gzZGFFZzBQRkMzcmVFeWN2?=
 =?utf-8?B?Z0ptaHRFWEYwVzRtcHZJQ1dJNGc0OVFCQjFZZTJ4SDV0TmQzTlVVdThXWTVq?=
 =?utf-8?B?RG1BOUtTNzNYOUNUcTVxRUZUenFDTzdYVmFIdW05OEtiajhlN1YrZmZSL2c3?=
 =?utf-8?B?ZVRnL1h3a2lPcXhSOTZFTlZOWVlNYnFmYnp2cnpydnZ2RVZQMUVPZjBITXlC?=
 =?utf-8?B?eWhFM0RMRDlTT2QzaW8zTFlWTVZVUWQrL1FRVnRoMTNxTEoyRlplLzFxRjRt?=
 =?utf-8?B?bnlNYUJlUUdSTDByQkRPMUxFY0NNUUZkU1dUVVI4cUdHTG1CUDBhYldzL2xK?=
 =?utf-8?B?c1JJa3VpRDh4SGhqVzB6MjVDcnRrZjhFMnlDS3RoVzgxSEtMNWhKd0N1RjBF?=
 =?utf-8?B?emlTQTg3elRtTFBJOXpFckhHd2huUzZJZGM4SC9qNysrV3pOSGhTR3NxWVVq?=
 =?utf-8?B?ZVZ6WHE5QS9vUHp3S2ZGbVNTS3JOaUtCMDQyRjVhUXA5MEVmRm80cXRpU2hX?=
 =?utf-8?B?b2cxTWxMcTdzZFZYNWhadGxoa1lHNDRoeDJyU1hiSmF5YlNLQnlDU29uUUtW?=
 =?utf-8?B?S0k3K2EvVXlpZ05oTEdIRWQ2NUh4ZFZWbnFsUmR0MldQaDdZWWk1K0ZBT2I0?=
 =?utf-8?B?MkFoN2NUVG5NRnFMcmNEL0tPdDNidVpHMithZVpKUjVOcTBlY1pmMHpUaXdu?=
 =?utf-8?B?aWlXelh2bHZscUhGR3V3bUpoalIzS3RkVndIeVBDcVZkeUpCL21ZOXNnczFp?=
 =?utf-8?B?bmNmZmRPZ3B2cFhleC9PNXMyOEZIL3BWbmhjNHAvaHZoT29LS3FOREtJWUtv?=
 =?utf-8?B?cG55d01tSzJYVU02M3o3NjdCVGlDUW1KWXZzcE5oZ1Z3OXFPdk04YlVHeDBo?=
 =?utf-8?B?c1NwYXkrNjA1YkM3dFgwd3BOV2VnbGVxUVBmSXhmdUZZdFU1aGp5MDhpd2Vw?=
 =?utf-8?B?L0R5TXJ2Zzk4bGVkaTMrYW5iV1RIQ1JmZWhnSlU2OVdxaHZPaGVjd3NKTFpU?=
 =?utf-8?B?K0xqQWxoaVdxRmJXdnEvVFpka21qSEFGbHBmL1ZqTTU1Sk9COVhSOTZVcmE4?=
 =?utf-8?B?NWRBalEvYTErN1E1V0ZobVc5TEw0TllvV0ZrVFQxNFNHdHk2K08yYWdIUERS?=
 =?utf-8?B?TEJaZVNRV3BBSk1BQUI2U0JjNGhDMUZTbTVZQU9sOHh3alZYcnI2VzdTWTBm?=
 =?utf-8?B?YU0ybWVjdiswZ3ZmRm8rWGFpTzkrZTlmbm1pdkFBNEtZTFhjdjVKL2dLbzAy?=
 =?utf-8?B?cTVWckdQRHpmOGFKN0Q5T0VpL0ZjaW5vN2dJY0FCQUR5SkpKUnZpQ08yZ1dD?=
 =?utf-8?B?Mk9mTmhaUlBCOHdRVkhQQVlMdHRtcFFoTkh6OTNQWktkcXo1WlMrUWVid2hF?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2355a2-4bbf-4144-3e0e-08dbfa95e246
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 22:09:45.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMvZ3iFPyiQ718zTfSouaIv/IPZvT5jouh7JWbWYJEJdUGHBKG/jsbqAKw0bgIMHNrvv2FDmfJAFoZNuKrbdqLLCbOZPJuoqUI2IrpQtktg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcoming Intel Xe driver will need to have a more fine-grained control
over DRM managed actions - namely, the ability to release a given
action, triggering it manually at a different point in time than the
final drm_dev_put().
This series adds a drmm_release_action function (which is similar to
devres devm_release_action) and a simple test that uses it.

v1 -> v2:
- Split the test changes (Maxime)
- Simplify priv lifetime management (Maxime)

v2 -> v3:
- Order tests alphabetically (Maxime)
- Add comments explaining the intention behind the tests and the reason
  why DRM device can't be embedded inside test priv (Maxime)
- Bring back priv lifetime management from v1 to avoid use-after-free

Michał Winiarski (3):
  drm/managed: Add drmm_release_action
  drm/tests: managed: Extract device initialization into test init
  drm/tests: managed: Add a simple test for drmm_managed_release

 drivers/gpu/drm/drm_managed.c            | 39 ++++++++++++
 drivers/gpu/drm/tests/drm_managed_test.c | 80 +++++++++++++++++++-----
 include/drm/drm_managed.h                |  4 ++
 3 files changed, 108 insertions(+), 15 deletions(-)

-- 
2.43.0

