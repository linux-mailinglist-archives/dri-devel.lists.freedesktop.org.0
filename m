Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIVyMggxnmlPUAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:15:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4AB18E1E4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2910E356;
	Tue, 24 Feb 2026 23:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzrhWXW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C4710E356
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 23:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771974915; x=1803510915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b7cdZgOG6h8kb3GGkd+tprN58xY7zuI85iYaEgmJqIs=;
 b=OzrhWXW7A9SZTxerBbLYxBugfSZJFKj+f+32kV0BQ5EJnwCoTSlq/IC3
 za3pH1Xd5WZBAwNtPpvZgTstXVh+Hi7hXmCYZXbpkP6A5R+Mug8wKO5XT
 YY84QCg114KX0YSt2Q3wGkm3Ovms1mxDKjnwiiVkUhVB19CoAhligW2wj
 L0eg2/K66WZ0iNV0VYv4LxhqLmRvazZzlxPhBrsuFibsfQGWSdMUb/oxK
 eytO36ne/luRrkMQQg56Oy7Vqsg91wJMgqgyssq3juMwobM7BdeIjUyQa
 n1qOCR++R+ZTM7Q2AKjo7sUz+R767CdlP5YTJorlNRd7WT6cUNlSrNm07 A==;
X-CSE-ConnectionGUID: sI51Fae6QpG1zgGSCtlutQ==
X-CSE-MsgGUID: QdSFPPkQSeObSEEDm2ZmIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83629540"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83629540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:15:15 -0800
X-CSE-ConnectionGUID: WX2zJC52R8izNNFMAoDXCg==
X-CSE-MsgGUID: pZfSBgaeQ9+8uUtRgUXeMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="216194315"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:15:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:15:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 15:15:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:15:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPq5WGQKrZX78BCPyQXUa73/ks/mchr8UuUiViUs4DLPcnMsynp2sKLoMpAgDzbXanOlSxdSY5dIEJ+nRe0zr0HfXgGUZRY1eHQRQNRbIJkCvBKvjO4TMsjgty/oXeU9bEb4rTLUxH3w1Q6TYw4lMlsfL9NwuSuTWWcYxCwOPSdb2yIoyIQhIsLZyHoDxME2P10Zj/XgW4m78jp0kr5d7BudiLel1QB/9JB6avBf+CO9nPzxsxqp8e0iTOC4BmbJqooHFJJICK3WRVmIunPWrffI/3vTnlZ8q6PBrcCZrxrV9rmwm1Supeml52PypmkBa3C9veRYICEKDHWUSxz27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqJcFMh7o9Bu3ab+395tBHmOIUzjEIAfLnuMIsu1LKE=;
 b=fOUayKFYLBmtkqw3F6mmAq76+f53iGRefK1RSZwmg5hLyBLSD9gex167rvDDgvr6DYBIuslPOpE0B4SqjWJtoQvJjlbF4EJh2PQU67mhRq9tF6XW8whhO6M986DbktPKahcVFBdzPL1KtRfCpu547xqYjeRNcb9ChCQBk9EyZQn5+rgg7IvUhshToRYfC4zCc1BYTtQYq90ErNdAoLp+nMVUMntEuyQtaTihpuocT6A91MAhNf65UYbLwb/zoKkOJnQhvtDzTZe07nV/57P8JCdYh1hioLXyAT8zFd/TyhnBZIVU4+CShJowpCiXzFsCwb+68SPyxrSJWamxwCf8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:15:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 23:15:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v2] drm/pagemap_util: Ensure proper cache lock management
 on free
Thread-Topic: [PATCH v2] drm/pagemap_util: Ensure proper cache lock management
 on free
Thread-Index: AQHcpaUOV5sGLCiU4kChM5HHyYbwK7WSeowAgAAAauA=
Date: Tue, 24 Feb 2026 23:15:09 +0000
Message-ID: <CH0PR11MB5444626B957BE2E7B5F66D9CE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260224154832.7249-2-jonathan.cavitt@intel.com>
 <aZ4wJle/SaHCpj5A@lstrano-desk.jf.intel.com>
