Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD7C68348
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB41510E432;
	Tue, 18 Nov 2025 08:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWfoB7Z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD610E42E;
 Tue, 18 Nov 2025 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763454632; x=1794990632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pO+Ahk+Kq8Syq47cadwxBD4HK7Ivy8A8cUlyycQv+Vk=;
 b=gWfoB7Z91LBbVlIF7NTR25ZZD/s0zLeTlQxCD+F0hDfOtyxVR9Y8iPhm
 nKJL+EImq2cm4+qndhZiaZ+T9f5A12WnKipRh3lFW8zAagMLgOuzCDJpe
 /wEyIlDwDdOfKf37XpWXfo/8ecJa9ZADxH26duV1zrKcrCwn+Sef+x4Mx
 rDr5n21QdMQjiPbS8GqcU2zqHdgezYP9QV7JxjVKpTGidVZJ48s11lXXq
 ilxQ+/i1MKuXE6d31MZ4UWH0W5izMoZtUdp/YY57FjcYyqEfOUkLmGZTp
 403irRSIP0CkxvY4SnsXHATnAYs0imr0AFUSbaTfWtA4RkisKjqr4CZ+l w==;
X-CSE-ConnectionGUID: X9ruGjg9QUmJ8u8BFobaDQ==
X-CSE-MsgGUID: iTFLmsbDT7CgemfUm5ji4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64668586"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64668586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:30:32 -0800
X-CSE-ConnectionGUID: G6npPT8xQxeGHUZ/DU/9Ww==
X-CSE-MsgGUID: RUUl55lWTOuPp4AQ9PwFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195840388"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:30:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:30:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:30:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbYIK3JRmVXEj0bxvQvGtIhwJHKTzsJI4HqCfIpQ4FJSQMTGCYZnEBjcW5WjrgSRgVJS2MIEGkAsZTKNLMaO3xp+ceGJzlJ48kdXkmZlRatQodY5AYdHskthJrI3EZKCw9V3J9dKQFlMR22QtDGoy98y7/lnaI38Ih9WyL9CzimBwtNVXPRnRAbkXLnIcKbeRjtawiN2RPfxv0xv8rLMSCfZLpM9g65xndFjOK21xsN+Heoalg85v8nTtt+om+WM6Nzv2pnyJTiS5jVPw36y6EAnKgoIhbs2qqW8HGGfzealFrhXWn9x7QUzYlUsdpAmMvWMU1uihY9fnjJxeSukZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBQ8oX/P0wLXcIBqtY7bVrcK2+oQjNe1xvkxYQVzDb0=;
 b=WxuozOCG18pD6VhLRE/9/InmknVd0d880rxKFuM04wTBcS+q6+l2FyYM6x6eHu7iz+iEKimVra5B9IP29IK5RzNK8a4tQgzTfPbFV8icrcaZY2cp5TG3EQb2ywUelkLrCw/SZy6Psulow1hG7xl7LnxigaBgxNU4JuIhfClS2hsITsQDedkrZvPghm3BdvLhBSaq601m3ympSRO+D19NVlBz/0LoTFDJKxGvnTiu2EcZ39RTYy8Vn7HTE7WcVPpzWLcdI+aGpgfelabd5uWujTn7EeTzD/7olJf3s67FGHgvJyxikiAEcFzQPwxuCxbbdFSZDUYlKsKpnG4LJ/Rcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8459.namprd11.prod.outlook.com
 (2603:10b6:408:1b0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:30:26 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:30:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 10/16] drm/i915/color: Add framework to program PRE/POST CSC
 LUT
Thread-Topic: [v6 10/16] drm/i915/color: Add framework to program PRE/POST CSC
 LUT
