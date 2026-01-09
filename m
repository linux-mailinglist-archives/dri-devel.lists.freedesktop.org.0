Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA84D086C2
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6010E880;
	Fri,  9 Jan 2026 10:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwCj+Luk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E05510E880;
 Fri,  9 Jan 2026 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767953248; x=1799489248;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CFtPNGNnY8tA0Cnw6Lb44mCdVHM2LBMFtAeNo8jbNtg=;
 b=PwCj+LukfXDjJLjHskBAwk+vTbgGntqnoGfHbh7eMrEZQ9xBBpCGIT/K
 QBvtsqUDPkqGQsAP8C9wxz3jhelJvXbe5TPJFuDPCFa+NvEpzVv15s0uO
 RGbg0cBgvq1Bs+sFbW5bEeJwOpUoHUXC4xT4vdQmorTMUCD4G5KKQHEs9
 ZvaHKMdc+pZWue5dHMtMwzAQFYtKlITbpXxJYbpDIFcxwcb7y41ld56WN
 3YJPDmwCJO+Ec8f4/cz3GBiX1CwsjAGG05GYiqVlmFE85jMS18JoofMF7
 JCHM+H1SVJQmgV1Wzp0wTcTMWGfBNy6xInbq4TWKvL4CZUpzIh/kh+Wex A==;
X-CSE-ConnectionGUID: zsattqGMTg6lcUsXi1TBvg==
X-CSE-MsgGUID: s/pOdsrcTh+iuPK8v+y6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80445206"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="80445206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 02:07:28 -0800
X-CSE-ConnectionGUID: yPzObflzRcaXmRwi18D1aQ==
X-CSE-MsgGUID: gsWyttrfR7y/HlL+68U0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="226814404"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 02:07:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:07:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 02:07:26 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:07:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPrOjgUJ9MV7zSBRcCRlWZrTnvRx6XUxu/0CPEDMo5OjzNi+UE9ZCys/W+riJVgnAKmrRnTqI2QZ+8uEIiKl4k5V9LC3QLcimI/0eb22+5kqLDm1SWFHANbnUiV39Ii82KLBDZeIOszFt0Dc3hJ0WEwlLHFZFJ5QOBGHeOmfaF8IsrAQg6UhiQVEpceuF8q5VuV2uV4+aoUSc6Rqw/bfoSQS8B+bvn3CPGdFIPSJuFbv0sldRAmLeWZ1cGq7Ce/ja/Apgt/rj4R0ZILAJ/MUn95frxYVAYMzszoUgiQz5ffL/XCfyhKN6JwcfLdqUcXoJ7LkqEHrb2RtkYl0wMgtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFtPNGNnY8tA0Cnw6Lb44mCdVHM2LBMFtAeNo8jbNtg=;
 b=C6QAevK/X34Zfs7+FgbQQd1fGIiCkGx0Qt23qu4mhQY0dzkuUm42feZtWogtbLsT4yj+Jh6QOTH3aKrcl58lohLIWUPolxug9FuH+7OYoy7z4xkYQEhXOHK48TQS+EkoeEXa2j+CfA8D9dTT4hJIVX0v6HWC3bstzJc8GAIWwF9RZKpe6cL1hgtA8KFfnO0CBn+8KYWQzUP+fEH1Qqm/2KHWd1WqM0+WX7pt6GB8dzALIVc3kI0BnVBpB/lW1MDwHlOsHWrm2lozLf+Evu7v4QJ6XUzso+V2nx8YwTxaQ/mIAVTBQHOBtIdfqq9Hpnt+6BjmaKUCL5xvdSTO6L2PRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:07:23 +0000
