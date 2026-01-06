Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6CCF7F5A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62C710E4E0;
	Tue,  6 Jan 2026 11:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaMwFx++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132910E11B;
 Tue,  6 Jan 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697551; x=1799233551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hZloKtreeX4CuSbv6sBdQ4vrwrcCw8xtIs/gw16u+Oc=;
 b=SaMwFx++L76zaFGe0IxhrYVw3Zgtuf8K0AHsNw2SVl28ec4RIcGUkWBd
 IFHR7DnJK55weFvg1zirDMfRxqVpLojg+9vKhysbiL6NbDezcSrYvbn58
 4rfyHg0v5XvUM0J8UrW0F3rg71CHs/P+0FO7F6C+nWWA6Hxv2nXwNFtNO
 nmOGkku+/sPyzFHCRvFB71VGk/HeqkpL9KB5KqcRx/zj98G5QU46sHYZ6
 J0Y+YVriGeceZN5qJUOKCzKEXnVhJgmUKGmCUILI+j+VgtpT30CDQ6g8G
 VLufVw0VHgJA5LZwzUGiuTQJyedGPMx0DHeuC7zpK7irBEGG5QUplHZtA Q==;
X-CSE-ConnectionGUID: 5EDnLFiMSfObRT1SwUFNYw==
X-CSE-MsgGUID: IZKlN8kXSL+u+VJ9bAJOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79696843"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="79696843"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:05:50 -0800
X-CSE-ConnectionGUID: Gy+kdD55Q+2t5vV0uRhB0g==
X-CSE-MsgGUID: 55prwlpKS0u3t4avOc1J7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233769792"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:05:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:05:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:05:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJl+Neld1dILNwAVIU2LXqGuvot3s3VbYBwst3yQm9cQhCG4v4o0VPB5pBXlcycZLRGoBNWKnU2TJ6j9OuB7TLNZXwUPzDazLfx7SgslyPWwrkHm0ENjectcDnbx0KcI8Lqrcj2oet+LLWK1Kou0KDzlhT9BwHik65+Q7JoPtIS0jgm6gPOm+FOzUlm1HaMrHo4FQRZN18JpuJniNVYP7DWXlk2H8NKYvti1sAsCHnlxhsALbT9qNYASrnpTBNCoCC1LvuWIqvfu042fyXMDxKcWgNKShGDksinleC5Hvep1cqy3tvQWB7UcS6GkFgxaGx6Py0bpDFw/tOMelrMULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4DvDpN01wmVSy14bNF416sET8zI0KSkTPRGfaqIwQg=;
 b=sMKE8TvHChquvQ+AmZ8BmSLg9rYRfTeoqz925WeiEzLR4vgcGYgnhlmP/8HGNTdl6m7QeBKOsD5ZbBrvromKZPD/9AsOlaftaNZ77fWHEXEzhsjpELRBr0tmIf4SsyIcqr12HEzPROFUNccOybkcvzeXDD3OIBBeNJfFXm3A6lJOXMb7usw126msYhiOyfllUoBMVJCGPU2NVFcPXaZsAXUyZOiEiScDI9IzrZOjX1sfk1kdVdJ8HlQcd0gMb6JlhiPF/TMTzcCurWhGye97oFTVKyeiXjHv9bSQucjtXSCg/F6vABu2iJ4rk7/8yne3r4yzPBtgAuZQ/FDnr5V4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 11:05:47 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:05:47 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