Thread-Index: AQHcTk75hUm/4P5hakWRQJgCVWZ8LLT4Ljfw
Date: Tue, 18 Nov 2025 08:30:26 +0000
Message-ID: <DM3PPF208195D8D4949207636E92E211F4BE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-11-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-11-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8459:EE_
x-ms-office365-filtering-correlation-id: 7f08bcec-ce6b-469b-5ac9-08de267cb9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OvlKYE0vdyjfdlEaPOxXP49lyyJcFiwggdnE8rdhKvg2U86+kGEC75t/ch+Q?=
 =?us-ascii?Q?Y6UNFmLwFefca9Y46Yv3cBcHJi8Rv6ez6qSuREOdhXBK+UveBDU3BCEUsLIM?=
 =?us-ascii?Q?CRdid8Y/HyN9tk+PZE47toL6oC+ylecbTaD1RKne/7Z11NW/PpD05MAwn2ZZ?=
 =?us-ascii?Q?FsRu2Hyzk+qIRhAr12/Ke5JIJCRW38MH7R2WtGKbqOQSCuKRRAH7c62YKFHs?=
 =?us-ascii?Q?/fDtZQdrlz0WySQ2uNNVNmAlGzRtqxKK1CTLvLu+vqwtpxudId8EgG/jHvvT?=
 =?us-ascii?Q?s0aW9dO8bSwwaXAJNmtc7KXoxi0UVLMFGjrTgtsp9rbFstrt4y3NXDNKN8jG?=
 =?us-ascii?Q?9zAzVfnPbas3XCXalTH0oI3/QcYAx9V+WqfhLsUYBm112fmGvaQgzmhUFmxQ?=
 =?us-ascii?Q?djcqqO6TuUGOWaaLIKsFuxz3f7far5cvH7/BbL/yf3GcZ0LuHWyQKGgcmOGD?=
 =?us-ascii?Q?cSk8uQCASWoHeJD1LuiJPDOfSl3Xu1xtKK3wGpA294oY2aHqfoX7xMl83yqV?=
 =?us-ascii?Q?+GtNlfZ/1nB92Hi82vBMgKzgsqXDsoMV8KxYn/SZSqZXmLwpVb5kZ5kMWKhB?=
 =?us-ascii?Q?e6xE/Mrp096J8du3HZxCBmELPJTgoyMQKdzXEGiV3nFR5HwGJAlaxbA77q1V?=
 =?us-ascii?Q?kYj1ERIAfp6sxMO7Vfs6j83zlQ2UYnjK36rS6EPCLL+vDmUQPKglJkPPHmbG?=
 =?us-ascii?Q?OSnVKmHQJUcESo/nKbZ6K2osNSCp/BmfQljPw/YUwc+2kqZroBV6YgE8bIaD?=
 =?us-ascii?Q?0SY1yYeGoGbBzqfu+EjUHnqpJ/7ZfUgxYmg3MTMz5hUdHOwWLTFE1eIqfa5x?=
 =?us-ascii?Q?67KYHviLBK95sgZH46wlgjlbPyu7omEIdyfMvpsQopzexRzn7VpP69/y+r/8?=
 =?us-ascii?Q?TSvjTNG6JAVry9/sfKHNxtEnb9f3swTzLi2xD+X0Lkph/7aR4MIVVOcevZoF?=
 =?us-ascii?Q?zFQ+Jk00YjJNhV0U3iiQ/A1oPbXR4VZtiYSH0LyO6FMuM/5NJqEbSSS4B7UI?=
 =?us-ascii?Q?3aE4hTCC+W909Zqy+HBhOXVJNjBbDgnmSkH2rQP8n0MwCzhJqiaDpDB3o8KP?=
 =?us-ascii?Q?AOr9SFCrslPrsi978QF8mjPI6KJkpkyMR123SL51upUT3dLUwSAP6RqGQqcN?=
 =?us-ascii?Q?rvyajJBBfsFfGkKYkFEB7SxF7ot+7CVP+lmkzmsCN0rhR45vchN2/grdONgJ?=
 =?us-ascii?Q?k82LvGIKVQwubeSqC2WC1CkCgIeGaKnUk+D4vt/PwyxJ6g+/084IYUajSayw?=
 =?us-ascii?Q?Fdw8WhFUMuni06VS6SdLLaBZMLec4422ufBe883vI3MRFIgeYtX7OMj4RYPW?=
 =?us-ascii?Q?5N/LodeyCwjDtNcTirblWRsNc8kt2rkoVW9zJK8Sdm/LI6pt5qATgfJLCDiR?=
 =?us-ascii?Q?rnN+eb5t7p5s7/MC/gV+c00+d77NHjgEVdGU6vyh7yYZVSb/sA98/QLSDQ7f?=
 =?us-ascii?Q?YM4n/0MtmpLLaxJckvcPyd0OYal/F4JLd3mhEquvtxQy/M4s3OfNM5S2K06n?=
 =?us-ascii?Q?z+bghCEmo4Tts6liNfpBsYXtL9LbWYNiMabH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HEDc3rS/W0PGulSMHqA6dstf1mMaU0ybDwulYA0LolWPZAjjqvSY9dTqiMKP?=
 =?us-ascii?Q?UEAbkjD6ltohxaAI8GQrEO0U7YBvCzI5pqP3GxV+RnEHkuT48Lycx09bqLUd?=
 =?us-ascii?Q?3qXQqSHo3fqH2lLTG9ZNrwZItFhxcjzsFwx+0ai/uycHlP6Qb5EOBP4eKwCy?=
 =?us-ascii?Q?30JA6upMj1hlLWmz9qSyPfNsKiOk5qOgX/g6xRaP/tKU5QZhP/rJsuztF3o9?=
 =?us-ascii?Q?SXAYK9prKwmFtgOMDHiPEkrMW3Ecsld1mdVGwbUijpqSepmVbEtGQ1NtmiCD?=
 =?us-ascii?Q?WLtzP+fJdypnrOJkhilC3OLDos6MGeQIAJWfpHn4+Rd8cthyIo0T4Ds+O7m7?=
 =?us-ascii?Q?BZV6BUtUXvu+nNbSxtKrEkpD8KPKmWQd5lBW9kxcFkmvBwPTYVwygiPFPWGo?=
 =?us-ascii?Q?Djzp26esP8h2ceixRzthBckc4/BSn6LFeL+AEFj9nKUaKKYFVsTOJ6nYea7F?=
 =?us-ascii?Q?OFvuJxHYIW9j6HDgpNbWMFeLXYP4r2OlN1Ht2qZ/M5zOw6Cov/xkTliMI96e?=
 =?us-ascii?Q?I255nwSw1q7/KJAf1hq16F4aWgcldNU/O0dyfyiqYxjtalX1cSnwEkr5LvY9?=
 =?us-ascii?Q?r33iGVhIp3kdDjtqofqoZ0ZWjWwmr1XzPRjt4iXBDQvikCMn1APEZxu+iGar?=
 =?us-ascii?Q?dDg7Q0oHq6Udymg6PmJZMIFRwpGDQK1nsMXOXP0ciZgPdDGzxjhgzjNiN0sH?=
 =?us-ascii?Q?aG9eRfGfnLTYE1o7+ayyuIcSI+XRbyvEm9LdcQ2SlRFMiEa6SZuDZIBjlQtx?=
 =?us-ascii?Q?xK1s3M2cG2p66Ez4RcmbIsMUlTVJmtsOTELf4f6qpEgkPOROZ6c5DMwNyR9Z?=
 =?us-ascii?Q?cqq9fCHXKhnyI2542BDzo4AYE5GmdaXEaQXIkLiUe9Rz+PcR1aSYhLmSfwNJ?=
 =?us-ascii?Q?mea2KFUYZ04u1xozODZYaAo7om8UpPtp7WSsGYrZE2WRMbTQQ2mwdmcq7g6+?=
 =?us-ascii?Q?pTaQI5048EysJ/e20z0k+8bTzsqVK7r3tpxME41uea6/EX6/MCam3oaxWMSb?=
 =?us-ascii?Q?ikpOOlYU1wKo2c5M2WtRRiLYSQpK1gfAcQ/EL3hFPl/oxb+fcEg3lmfAVHu+?=
 =?us-ascii?Q?OIUt/yEuLxg7W2j77fcwgYS/T97SLiEAMQpH9NAhvtvp6hp1JW1hAyohDKau?=
 =?us-ascii?Q?2xsGxCqBc9OHfCuHoyoujmGDdSLsC/62127JoJla7I8baTCwDQIvZPW+KVSy?=
 =?us-ascii?Q?Lla6Dm9s0XHXxCv1sdbTnlwGy5DCNKLH4ADtN7O/zejj3Uw83njGcMLeuYs2?=
 =?us-ascii?Q?4AvyGdx0TLyJ33WmZmW/cn8J3X9bDfxNhfHfBM0tNlLiO7jf1MqkAeLcPyP7?=
 =?us-ascii?Q?ZkUp8vrP6LkG/W664C2AqjQDwUj6FAC6GSXev2YXp3JyJjn47U4n56PbsbMv?=
 =?us-ascii?Q?XL4+AIQyF6cpmbHYKrVHz7gNl5H/5tpJSuvWzSZzi1RSjwst/anhX6Tk6GeU?=
 =?us-ascii?Q?wELghwCcnO0sFSpPotgnB32fcF+ZA08RnlvRj1x6U0GbXtjGLJw/6Wr3lLiB?=
 =?us-ascii?Q?/oTZwzm9HrudsORGdlFNMcll7wKVBZpFumlEnMG7IYj3ANBL//ug85+c5hlz?=
 =?us-ascii?Q?EShpscOYIyfwrT9Ydw8J/rW5EoMItvaTraGwGnK8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f08bcec-ce6b-469b-5ac9-08de267cb9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:30:26.6134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43sSB+4vXw0dt66Xd/6LEo1x7KFaQrBMQHDEQYkFzUFGLxIY03ifmj0IJ5hGROZhG6/KHWmKWrfXajDQOj9Pjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
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

