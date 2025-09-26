Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4CBA33E3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B4A10E312;
	Fri, 26 Sep 2025 09:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0tLP773";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C6610E312;
 Fri, 26 Sep 2025 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758880340; x=1790416340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tAnwmJ0m3rX7tHVUmuVDJ96tZEgwLIX8LuK6scBkcOE=;
 b=Z0tLP773cL2lIYffUHuavXXuXbA88tza+U9o4mFU8EDOWu7l4OGyxary
 PN//kJsBM2rBZx/5F/PejnAB4pXZj355TMHdFfgrU7f5x6MwNacoFm9jQ
 0ulV0ektPisSpo9f57hcf6nZfdoCa1XP4+MjX6Xdj24klaSfpFJeywY9b
 plmVustdnfUEoHgNcN0egGeS5mWVjs4eRGfL/Pwd2cDlh+CWEukv8Szoq
 LKwTVyrlGLfy17mllvucPNWxYMTEDGIONlwWgLIlGtQM6ZQ2qxRahZCcj
 Ruri/j6HNPHMMySYQXQ9qWxdr0DE31LoPgR2FaC0UYVdvTHqnoCnMz7G8 g==;
X-CSE-ConnectionGUID: Kb7s7CnARG+NMqWe2gIYxA==
X-CSE-MsgGUID: Zr6TIVoeTEiL69FFK4JeMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61164042"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61164042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:52:18 -0700
X-CSE-ConnectionGUID: ZbNhzeZRRIWZe6CGCfhzwg==
X-CSE-MsgGUID: K3HXwHpwQ12Xbs5K/A/6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="178334471"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:52:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:52:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:52:16 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSJCJBB9K/7Udu+2868kQ9dhe7GqQLIxqdnsfajz+yFRs2jYEQhzaRp1JHa8F+qD1XBoaaVf98j52/xHn3/OmZDmDAzJBULJ+7ATRlfSN4THtQ5huoGB40MHl/jlz2BQMuFJApzwmRvNA4aHWjMr/qOLg4Qoq5VgCUQfdH7JgGXupzBULRR2zjoYQY0VMd+ih3V1srLJfrTYToW/gOAsuAOGreI38/rdN67XtENOeIC9VDnihIQJyvb/q7u2OGTu0Nk7TBdTGHwY6D5/V//09aG4mSZULFZXfBgRjMM0Qa3Xu70MpmO15K8vjcfuADJN3JRUGCuYKE3goVDbysmv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7vRgwuPzTp1w/680t0K/ymSPUtybWCCQtstDWFFWGU=;
 b=sjvtAbhko96t3fDo0RYmf1gOUEvqrtjszePOnDDk1XTD3ZrLkSLR9OHWz0uROrE4+sUssoQuaE/kOn3lNrtfVnGmbVLI5Hszd3JMattl5KgRRlH9Ih/UguPk5jQqmIPakCtdyl7sbupjCt5V67L/B8zRT5R7xSeeU1AJI6exegQ4KYdTKy3s6PWZDjiAiePb2V5IP5l4NXYQS47n6eM11wC2BXB/EsCdXYTkXSJToSBxlpmt9nJIDr4n7qNkHXetyToEClfGV5+f0+2aR/vZxeOVP+nEdt9mMXPVehpIrSoQaXkd4glbmU3j4OoeHMveijwoF6032tuY82gdjDDCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB5206.namprd11.prod.outlook.com
 (2603:10b6:510:3f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 09:52:12 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9137.012; Fri, 26 Sep 2025
 09:52:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH v2 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Topic: [PATCH v2 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Index: AQHcLsmibI+myP3K60+lqLgEHaneubSlN4Dw
Date: Fri, 26 Sep 2025 09:52:12 +0000
Message-ID: <DM3PPF208195D8D8D08C129F107E639D9DFE31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250926093832.2811200-1-aaron.ma@canonical.com>
 <20250926093832.2811200-2-aaron.ma@canonical.com>
In-Reply-To: <20250926093832.2811200-2-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 26420c86-57f8-4002-b3c7-08ddfce25e15
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FOcoylaohnPonL7/LOumlLU4uaAA9VbiFBZfBSJ2HOtyc/Txz9ka+/S2gX1I?=
 =?us-ascii?Q?kBteuOthc/KKSOtDzv4FssfE1Duvtq13oyS/B4O8H8lRJxSbto4BhyW+b690?=
 =?us-ascii?Q?/sjtFeXNuDxWZPIiIuNHV89uKla1h2tCmEZ0HEumqMeaBOQLZReJaVPFH79x?=
 =?us-ascii?Q?OSkS+n74yjQOFGF1yxlRv9CDrHEAVh7WZa5R8K5iJ5OOy0Az9kFngS47zNaa?=
 =?us-ascii?Q?9KrM5zHMFCouzHzbmSM6KGHSLcIyhIsDoEn2DR+q3pPJJykJtUKr/3cNKmjK?=
 =?us-ascii?Q?ys1/CHezMUqPfZfbpIazh3Tc4T4t252pQcIURU0i4cKaaz1EZCdQtrzu/ITZ?=
 =?us-ascii?Q?3T+Nf/XtT9EgUiMo9p2VS7ztp1Ny+wZiVdEVe/nIq5PA18rlzp5XWo46gJ95?=
 =?us-ascii?Q?qA4Yq0q60gTcLafzwGPIUGenRGNp+4a40VKsW1LsfRQ7ratOA1QToE+ri9R5?=
 =?us-ascii?Q?An/kWbzKCa68q4+ahYnzn/88LUQenw+hD+xA4el2GLy9+DeAUck9jginQctt?=
 =?us-ascii?Q?AN6VgnNRuZTEAFhBMlONP2jjbF5f6f+VjUOR9XOFKNt2tP4tVAIHZd4RFocl?=
 =?us-ascii?Q?UNfDdfsZfZdeAvz3dA1VBENZk4v0268jXWbszLe83spjwl7bsU2TIjQjWT31?=
 =?us-ascii?Q?AuTNrAyyzG1iuM76OVPhhDs8fezdyztyEKQ4fuiaidZwIE30a7C/gtusH9xl?=
 =?us-ascii?Q?XohTZhRoMQQ6TdMgYRNaA+PqqAS+cskegjN5Xeu3iws/yizbPB/ME88WBuFa?=
 =?us-ascii?Q?jU2Zu7IbCtN0flUgfsyeQ2j2qKa0Kf/Wz/XFfZmHrE5zyaG6zR50B7lKZ3rl?=
 =?us-ascii?Q?CupNNOq3uGpyVPWKC2bb1OVBXLOq/17U+6oc6IySec1Ti8OfZJJOvRLaqsZ0?=
 =?us-ascii?Q?T6MNZJJOR4CzLyxPWKfpj/uXhwpBimf+NTOqyYc1U3/wutsX/8ohxda3Udlr?=
 =?us-ascii?Q?6yvvuMJrF566LMWJwArQ9lM7qcKB+/b3hngWoS7TT99V3XktmegUaIerp9OZ?=
 =?us-ascii?Q?ibsu9Qn3MyIOshHClYgcARo5YcCXlDI0sbSxbUuep7k/OqFr6rJd1SbqHCSu?=
 =?us-ascii?Q?B4fv7famtCKazORI5ZN7oXFf/uzw1MqIoIbqtpWpxUWI3gYXJANL9au5Awrp?=
 =?us-ascii?Q?+iuO/Ywg4yrkuC9kjg21hIfn9QwER3CUS7FWnH5yxW3POSkaiJkj84uhMI/O?=
 =?us-ascii?Q?lj5v5BRslMq57Z4Q7s3RwT6ePq6m4JdXC/RZhSJEvz/RHfbtYQ7O4R3LJ9Vr?=
 =?us-ascii?Q?A9fgXRQRU9jRtreenL0Gd0HtMrT41s7CcPCNt1GnUUqcu4/6MxHMuQq/mewJ?=
 =?us-ascii?Q?QKaYGXmv27rTsTJRYyOIZEEJ9kogrSS5IPKw7kTyLkDKrysrgI4gdDCE4fJY?=
 =?us-ascii?Q?KnrGxn4ijVrfF2mMk1/5MGq9eP3Cqktjf14D9Lra0E0+qDH1IeyGz/gSjuaD?=
 =?us-ascii?Q?yAkAvrXjRjmA3XYfJjiNRucLukzHJ3mLkCRTakFVUYO7tv5LjBtmMQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g+Zl0f8anNOMPR3v/1vqiotLqQAH7T5K2A4KO7Q9u/LX4upIkqyN0iiOF6d3?=
 =?us-ascii?Q?uFTfs9WFfy2qQqydO0OPryPhuenoWxfOG+udUGbBF1wTBE0jyExTPtMig6Wd?=
 =?us-ascii?Q?8CkdiVKy5ic7eD//KSXdvdffPej7dasVD1MNyQQ5zI9B2suhZFVRouZ15EGT?=
 =?us-ascii?Q?JMKu8yKj0k4GAJTeFGHdKMeL7huYwMvsMx+JN9DAmY0Gu4H0jKEzpYmoYT1G?=
 =?us-ascii?Q?gJdos3H6Y4GCM0fo4lIIlQt+ZsKfi1XH/GgBG9DDBYx0YRO2tbACEc36qqTf?=
 =?us-ascii?Q?IX7qCsAe6Ahhd7fJCYv4riNmfWkbqUbd1Or8YJgW6YkljWk6+5u5nQittlrk?=
 =?us-ascii?Q?5BEY6HHLv6sxudghCWrJ4/VMuOTPY8O++N+yMXGigrLRGbG/kZzpKFCAfjI2?=
 =?us-ascii?Q?KIYJZxIRp0LnI5hD1BnHf4CohpSe9oFxN7UCTR0wPjaKnL9B2OJj5Q94tVSO?=
 =?us-ascii?Q?xdiWfleoEavT010y5z4DaNYxRnxgB74stV8sszM0bywTU2ZGRWEwZdEaW/5B?=
 =?us-ascii?Q?jtlzATQSlbM3ryV3x9mnsMe5o9tuKqZ2rASTXBlczyWfiW9ExpQlYfHAnoPh?=
 =?us-ascii?Q?8tQ+mZQkul2RkqXNuy/6ib84nS+AKuqYuka1bIY7n39P1aoxeR36aNjygzUl?=
 =?us-ascii?Q?LJgrPjDE4q9LetVRO8fJP+05grbBP/77orrEhX56cstarRJT0z7km29tvrdP?=
 =?us-ascii?Q?UlO1PAlwo0S3gB6qg++sJLk9IwP9C8mVnMg9MTnX3Q/iWW4lTvlPtIoN0pVm?=
 =?us-ascii?Q?C+Z+w+K1zvaQNaEe3wkL8qCQwB8a09phqXjjOdAAMDtJQ8QUKwgAW1l5Gr0K?=
 =?us-ascii?Q?IKPYW2YU6ZuiQ9qqoDjAEd+X3FVXafkFv5R2f0N4g98+3hVQahb0FttO8xED?=
 =?us-ascii?Q?TZukeZAz77n6ndwlgBdwdlnuE/uNYGUM06iTBDonAhd6gotoFopz+7S3WiZl?=
 =?us-ascii?Q?1YXt7ApZuFZUN7mxM6woEDKfBGOW1KuPh78ZthCmDgtewYQlO3YAzJPMQFtT?=
 =?us-ascii?Q?63VE9GE9RMihmubwflLsC8vUB3Z0DUuSVFezrpD4uxXsUvjn5DGTsq3hyNmM?=
 =?us-ascii?Q?3IKtetOVD3Wit7H1weA9RKH/pwjB58aoZm5YwW2uODVIF3ljIKp//xjW3DR8?=
 =?us-ascii?Q?xELMjrJbUEJCexi6NAf69oeJ6aMWWwYly1BDTgvBVqo8W7HqCRZ7cGnc1+HD?=
 =?us-ascii?Q?NIsS9nBYxghLw1ZepxKbeGVv+7xyRL+WwU7kMHfrmJNUibdi+e2LF/VuOUNp?=
 =?us-ascii?Q?gkSgjhFh1PqmOcY/9TUk2hjISsu+bTj92JxEVeZeeCPAl0gp/+zOzHW9+FLZ?=
 =?us-ascii?Q?gR+u04J1s4Ibm+OAho+NxvRctENxrGVMSaBB+cLKMnsYCKun9mwvfeXcuwXf?=
 =?us-ascii?Q?5A+JRLva2iv6RmHQdLcfxb6orYuB89/bx+52nj9VGUxgnKpn6Pd8eyOJE1BA?=
 =?us-ascii?Q?DRsoPGuo4UxOTwtIvLB39KdPIX94OKrncQ9tsok+8HaYGYZX2Y1A7tGQbrtv?=
 =?us-ascii?Q?L4UZLYRwgDwKw1KuYq1YXwffq2WnUWWoY4TXd2qdN0w/dNp+RsungVGt7TV2?=
 =?us-ascii?Q?PFoLBjQrI/Gy+LfGfYxXfIdUKaG9G+rk+sgMQgLx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26420c86-57f8-4002-b3c7-08ddfce25e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:52:12.7404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ky0iYHJjZ7wyezlCKdYyxduw9pbxSqz1Yx0tq9WitXq+Im6SqF0iXJGsNOEZyG0pfVK4jTiM33vvtG/XFZAyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

> Subject: [PATCH v2 2/2] drm/i915/backlight: Add get brightness support of
> DPCD via AUX
>=20
> Use drm common helper to read brightness from both luminance and AUX
> mode to support get_brightness from DPCD via AUX.
>=20

The version changes need to be here

Like this=20

--v2
<change done>

Do not send revisions this quickly wait for a day or two before sending a n=
ew version since
Everyone isn't in the same time zone or could have simply missed your mail.

> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
> v1 -> v2: no changes.

Aso this shouldn't be here
This should be above your signed-off-by
>=20
>  .../drm/i915/display/intel_dp_aux_backlight.c | 20 ++++++-------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 0a3a3f6a5f9d8..0ee6fd0f41ef0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -454,24 +454,16 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en  {
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  	struct intel_panel *panel =3D &connector->panel;
> -	u8 buf[3];
> -	u32 val =3D 0;
> -	int ret;
>=20
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> -		ret =3D drm_dp_dpcd_read(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf,
> -				       sizeof(buf));
> -		if (ret < 0) {
> -			drm_err(intel_dp->aux.drm_dev,
> -				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD\n",
> -				connector->base.base.id, connector-
> >base.name);
> -			return 0;
> -		}
> +	if (!panel->backlight.edp.vesa.info.aux_set) {
> +		u32 pwm_level =3D panel->backlight.pwm_funcs->get(connector,
> unused);
>=20
> -		val |=3D buf[0] | buf[1] << 8 | buf[2] << 16;
> -		return val / 1000;
> +		return intel_backlight_level_from_pwm(connector,
> pwm_level);
>  	}
>=20
> +	connector->panel.backlight.level =3D
> +		drm_edp_backlight_get_level(&intel_dp->aux,
> +&panel->backlight.edp.vesa.info);
> +
>  	return connector->panel.backlight.level;  }
>=20
> --
> 2.43.0