In-Reply-To: <aZ4wJle/SaHCpj5A@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7135:EE_
x-ms-office365-filtering-correlation-id: b476108b-be34-40e5-2563-08de73fa8e36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IVThtlU4IMdyaiBjkkCiJUeu5oqXk7sl1c3cP6ZsK+TljM3Fx9yZvshWlZIg?=
 =?us-ascii?Q?PwTJQgKc9r0JpUevGTQrQOttTwlhNhzQBgNyRCUK58sGvyC8RsKVlON+jyLj?=
 =?us-ascii?Q?H2IXBVsa+monPVUINBsoc2TIzYv1UX/J6twcM7okAhM7Emx9tjYlWpAq9W9l?=
 =?us-ascii?Q?C1EVNH/yPdhQvdHqKTi1rAp+Q+QyRcH5CClL2L5wxg4BWH2a7BGLBpCi74XS?=
 =?us-ascii?Q?q6ISx42Jbe0oGDbBMzov0xY+GfY2xSl/hC0Fxb5X5RKFy+ItsEx42RlPTM7d?=
 =?us-ascii?Q?6ASD5N0A73njLScKSA2E91cffbEzodqqWpbqZKnGKkl94MYBoVuDrPC6RO/q?=
 =?us-ascii?Q?6lteX2wCqpZwZDorABpLobVlo3d10gtXaPspsNNipz3jaNPIuowp51aJUqye?=
 =?us-ascii?Q?E/+Rl/jtSZWURzruUeZpLved58k6TlyibPJ3kUAHBa3b2+688FmWP+sSGEd9?=
 =?us-ascii?Q?4pGALp39xUrXnBySW/zVhEMeJGIYtOAZXHfzXHzVSajtA5gncQ9DeL6x087P?=
 =?us-ascii?Q?Kdoz5EBXY0KhD1NJSNhBoqH6FRKagN9bHvd6ysXLpeiA2a+NL7DwkBkZOSx4?=
 =?us-ascii?Q?yKATypzoYkDfw7I8H6gw7XZnFIwyJl/K5sfBTIwZtpbT4ua/lUzTgbcCncI9?=
 =?us-ascii?Q?98MD6s/nEsksQjcaQzxGYGkXh7+jryxzBfB8EPGqjGEhSr6FxH92n+ynC/np?=
 =?us-ascii?Q?GUXgiEOYt5A/dmqhqkM+7DK1g+R3WXuCVVjgtmF2gJlpRx7u06FZLh8PsPNh?=
 =?us-ascii?Q?0jkQuxJI07Fnimjk8yg1IwwuLObCiqlsT5MBnnjIni01yb5xjYMD51c+p6Fh?=
 =?us-ascii?Q?26t/iBdOGqC8VmKolr3r/0nuelrSNiF8td61weYriENtyh7l1CJ6RLTkZzN4?=
 =?us-ascii?Q?M2WnkEupPEZOZNtPdyR/sIVtDzjIZBITxXc5QFoC4gE9pJ942wjQt7zIPSwU?=
 =?us-ascii?Q?vwtS/wh7qfrLYBtIwz+2O8RiDflZVPHySh16R56TcmunpDZY7zNqXOmO8lD0?=
 =?us-ascii?Q?rQj31vgF97esJfpexLLBp6bzqQARhI4dxZUIzJ3fLaPLBsuDSsw8K6AJ4GLz?=
 =?us-ascii?Q?xdO7iokx15FHDoaBvWKYmy1TlL8KES6zinCpmvhPoBfrO2NN+0IaX83PE7eX?=
 =?us-ascii?Q?JyJs6Ml9EWqB20GpDIU7zCRlJA7PI3qinEunfgW1NAG9B/fBufcqOhPMrQ2b?=
 =?us-ascii?Q?w01j3lofd/ZiqDvOj25tqGC8Sy7dAge9SKDVU6JzO9WWjoFnSpxHES8MRvcY?=
 =?us-ascii?Q?VzIjR4qZO8lqR8C5iIIAQy7vE68MV+hxEyaRvwiGw1CP4Fr3ysy0NGn72Ndd?=
 =?us-ascii?Q?6V4fkKI+dC93l8gwXT9oXfQba9cARmbgBa1PJ34DJWyPNYku686uyp0NPYUV?=
 =?us-ascii?Q?Ie/2b9JEPQpGPV/FWCvBHyjgZuKmTRBu8IdVavntR3xKnwk+DYsE34aaKN7K?=
 =?us-ascii?Q?vGGo6ZM7I/vU3UOtvkbEpaszt7v8fWMKgB7m2CEMGRePsRqjAtjRF4GZPjiG?=
 =?us-ascii?Q?0s7dry6stO9Q++rqa6PuUZ2MzBSx7UL+VmsFcNmARgs6M6jlhikzCc2qPBel?=
 =?us-ascii?Q?7/H0ewkGc5e/+My+cbPELAldz+HrbSzy17aM8ooqsc9BEJeokhTyqnOvFTAo?=
 =?us-ascii?Q?s3fGx+RZzOZSCrXmETva4xM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZBcrT9DF7q9oK/zjCVjnoylArDZxTXfaLeM4tGAYPahrHt17E28+b4DNyb+K?=
 =?us-ascii?Q?ZynzOAWVboCgde2INdyOAD4WIfJ63da+Kzw+0Tc3MM2ewdzV0zNJ2yS4BLry?=
 =?us-ascii?Q?j6OM45lZdMfLlNBzT3XQtIJO0ussH5E6kgiVgdOGIiH3KYkKrKBhXlnVVadl?=
 =?us-ascii?Q?1iRD0GGJ9KD8De6pH4zqvdh8MeU4Xuh6GtheT4CBA/U4WltXdmMFs8503I4H?=
 =?us-ascii?Q?K9KIFkBosa/S5ZLzZXSPjMhd3sVuPaVhi6PSMoImGq79h84vcDWEQZed9vBt?=
 =?us-ascii?Q?gN+XYowC7QHoAk82nvWM6McOMTQOZ4+aR/VRiX3O2vL66EgUpH1Btvt0yLSJ?=
 =?us-ascii?Q?DgfVibtrAWq7v9Fxkhcjozte0OLaw+TPXPH6SfNrJqv18zPZ8i8c8Ahdf+Dr?=
 =?us-ascii?Q?EcTL6CTY66EqKBZagIF14K8fOM/E66sjV+7iZfZLcxLn8przDEUSBbUTs1DZ?=
 =?us-ascii?Q?zTjByqk2+f87cP95Yk6deOgXzTHkwkrImPj+0PF1Y900leLV2ystDOCf7MEp?=
 =?us-ascii?Q?Vsj95zAzqmwKlDXa5nPRd1nvedelRzZ2JmVMCeCVRHpSIFYu/XTi3GN/pGbp?=
 =?us-ascii?Q?bOVoUHSEkK7ltXLLtSEXCvHf81BRHEVxFfa59EimQVsP7x3ulemS7zEHcQmu?=
 =?us-ascii?Q?O5H7orX00aYWvX3nPfZ8eteYLaIvRjY5UXvRenopkApwZ2IwJPcKa/Q1zfeR?=
 =?us-ascii?Q?Fwib6bNbwqd2VsIdTx1I4UT447de8n/Z8E4ePAsrw2waC+VPjyIs55lxyRG1?=
 =?us-ascii?Q?94PRIDD4dLqZSdlRL85indmb4JtseRS5JQWLBQRUTOWN5ySiadv43vv3/vng?=
 =?us-ascii?Q?wQcOrkjgolYMFnIG0OtCh1n2Zd3NMYiYPV6DaoHE8LJr0a+rBIn/0je7TXAx?=
 =?us-ascii?Q?D4Q/yI9zcBgsIIN8q1b1qHfNX7rbqV0DQNgHL7C/3mZKHy1qceJzuxsbqmDZ?=
 =?us-ascii?Q?fY40MFUmtKlUIrz/RvT15OiQzazH3SAh7GV9Y3vlynBQWlr7zShPFrENuvQI?=
 =?us-ascii?Q?Hm3WZxqgNpoRsOZwCgvwSNtFsKaWD27aGL+mY1ZKsR8JH6jjEeGY7Es1V3C2?=
 =?us-ascii?Q?gP2dB6ZYAuYrcuoI9V2CixqjrGnMo5IyEF5bn2+PrRt6Tn3D+WEhVUo8e3cY?=
 =?us-ascii?Q?bDOkJ0P+7f8hZmuPv3gJlVtb2g10Ahh9abQEbP6BZkzPAkXdt6FoqxckLLkE?=
 =?us-ascii?Q?/5Uz9Qr3k2v8HT/kp94ByYkWAV5hxJU39b/LnqUiumgZYHDcbOuQVZ30Ok1l?=
 =?us-ascii?Q?OwCghy6K21eB/2qyF5wyzSa0EAMPr2x0RtQenNlbbZ+3hh7w+eGwhYphAv/Z?=
 =?us-ascii?Q?Pns+X+CPfnO8KeCx8J6EVN41b9vsKrxgfuWcYeLNn5qW5HCK8E6HRKt03+e/?=
 =?us-ascii?Q?hAIfXBCNrRm8TMKbVLgVlz/dUraaq1yvffQgwH57209LcJWuCenRdTsblR5U?=
 =?us-ascii?Q?FnuTF+Ji2C3Wypogld9APcxnEoty7KOktwr1/tWJqJb9toVAsVMHeHRRWjKT?=
 =?us-ascii?Q?W3FpdR2/3ZwvB0DsUvS5ch8gXuUKWkayL/RGc4uo4lWecRPqDIKUlWYeqokQ?=
 =?us-ascii?Q?ADa0wB1YRaco1O5a53YlU2NqUhe+I01VqEHl3AJSsAuRBsRwgAiPV9Rt7Azn?=
 =?us-ascii?Q?3QmTaCg9+7wMxeXUpxv9kjuINIremINw5bijDIdvW4ZphUMasn7nQb3aejE4?=
 =?us-ascii?Q?fAlFZl74JJELCx1wZWaG64nisPbL8+z+TyeE4zlHpUQJsC/d2PBdFQ0STxH0?=
 =?us-ascii?Q?YM+7k0fY1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b476108b-be34-40e5-2563-08de73fa8e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 23:15:09.7847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/efDwqAVmgEjtzVonkVDBXT7kluDAZwZ5HEnZvPZz75pCIc5yJeMG6h9NEhTAlljJiKZZ0s1b5ca+Dh9qjufHGgbNeMVRHsOi4168Zdswk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:saurabhg.gupta@intel.com,m:alex.zuo@intel.com,m:thomas.hellstrom@linux.intel.com,m:maarten.lankhorst@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1F4AB18E1E4