Received: from LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308]) by LV3PR11MB8768.namprd11.prod.outlook.com
 ([fe80::154a:b33e:71c0:2308%6]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 10:07:22 +0000
From: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: RE: [PATCH] drm/i915/display: use port not transcoder for
 PORT_ALPM_CTL
Thread-Topic: [PATCH] drm/i915/display: use port not transcoder for
 PORT_ALPM_CTL
Thread-Index: AQHcgUTs8oE04XCfr0mYsL/5e+PlYbVJnBnQ
Date: Fri, 9 Jan 2026 10:07:22 +0000
Message-ID: <LV3PR11MB87680D29616F30F25B9D4074F582A@LV3PR11MB8768.namprd11.prod.outlook.com>
References: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
 <6dfa37a9c19089bda5efe1c43d1a40d88d53cf89@intel.com>
In-Reply-To: <6dfa37a9c19089bda5efe1c43d1a40d88d53cf89@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8768:EE_|SA1PR11MB8521:EE_
x-ms-office365-filtering-correlation-id: ce63850c-6d6d-4b7d-84f2-08de4f66e1ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OS9Ob0NKSWtkck5CK0lVYUNCUVExOTdSaXJROFJEaFdaNGxkMGx4N1dzR2ZE?=
 =?utf-8?B?cmYzazRENThHU3pTZnNaSDNPc0Z0V0Z4SUJyeklCMnBCVXhNOE9UbzEyRGZE?=
 =?utf-8?B?VElGNTZMK0g4K24xWWdST1ZBVm5TdUNENDNhMGw5dzJEcEk2ZFpGb3ZpTFd4?=
 =?utf-8?B?cmpRU05DdG9WeGZLbElSVnd6c1V5ZlduZlFDcThFTXE2Ulc4RG9YV0xiTTkv?=
 =?utf-8?B?bm1TdFpidDFQUmdXaUJQRDd3UFBycE1XT2hWeG5QbFA0VlhERldBeDZhb0d0?=
 =?utf-8?B?M09SbXFUNW1RREN5UnAwM0xtUzFnU3hkTTBZTlRES2RjNFJNUDVaMFIxbldj?=
 =?utf-8?B?cVRrTXdFUlM4Z3pldGJoSGpDQjhQOVhEbGFEVFBiMlovVmtlelNGbGhwMDgz?=
 =?utf-8?B?L0gyMDZsc0JmLzhqQ2FLMFhFR3pSay9EVmxVMUVFTnFkRGxibmV1WjIxWS9B?=
 =?utf-8?B?SDFEZXpoZzhUOTdNbGVZUEF1SWRXUXNFWUNkeHVzWWU1S29QeUZSL0V3Rnh3?=
 =?utf-8?B?d01CQ0o4VE5EdnlNUit6RGxmVmlIcFRSeW1nT04ra0sxc1dHdWVsVWdhNDF5?=
 =?utf-8?B?dHhZSGxZbDQ1eGw4aFVLeDhWYzY0REdYUjhsVUZRT3lXeHNEWlVTTVJQM0Rn?=
 =?utf-8?B?RTBwLzF4a1VaZ1ZXeTBaTFlZWmcwT3Raa3dNNVcreXRPeVNKYmhNVGtOSkw2?=
 =?utf-8?B?cTFKZnc3SkRKZGtJc0krR0UwV0VRRlJ3L1ZRT0QySFFSTFlTb1NwaUFBSGpw?=
 =?utf-8?B?cnBJSkRtUUNSZjhtUkcwYXg0Y1Fpanp2WXQyc1FBWVhDSmVMRnJ4YVBDdlJH?=
 =?utf-8?B?Ymh2K3VQU1VUZ3NjbUVIVlhyTDNpeEw4ZWVZdVhYaVBJaUVqWGM0d0wwNno4?=
 =?utf-8?B?cjM5QlN3WW1MVTJSSFRBaXVUTkdub3BDc3VpYysrS3dJKzQzZTZ3cWFLeEFM?=
 =?utf-8?B?UE95SGNlbjVtUHl3RGE2cDZEVEw5eFZQVEdheTBtYUxQTnBJdjVvVGtMd1hL?=
 =?utf-8?B?M3FIVDlBeDFQQzJDdU5NMkFrcmdDREdBMzI0UlJ1eHdFYVNmdGErNjZGaEhv?=
 =?utf-8?B?V1NpeU9EMXBqdUxiZzVDM1djemFxWVM3R04za1RuQXloU3ZtMDFWZEM3ZlFE?=
 =?utf-8?B?RlFlTnR0SldheHRDditwMEJxZXF0elJlMHBHcC9JeFF5UDF0SVV5Mmx0YURz?=
 =?utf-8?B?YzdHSnJZMGFIKzhVelVwbUhpQzVOb1RwQzNlNUNsRjFLNFhOQ3BqMGlZcWJr?=
 =?utf-8?B?UXJuR0FGNW1kNkJta1hRZUNUWkVRMWhQQjZnSXpZQnlaL2VUOXZtNC95dU5a?=
 =?utf-8?B?Qng2Y0pORUFSbmdmb1kwTzhPZXNTWGVrN0FJeWlSWHJTQ1pXcnRtMk42ek5o?=
 =?utf-8?B?RXFna1MvM0xzd3czSlQ5T05ucXdRSmhzcTlXMzZsdUs4L3lZNjhvdVlPdXNJ?=
 =?utf-8?B?Z21qbTBjbGFpUlUvRXByQkc4d2FNTGdpTnhiK2dkdEpCaHVDR3A5R3U2b1Vu?=
 =?utf-8?B?cjdlTWlrWVdSUDF6TmZuejJRQlFiRTdscENsOCtFWFU4aGQzaG5POFBOZzFS?=
 =?utf-8?B?TFdjZzVVMmxDWlJFS1c4b0hZS2pKYnRJaTVZTjBVOWRaZk1sQjlyWlg4SGFO?=
 =?utf-8?B?M3J6aGZZNitSRWRCOUVyRHV1VEttNGRIM2Q0UWNZdFFJRDZ5UlFjR0RRNWN5?=
 =?utf-8?B?aURpS0l1Vmo4a1BxU3Q4YklLdmRMRlNpTmVGaUk4U0t6bG9OS1dGbFlOWGg0?=
 =?utf-8?B?SmExMzg3M2NvUVZZcVRRWHdsTnhSdkVMdUYweXlDNXVyb3l0U2FLWW53UU9a?=
 =?utf-8?B?QS9WejhHeS9EQmUwdmRYcE94U1k2NkFDVkJ1dG5zaGswMVVqcm42bHlyREZq?=
 =?utf-8?B?ekxKeFZIMDROMnBsWFFMbVl3c1JGOUZBem1COElmMTJTQnlicGwvNmhncmhM?=
 =?utf-8?B?NGFXNzRKZGpLL2grK0t0dXluRXk5Ujh1NDQ3cHhLOWVvYWZHSk4xeWlxL3Fh?=
 =?utf-8?B?NWdiMTF0eXFuREtVNUxVb2haNXd6VU41MlFkUkI4aWdnMTdxN0J6bXNXZWQy?=
 =?utf-8?Q?YvKNdm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8768.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEpqbXpjNEZ4cWREVm5hS3R1WjJIK2lSTGpIU0ExOXhmV3V2TUxCaElFbzJn?=
 =?utf-8?B?VlN3RDBvOGJma2NoMFRkMEpKU0NKVGdyNGRDRk5hcTREWFpPVG1iVUx1b3Br?=
 =?utf-8?B?NXQ5MU9mTnNpTWpDeitTem9VZmpYVzhyTnVtRVozQTl6bWt4RGx2RkE0OGg5?=
 =?utf-8?B?ZlU3ek84RCtVZ1ovUXRlL1A2ZmNhVC9PcUpuTGtFOE9XOExtYkc4UC9UR3k3?=
 =?utf-8?B?clQvUXhPenBFUEVBUmxSamlhRkZ5bkNMZnVGdW5xNUEzTmVjN1p2aE1LZzll?=
 =?utf-8?B?TWkzOUx2KzRwbzFtU1JYMmdZOTBOMXIrMEx1WTg3OHJaQzZYcmZ0SHlXRzV0?=
 =?utf-8?B?VGNJM2JCWTA1dE16V29iRGlpSkhrYTIzQlRPRVFCWnEzdjN4b05TQUl1U0Rl?=
 =?utf-8?B?YlVMZWRVeDAyQzZHNUo0UG1adC94dGVFd1NSa2lacnZ1Y2lsc3NOZktCZDBZ?=
 =?utf-8?B?RVA3Tm9hVFZDWTFYMlJBZ2FxZVJNQ2ZlVEt4OFNSUkZEYmpTYnFZVGFaeWVT?=
 =?utf-8?B?Qktrd1d6MGV2MWQwdWVyWnJQa0VFSitzdVNqWHNyWmZEVUJ6M2pJVVM2YTBp?=
 =?utf-8?B?VUpjQmRVbFpBVVNtUGRiZWM2R0VZaXBlSExYdmI4bGZhZy8zV2gwQkpsY3JU?=
 =?utf-8?B?MTZaR21wWlgwNFkzV0dSNmIwd1FrVXREZG5ML2M2eU1MYWNuV3FYTlByb3Yr?=
 =?utf-8?B?Q2dPVHg0cnp1WXBDQzNob0ttYW9CR3g0NytsUnpud21kcURzSXpLMkplOHZG?=
 =?utf-8?B?b3FxdEo5aHltY2pZOFlINFFsOExxN1VMa0RkMVRaWDMzU0JDSlZiK2cvWXFX?=
 =?utf-8?B?WktlL3N1SjFGa0RYZDBqc1A0WlBzSlk4MDJnVGo4SWJxNmN1K2phQW45cUYy?=
 =?utf-8?B?ek5ML2hGVmVOeVkyaytLa1M3ZUQ1MGdJOG5aRW9Xb0JzV1QvRVlsQkc2MHFM?=
 =?utf-8?B?alNGQjRkTENVM3pvbDBjMnlEcUMxSDJMSHJ6SGlHN29qTDBnd0o2bnkvNFYy?=
 =?utf-8?B?ZjdKLzVEcE9XMjdGYXpNaWdsSnZCVWY5T1FnUi9Oa1lhUlRQNkYra2Eva3Qr?=
 =?utf-8?B?RTRGeUl4QWJWWlR4aGZzeXZxakxqUzd3S05qSXBieThpM0VuclJKUzlZelRG?=
 =?utf-8?B?WkFsYXJ2VzBkekYxTTl4bGczdEtITzhTU3AwRm9mK0dsWFh4QUx3TytKai9n?=
 =?utf-8?B?VWVCMW02SVN2bzFrWDUvWGFQb2NDc2xRT0xOYjE5QUtaZUQ3eEc2SGdJZlRo?=
 =?utf-8?B?bmVVQlY2ZENrVVY1Z283Yy9SaW5yd0pqcDZZNkpBblNzMnVEQkJMWGE4aG9F?=
 =?utf-8?B?UkhzcThQeHpucnF3dnN1ZzhVZTVKSE9uTStSbWp6eDlERENFb3V3U3RnaU8v?=
 =?utf-8?B?QnQyeCtSNE5uN1R4WWVHS0xkZFVDOFJSREVLRm9vbG5ZMWx3Z3R5Wmh6YlJ6?=
 =?utf-8?B?TWJrTzdEVDVpVzQ0MHdrcDVXNmwvcXZDM0JhTmppblAyR2tEWWU3NWtRSlpB?=
 =?utf-8?B?REMzY2JrbnV6STlGVTZPVG1jZ3JaMEE2NThjR3JpdGNlYlZWSlV4SEl3Qlpu?=
 =?utf-8?B?SXlpdzRoZlllN3VhdkVqVllwWFNSODJiQ2huQ3FOK2RoRDVrNytXRG93enlk?=
 =?utf-8?B?Q0JxUmwyZVhaM0NQR3BtNklsUTZDMmtOL1NoWExGYThTVDgrb0s5ZVlYcW5v?=
 =?utf-8?B?SEhxejRFWXFFZzBvQlFFNHFqT3ZPVGpWckVmS3lySlRrWGZpeVFFWGFiRE5V?=
 =?utf-8?B?M1FaRjhqZGk3cmJZNXNaN2hHYlZWaENoUXd0WDVDdkpneW1EZUdub0FTZTZq?=
 =?utf-8?B?QW1sY2piUE5Db0lKSnRtbnFNUy9MRjUrWnlsemV4akdSME1QR2tkNUhRZ20x?=
 =?utf-8?B?VXN2dGljazBiSGJXRUlNenBYMmJyakFaZGd0ZG5QRjFwVHdpejErNCs2Z2kx?=
 =?utf-8?B?SE5sNmlvUkFSSUY4bUxRRTJSdU1JbDZKQU9QWHpWdjJjNHc1NGdaOXB1eG1S?=
 =?utf-8?B?MXlJbzlXaVA0WEhGZDVrc0wwd09VZklvdndFTXJqQzZiUEpYVDJady81UFNL?=
 =?utf-8?B?TlRkU05tSzZWRFJmc0RSRjJhM3BEUXNFUUR1ZCtXV1pORlVoV0tCY01qTnJi?=
 =?utf-8?B?M2dnaVZlUjRPL2dKQXk3aWJmM0REMEFURnA1K3k5b21CZTk3ZmZzdVdzYm9P?=
 =?utf-8?B?eVd1aGU3cVAwanNrd3hvNWU3UTY0QUc0K01RdDRuKy9QaVJvWXgzQm9mU2RY?=
 =?utf-8?B?Q3ArdTEwYmNrdmx4UU1UQUtoVldJc2IyU3Q2WS9lUXIxbGpoRVdUdmJvRGNn?=
 =?utf-8?B?dUtSWkVTNTM3TDZ1aGtrYWxTcFU1b2t0RldXMzNxbDRlYmJOK3ZhMG5hejVG?=
 =?utf-8?Q?E5i9ChH8ZHleTvTTC0EqFtPnPaiWrfVaWfx5QhvwdUPsK?=
x-ms-exchange-antispam-messagedata-1: E4FNMi7/WiACk3kAnlEX58RTzYXWwLdOuzk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce63850c-6d6d-4b7d-84f2-08de4f66e1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 10:07:22.8562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+qu0enL3inU31slbXNHytHXyMHKekkyLIMZrfETm6FTUq8pYEWVloO7Ja/8zWYx4M22Dz0/UZ5rSyNEgqRUGXETn6HE8YFQP5132sFu+NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

T24gRnJpLCAwOSBKYW4gMjAyNiwgSmFuaSBOaWt1bGEgd3JvdGU6DQoNCj4gR29vZCBjYXRjaCEN
Cj4gDQo+IEZvciBmdXR1cmUgcmVmZXJlbmNlLCBwbGVhc2UgYWxzbyBkbyAnZ2l0IGJsYW1lJyBv
biB0aGUgc291cmNlIHRvIGZpbmQgDQo+IG91dCB3aGljaCBjb21taXQgaW50cm9kdWNlZCB0aGUg
ZXJyb3IsIGFuZCBhZGQgYSBwcm9wZXIgRml4ZXM6IHRhZy4gVGhpcyANCj4gd2F5IHdlIGtub3cg
dGhlIGtlcm5lbHMgdGhhdCBhcmUgYWZmZWN0ZWQuDQoNCkhpIEphbmksDQoNClRoYW5rIHlvdSBm
b3IgdGhlIHJldmlldyBhbmQgZm9yIGZpbmRpbmcgdGhlIEZpeGVzIHRhZy4gSSdsbCByZW1lbWJl
ciB0byANCnVzZSBnaXQgYmxhbWUgYW5kIGRpbSBmaXhlcyBmb3IgZnV0dXJlIHBhdGNoZXMuDQoN
ClRoYW5rcywNCkthdXNobGVuZHJhDQo=