Thread-Topic: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
Thread-Index: AQHccLb7gaRR0+SjqUiqfBjzAw9UuLVFFzpA
Date: Tue, 6 Jan 2026 11:05:47 +0000
Message-ID: <DM4PR11MB6360884CA87B4248C9AD88AFF487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 920e4e3f-9224-474a-3842-08de4d138b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+PYKNoKRcmBDescnJ8Qzbes/lYvNcXIJ0VxWHum3UseDBqN8t5GZ9ipHukNv?=
 =?us-ascii?Q?v3Ti21u0gTSW3jfJHGsYJuGJO1b/8Oub7iVM3MLYd7j+MzcU9zqrS4Dn5Hnh?=
 =?us-ascii?Q?BZSaaTAITI3Ck6q1vJ0ZMvsLClctXfDJx+g95HXt8/854Qe4FQLDyAQwHHsE?=
 =?us-ascii?Q?v6H6ODxjDIrCxNwPoZbcOTTHnMbwKODM3/DLu3BtzG6P+ax/NPDdrl+YUQ5Q?=
 =?us-ascii?Q?GeAvhR9nB2Ji4wDv8tfLZCu/N1S3bk7uOOZX2KNYVYPQPK++UnrBCClY/bYt?=
 =?us-ascii?Q?BDCLkeCfIqnQ/lf1SSM0c4cMZwg+eLPuJYZb6O0upNgm9PgVPpncH45R4vxZ?=
 =?us-ascii?Q?EPuMiHDLuTTIgqZStL6S11UrCG6Rq+2OTF7EGPRK3TClimzqTtzXSEyQ/T+V?=
 =?us-ascii?Q?WUISeF5IM9nElYKvvY1aTERxlrQB2WoNYmPWS0VoL9tsERutpdKN9IdsVZFe?=
 =?us-ascii?Q?RtdRb/Op+IPh7qfJaCBR/RZ7wSPuyI2Z4sFtxyA6n2eFutw9/UR5M1Xu78Hi?=
 =?us-ascii?Q?8CfqVkoS8k7BNzoalq8KKIzK4eRyOHcw/d3sDPxXUWtenGXZ5HROVH3Vhobf?=
 =?us-ascii?Q?zBY8zFCz+/MZbONBdERJEymc44o/9gZ9kkwz5QvPDdTHDXuF8qa2Gg5y6Lj5?=
 =?us-ascii?Q?mhAPua/QxeVGzKN1jpL/QWVjARUTXzO9oWF1hOgJd0s2lMtJ05mMefh+Be5L?=
 =?us-ascii?Q?UBH+RpleIC+NHKysoW1+Czl/V6FAfFLoQJmVK3rCYpMLub2+2HBDnqvTRcWS?=
 =?us-ascii?Q?qxGZTdmgFJLMIl58CR4gtwG0uuWIRxUTxi/m4bHoFRCqJesQFWVM1HLZ4UTl?=
 =?us-ascii?Q?2HerzMDiALPUBtgF9hgM4yUr18WwpxD4Io3kjIJNKK6D2I1NSsfy+MqoJZkE?=
 =?us-ascii?Q?yZzoEQ5TR4BKoCQ8mWpkGcdl3cqeyw8HDApxgxhjmRJAAnMcSvtTH6L2lFvn?=
 =?us-ascii?Q?cv4J2ua3tqKcrjJq5hhyIqKuH289DpBQW7cAjMEhR8JabfGoLdC4vv3D9owi?=
 =?us-ascii?Q?WFfr3u7R6qGyzJOJOGOzGFkewmsYMtUbxBJSf9goBcHesXUUP/vhv9jRobOc?=
 =?us-ascii?Q?uAzVKttQ8Oq08NztM356TAB29XQNKTfGQlKHypr8NiYAin6F7gpfhpM7aoXB?=
 =?us-ascii?Q?y3t0BXMCineO0vcOwxNBcBChVGFlUn/nbc+wuyIhGnFbmpGUHAOX/7fPV6RS?=
 =?us-ascii?Q?+HV3gBz/1Jwy6/E/rhMpD8N5ZFG6yoNR61p+CYtdGo8ThJ9ktnrVUUNGRjZv?=
 =?us-ascii?Q?abQtGR7vBZinyN4eYBchN+smPiIfZrS0g38EwUJLuxIO4snozmtHAk5QTlDH?=
 =?us-ascii?Q?Qml3rOBY7os44Av8nIo7sV6AC5GjWBWHB2vAF89DRVO9OwtxG6j9H4VC9wwK?=
 =?us-ascii?Q?6kJNykg2kfe262+ka1JKyz2HPccvk9ZkwYQwzy7iB4AKhu7HEvrsHz9VkmNM?=
 =?us-ascii?Q?I4RVvCRz6vjsw3jtFpQDjkrZ1+npoaLy/emHsAP+ZRQTpxbv4jNhGZPMBZgZ?=
 =?us-ascii?Q?jFwj7GN3dq7evVrVbpTQ9cH7WjseCl0Rq2oN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LuLCHYzeRnuFMUlnz1JPagZAUpatPTIoyFr/GvRgdjkyDRfPmA93EhvErDqy?=
 =?us-ascii?Q?Bd3c7ETA3hch2WpSA/r5JVsoKS4TXWutm/bcb1DEuNpDyp3nZ5E08eEbTFD6?=
 =?us-ascii?Q?pqM8hdqAMiOXtwS4FqHq20093CJYpg+WkjTr9UK16GhdJD5HVJ0kX79OAMPg?=
 =?us-ascii?Q?kcwJ/DWGoXTHDlx1cNzkohk4YmWtLWnezAEbK2Hpli8MR9fMim79aTxGUpdf?=
 =?us-ascii?Q?1vQ+3cDAol9LKzH8qilnN0PSCFUXie7nL1lkrHvcuInXHagrXiaF6+bOpcFf?=
 =?us-ascii?Q?TQuMWkmiCPiLGGcD/s6ytDarRr0NPI6mfeHbX/40IxYzLp+ug/S7LZoIgYDv?=
 =?us-ascii?Q?HgXvSjiIez/tcAH6d/AZj1oGUAPRG8sNff3fGAkObcRmbwUmFylXZyU5G+R9?=
 =?us-ascii?Q?OyiCh97NAFqM0bFNAjrXBcbSubRo6Lk8UU0tDCY1uNZt8pZI0qI1vugBjyUG?=
 =?us-ascii?Q?9w84khN0HUHHaactwq3Dfk2fYz9pEg5OZetUomzqmbfdsmGy6JkrkeUJM/QC?=
 =?us-ascii?Q?OkuxslzWUPcmtH46C3VBkJndLHR2kM6Xy4u+h8wzSW8wLkN95c1nyM190dxO?=
 =?us-ascii?Q?x4HuPKfketRcCiPJfhwPXMSVXWcPRDClGtmA8w12peOJy66ZjU7WwJeILuAF?=
 =?us-ascii?Q?W7IaQsMch/1Z2Nc02IfunVrFx0vVM6luDvFzETDI/2/jkSwj+nLi1XOyMg9p?=
 =?us-ascii?Q?XmU57Bl0zreKGMHXPO+MBouxfReXv46eBG7Y0ddxR7sGnrJ2nvkRmw3u3hzN?=
 =?us-ascii?Q?Yl0Q7nyuV/PjaHU0Y+hzL/oUcKiZ8xsVUFEL+Pn+VHS0ddkBXaQemuEP803R?=
 =?us-ascii?Q?AfYZtXx2hVF72KpOqbfQEb2IRPR7Y+gwinMufWLJTEcRx7HwiwR7Z+iy2cRd?=
 =?us-ascii?Q?i3utQArjeHf9TOJvOznWEy+4s1Tuvx8PnMqCMXdwxUsqM5yhbc5ZXeAbjdAC?=
 =?us-ascii?Q?KUi9VM26UkOvHzxieY/l9cu65IFvaG63J711q/YL0yN9XXYcZbt5CZbxHWPI?=
 =?us-ascii?Q?aL/jnzwoup9fSgNSdA9n9utN1dVmFw+h2naRLXgfa5srPEYnvCqv0gYcWsa0?=
 =?us-ascii?Q?vbhGbO+8DvU+/1f35LiJZoZ/DSpjqnxEH9ifAzj7h/4MbiWn83VjgJViEstU?=
 =?us-ascii?Q?ZyA9UeFMe9rWwrhn7Mw9iiVRPwujVdGwzW21fitSzft8A4W8/7xD0rlIxgAh?=
 =?us-ascii?Q?VhGdIj9Ms0cKOHEw3wkfSrv/A8R7/tk3XM03qkqeGTOM9Ulq4hPTeUkKvsLh?=
 =?us-ascii?Q?BSPXY4HqPov25CqaGCM/Up5qnE0UM21GPTrhaFtb+PB+Z7wEs5aEkcxr5DLC?=
 =?us-ascii?Q?9XldoNpf2Cm8m1+GaFQMuQ+Mz+Fbyrj2Qdlp1lP6WvDoj9nkmsAe0JScD7ih?=
 =?us-ascii?Q?tmLYwDIv59kA2cEHGfVZWA2DQDPrBbqQFu5ljpACyfeifldmmFSmj2yYtwOF?=
 =?us-ascii?Q?WoO0qLOfkxZCb8TzHBw+YJ4JztkCC92IPHQduDlakg+yrP02R80AG8nM3+Tm?=
 =?us-ascii?Q?1ng60yP3PY3ssEr6iyIgn9NKpYE3HX+afC3sr9Gf8OwGDlmZbnvk8hSS4CXU?=
 =?us-ascii?Q?a2AZN/kLRy2zU1MLzgFyBDNt43WoP17KnfR9LJJduhASqd04c+m2zqjBnonG?=
 =?us-ascii?Q?CFx8ijl5eQ+L4zJMXRUNGF+0x1vEDufromLuhPEXvO0Q3G3sI+Znr2MGJMHD?=
 =?us-ascii?Q?05EAOJadN9gu2/5LNDk0mMPHam6jqLdLC7/ibkRzOj+OUcML5OzW4XrYo9jq?=
 =?us-ascii?Q?h5KlVUfW0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920e4e3f-9224-474a-3842-08de4d138b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:05:47.2405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SoKpaWYTQKYeGHa5awrJp2/HtinPu+FtdfvDWnoFIKc7gwHmrVCXTNACoJAC+LEShd9PvpVmJD/1i/ixPyos1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 05/13] drm: Allow driver-managed destruction of colorop o=