X-Rspamd-Action: no action

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, February 24, 2026 3:12 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.=
com>; Zuo, Alex <alex.zuo@intel.com>; thomas.hellstrom@linux.intel.com; maa=
rten.lankhorst@linux.intel.com
Subject: Re: [PATCH v2] drm/pagemap_util: Ensure proper cache lock manageme=
nt on free
>=20
> On Tue, Feb 24, 2026 at 03:48:33PM +0000, Jonathan Cavitt wrote:
> > Static analysis issue:
> >=20
> > Though probably unnecessary given the cache is being freed at this step=
,
> > for the sake of consistency, ensure that the cache lock is always
> > unlocked after drm_pagemap_cache_fini.
> >=20
> > v2:
> > - Use requested code flow (Maarten)
> >=20
> > Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinke=
r")
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap_util.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_p=
agemap_util.c
> > index 14ddb948a32e..66203a19f8f6 100644
> > --- a/drivers/gpu/drm/drm_pagemap_util.c
> > +++ b/drivers/gpu/drm/drm_pagemap_util.c
> > @@ -65,18 +65,13 @@ static void drm_pagemap_cache_fini(void *arg)
> >  	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
> >  	spin_lock(&cache->lock);
> >  	dpagemap =3D cache->dpagemap;
> > -	if (!dpagemap) {
> > -		spin_unlock(&cache->lock);
> > -		goto out;
> > -	}
> > +	if (dpagemap && !drm_pagemap_shrinker_cancel(dpagemap))
> > +		dpagemap =3D NULL;
> > +	spin_unlock(&cache->lock);
> > =20
> > -	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> > -		cache->dpagemap =3D NULL;
> > -		spin_unlock(&cache->lock);
> > +	if (dpagemap)
> >  		drm_pagemap_destroy(dpagemap, false);
>=20
> The logic is different here as 'cache->dpagemap' never gets set to NULL
> under cache->lock when drm_pagemap_shrinker_cancel returns true.

I forgot to add this back in as a part of the v2 request, although in this =
case,
cache->dpagemap =3D NULL can just be assigned as such without checking the
return of drm_pagemap_shrinker_cancel.
I'll fix this for V3 and add the intel-xe list at that time.  Thank you.

-Jonathan Cavitt

>=20
> Also be sure to include intel-xe list for CI too.
>=20
> Matt
>=20
> > -	}
> > =20
> > -out:
> >  	mutex_destroy(&cache->lookup_mutex);
> >  	kfree(cache);
> >  }
> > --=20
> > 2.43.0
> >=20
>=20