> Subject: [v6 10/16] drm/i915/color: Add framework to program PRE/POST
> CSC LUT
>=20
> Add framework that will help in loading LUT to Pre/Post CSC color blocks.
>=20
> v2: Add dsb support
> v3: Align enum names
> v4: Propagate change in lut data to crtc_state
>=20

Move this patch just before the 12th patch so that the next commit introduc=
es the
Function that assigns load_plane_luts

Regards,
Suraj Kandpal

> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c       | 16 ++++++++++++++++
>  .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c       |  4 ++++
>  3 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index fd3c6b7b0f38..83b0cb519e44 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -93,6 +93,10 @@ struct intel_color_funcs {
>  	/* Plane CSC*/
>  	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
>  				      const struct intel_plane_state
> *plane_state);
> +
> +	/* Plane Pre/Post CSC */
> +	void (*load_plane_luts)(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state);
>  };
>=20
>  #define CTM_COEFF_SIGN	(1ULL << 63)
> @@ -4076,11 +4080,23 @@ intel_color_load_plane_csc_matrix(struct
> intel_dsb *dsb,
>  		display->funcs.color->load_plane_csc_matrix(dsb,
> plane_state);  }
>=20
> +static void
> +intel_color_load_plane_luts(struct intel_dsb *dsb,
> +			    const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +
> +	if (display->funcs.color->load_plane_luts)
> +		display->funcs.color->load_plane_luts(dsb, plane_state); }
> +
>  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  					const struct intel_plane_state
> *plane_state)  {
>  	if (plane_state->hw.ctm)
>  		intel_color_load_plane_csc_matrix(dsb, plane_state);
> +	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
> +		intel_color_load_plane_luts(dsb, plane_state);
>  }
>=20
>  void intel_color_crtc_init(struct intel_crtc *crtc) diff --git
> a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index d25f90ded71f..d8fe80a55601 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -646,7 +646,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> -		struct drm_property_blob *ctm;
> +		struct drm_property_blob *ctm, *degamma_lut,
> *gamma_lut;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index a5d0f95a6f10..298f8e186fee 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -344,6 +344,10 @@ intel_plane_colorop_replace_blob(struct
> intel_plane_state *plane_state,  {
>  	if (intel_colorop->id =3D=3D INTEL_PLANE_CB_CSC)
>  		return drm_property_replace_blob(&plane_state->hw.ctm,
> blob);
> +	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_PRE_CSC_LUT)
> +		return	drm_property_replace_blob(&plane_state-
> >hw.degamma_lut, blob);
> +	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_POST_CSC_LUT)
> +		return drm_property_replace_blob(&plane_state-
> >hw.gamma_lut, blob);
>=20
>  	return false;
>  }
> --
> 2.50.1