bjects
>=20
> Some drivers might want to embed struct drm_colorop inside driver-specifi=
c
> objects, similar to planes or CRTCs. In such cases, freeing only the drm_=
colorop
> is incorrect.
>=20
> Add a drm_colorop_funcs callback to allow drivers to provide a destroy ho=
ok that
> cleans up the full enclosing object. Make changes in helper functions to =
accept
> helper functions as argument. Pass NULL for now to retain current behavio=
r.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>  drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>  .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>  include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>  5 files changed, 66 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index a2de3bba8346..dfdb4fb4219f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>  					      amdgpu_dm_supported_degam_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane, NULL,
> +DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>=20
> 	amdgpu_dm_supported_shaper_tfs,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> NULL,
> +
> 	MAX_COLOR_LUT_ENTRIES,
>=20
> 	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane,
> LUT3D_SIZE,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL,
> +LUT3D_SIZE,
>=20
> 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>  					      amdgpu_dm_supported_blnd_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> +MAX_COLOR_LUT_ENTRIES,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c index
> 44eb823585d2..efe61bdd9b24 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list
> drm_colorop_lut3d_interpolation_list[] =3D
>  /* Init Helpers */
>=20
>  static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop
> *colorop,
> -				  struct drm_plane *plane, enum
> drm_colorop_type type,
> +				  struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				  enum drm_colorop_type type,
>  				  uint32_t flags)
>  {
>  	struct drm_mode_config *config =3D &dev->mode_config; @@ -109,6
> +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struc=
t
> drm_colorop *co
>  	colorop->type =3D type;
>  	colorop->plane =3D plane;
>  	colorop->next =3D NULL;
> +	colorop->funcs =3D funcs;
>=20
>  	list_add_tail(&colorop->head, &config->colorop_list);
>  	colorop->index =3D config->num_colorop++; @@ -203,6 +205,7 @@
> EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_in=
it enum
> values,
>   *                 created using BIT(curve_type) and combined with the O=
R '|'
>   *                 operator.
> @@ -210,7 +213,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop
> *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags)
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags)
>  {
>  	struct drm_prop_enum_list
> enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>  	int i, len;
> @@ -231,7 +235,7 @@ int drm_plane_colorop_curve_1d_init(struct drm_device
> *dev, struct drm_colorop *
>  		return -EINVAL;
>  	}
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_CURVE, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_CURVE, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -288,20 +292,23 @@ static int drm_colorop_create_data_prop(struct
> drm_device *dev, struct drm_color
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for new colorop
>   * @lut_size: LUT size supported by driver
>   * @interpolation: 1D LUT interpolation type
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -339,11 +346,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> drm_device *dev, struct drm_color
> EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>=20
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop
> *colorop,
> -				   struct drm_plane *plane, uint32_t flags)
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags)
>  {
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_CTM_3X4, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_CTM_3X4, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -363,16 +371,18 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags)
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_MULTIPLIER, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_MULTIPLIER, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -391,6 +401,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>=20
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
>  				 struct drm_plane *plane,
> +				 const struct drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags)
> @@ -398,7 +409,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device *d=
ev,
> struct drm_colorop *col
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_3D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_3D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 04af552b3648..d3d73d60727c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +NULL,
>  						  PLANE_DEGAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +39,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop=
_en
>  	prev_op =3D &colorop->base;
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, NULL=
,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		return ret;
> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
> 17,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base, plane,
> NULL,
> +17,
>=20
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  						   true);
>  		if (ret)
> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>  	}
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +NULL,
>  						  PLANE_GAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
> a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop=
.c
> index d03a1f2e9c41..9e9dd0494628 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_t=
fs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_t=
fs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> a3a32f9f918c..45d1b1d3faf9 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>  	struct drm_atomic_state *state;
>  };
>=20
> +/**
> + * struct drm_colorop_funcs - driver colorop control functions  */
> +struct drm_colorop_funcs {
> +	/**
> +	 * @destroy:
> +	 *
> +	 * Clean up colorop resources. This is called at driver unload time
> +	 * through drm_mode_config_cleanup()
> +	 */
> +	void (*destroy)(struct drm_colorop *colorop); };
> +
>  /**
>   * struct drm_colorop - DRM color operation control structure
>   *
> @@ -362,6 +375,8 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *next_property;
>=20
> +	/** @funcs: colorop control functions */
> +	const struct drm_colorop_funcs *funcs;
>  };
>=20
>  #define obj_to_colorop(x) container_of(x, struct drm_colorop, base) @@ -=
390,17
> +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);  vo=
id
> drm_colorop_cleanup(struct drm_colorop *colorop);
>=20
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop
> *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags);
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags);
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop
> *colorop,
> -				   struct drm_plane *plane, uint32_t flags);
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags);
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags);
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags);
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
> -				 struct drm_plane *plane,
> +				 struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags);
> --
> 2.25.1

