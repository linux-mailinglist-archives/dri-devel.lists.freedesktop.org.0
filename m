Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE42B94877
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274D10E569;
	Tue, 23 Sep 2025 06:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ym+VI7q4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C19110E569;
 Tue, 23 Sep 2025 06:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758608209; x=1790144209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5iODTsWa2qbLTWDhM1DUTa5gBRUjZH+sN9Pfw6SQ/dM=;
 b=Ym+VI7q4Rvvr3rR1HqedxNybotujTRuBsYcT7VqV88fkDTtKZhFxPo06
 zrOsRpLvLzY+kEuWMlMQidOy8Pwea2tPb3XqyPIkDXQ+KhP1zk3+rzKzA
 PhVy4hmR/65kFkYN+E8+fSQQowKAk1RsocVVLPne6M+1efIUTeyPSmEBr
 4w5+1Kme7Jzdgp/fZrGCvzVNeWAiAuySvXSPfkx9SdbLHQPz/jczM7MrE
 UkVO5ZhnzyOnh3FDuYfqTGwOe6OMlEyzo4BqxirvoMBRwLfpOCqRDPnHx
 teUYsGXey7uFfjRbe7jZrjANeBhOaJH5ujfsyfok4F03kxpq+kZ1MG/El w==;
X-CSE-ConnectionGUID: kjDSu36yQAqS/KQjCDnn2w==
X-CSE-MsgGUID: R83THyLuQU+WdAXx1fpuFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60796579"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60796579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:16:48 -0700
X-CSE-ConnectionGUID: M9fIrzfPQP+yzWw4ORQK8g==
X-CSE-MsgGUID: UCWRY+yaSM+bCO6eDEIvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="177053955"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:16:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:16:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 23:16:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoI0g5bux+DXQqnz9iYJ+pE0A4aKbr536OoJlANkLUiQdVbxN4n7IcZn/eGRjCQntCAZfOnc+eCXHtMhWujaNGp7RrdZ/H2k3LO1LkcVFgiFNRF01bXy+xbEfSy+tgNkodWr2NUA1pX2+atJoWiliY2CmYwxlSH8Xi8V6qyxhWAncdgIQKtOmg2uBySwIKQPEN5jPf1X7Lvc/e5DC+NFWZvxtuFsfS4WStK0cGhoQj1p/R82YiK0jbdSeCZ23NoOGtJT7s/hWoSLaqptzfcZJarue+wTGcjCn06hRUGEi83ezby401MtZZVLAKlp7a9Uud+RDdyCsbv0WN3w3TFwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iODTsWa2qbLTWDhM1DUTa5gBRUjZH+sN9Pfw6SQ/dM=;
 b=q2SfnZIjdrPSd7U61hlD4wj9sxO073Vpm2ImqzTlR6/tFJb+BOJY5GA4RVmpIYXRWd5zOOW1unRkTfQU0sdkpdqOSLJvKWF9FVAeTXQSQgMgCykZVTkI2/LNxBn1dns1qiWGY9geC1IfMmM4/co6Uye06HX5ezOWwDoxZMvfJxJXipbSUieVFcFJnvuzU0w7XFET5lG8ETrQi0H91nc7y3YFNiK5RmS9/9S61ZDLEtWWL3T/r5Plbt2D/tegWTI4JAK+BVg/i1I87Nx+DXg0KrfmAX0oYxIYbv7PePHqi8RsIYENljNWgzOtzj8/ZByK4lcJrACt1KeNAlWr6g9ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 06:01:34 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:01:34 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08IAEQCiAgACVwZA=
Date: Tue, 23 Sep 2025 06:01:34 +0000
Message-ID: <IA0PR11MB7185067FA8CE8A95419D06F5F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
In-Reply-To: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB6853:EE_
x-ms-office365-filtering-correlation-id: ced5488c-fb5f-4106-7428-08ddfa66a6a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CstptbxbLxqyHl8B+oOzjrWEA0p8E/H1yWdF0Toq0kDV+9n4Mphse6JKHO?=
 =?iso-8859-1?Q?6NvcUKu7pokIVb8VDY0SxoSLs2RAyITkc9CK1yvD13z2INwtqR9MbSRW4U?=
 =?iso-8859-1?Q?fxuUjcgjDCdYXUixJvr52KlFDDEXuMTKTf6vRJNPVbSd1FKujRRETMX9z7?=
 =?iso-8859-1?Q?XU5+HY14kp746ubYjIhkqC+K6vpfAoYOUUTRv4pIWXYTZaM4Yx8h+f+Gxn?=
 =?iso-8859-1?Q?ltx3W0NJZtFCKbhXvM/c9QTZ/ImgfR7//EkdN1BMzvlJCV6gYUSspOw14l?=
 =?iso-8859-1?Q?/iFK7uK2utNoYdtcI+fIHlCj6AatoqXUJD62HWt+QqpONtteh1Osi2HNZ0?=
 =?iso-8859-1?Q?Mib6YfBUBtpFNU4IJ6C4DL7tjscaQigAbXAVf9UaaGA06Y2aQ9QKnItMQW?=
 =?iso-8859-1?Q?CT24KZ/vOTbWxxRDzqEH3f6TWBUBmFsDZYgBnTIW9OsJdegpmyJllf34Z1?=
 =?iso-8859-1?Q?G6n4l/RXa0nYIzNHouk9mA+9gYzaGEzF2YX4730UVEuX7057iX87Clkhe7?=
 =?iso-8859-1?Q?h95DiTvfhpukJ0WPYZNPLSBh6tmnqBYhB0cJN01DEAnPTibF1asOQJa30R?=
 =?iso-8859-1?Q?N1RDm47RI5h7L3a37/SZFj3Z/GhA1GJle0zV+aMGSZ+AkqelIcIH7pMLAw?=
 =?iso-8859-1?Q?Bqv/PQx+1NncPruea5kIRWbCLN4z2jhdoh0o3eMCZKmJ5GGLJoVl+pMUKT?=
 =?iso-8859-1?Q?5Ntif2gFHQ9ksBQuiTtCULFRBhHcDlwbKpVvRWatbUyPonhIQKOVFMYB/p?=
 =?iso-8859-1?Q?x5Wp2Eft7Q9eodBOl1DA1PUPB5z8xPl9dy+zMx5AjRdiYfUsbic997UgtD?=
 =?iso-8859-1?Q?7nx4n4tb5uiAoWfqSv1dUWw1bkDm7j+o8JtxKLKAJ1gMLvae7mJ9lTdYOo?=
 =?iso-8859-1?Q?rIiDItJ6OzKEbbFJoSHDctwIHT850jnKr7aYV8tyd1HiLhxucApXl/sZgF?=
 =?iso-8859-1?Q?DLLxTeY01Tn3h36A9af9lIHVw3/IHQgcpr8NC9ImjGc+mVu+1CfRQlbUDh?=
 =?iso-8859-1?Q?FVkqEHhepriyDVIpsv8UylHkz65gWSgE8iZUkQTBCu2gYoZ+NHHGgyfuVM?=
 =?iso-8859-1?Q?fQTlecuP9LXXgYiXJyrJRg0G3vAQrgiv3P/Gg/F+tMfrMXyd+OPDZy4JZd?=
 =?iso-8859-1?Q?Qjm8uUAh+nEmMWZ9Cz2tE0d0S2HIpzbkZT6PhiFZjckZMFwVBzoKyDATsD?=
 =?iso-8859-1?Q?2l+K11XyoG0hJoL2iuZZbyXHQh477Uzz364aGQFJaj8FWrPjko90f7JEOM?=
 =?iso-8859-1?Q?eNV0Oz6lCMhJsp+vYRd86JKR2N8qeweOe7UNuvSRaxWaah8SsbHNG1i2ji?=
 =?iso-8859-1?Q?aFWR9IomWBwcyqnmPkptY7p4OLx1TrQfrKCoR3vP0Ie3mND0gZuW5a4hYp?=
 =?iso-8859-1?Q?hLOSUsFw9hQj1QsNynqKQdcZvAhSL4q4o5RIuMQ4QmgEP7xCPmr50zZNIK?=
 =?iso-8859-1?Q?xGvtQN9aXeA7Czhp8Il8djI9qx+PZiJ3lEIZlUKaSQ6oel6tth64KkIdIP?=
 =?iso-8859-1?Q?EUKl8zuV5SoRY4G7roNXKQuoXdW9/bMg6n/boZwTY0+gmAYlysqlRyL8iB?=
 =?iso-8859-1?Q?DVQ1AkY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lOQE4OeuuImMkCulji2zYeWDFEQOXubOGtrEyjfStGtg2/00s46uAsgz4R?=
 =?iso-8859-1?Q?clSXTsr0+0RgoboOtxhCjDn7bxgVWvKBynGU+A20X0bKZ5NsG45l0vRv8n?=
 =?iso-8859-1?Q?ki8H4aFNI601rPWQ3VyvsN2SUCDQoAdiGcg55sTatH/F2e6mr3GkphSr+5?=
 =?iso-8859-1?Q?p2S1dejvhxsKAS9CJ30ZDlMP+5qoCPmIaMYZElxXG1ipoIHSN/1CI5dEGV?=
 =?iso-8859-1?Q?CEWBzjH7YvV7dhTPiPGOh1rR7LDCkTmXgmxT8PEFPTyAWhM+DBcoOiJgR7?=
 =?iso-8859-1?Q?Tb+A1ZR4cgjFIjSrz8iPOX3FqS8erN/6fl9EiEiwjPtMN3paHrHrd+T/jU?=
 =?iso-8859-1?Q?UULWHxPz7t0dkoOLivRU3Q8/z37vsfBlftzbsvdnAkh/N56ZUqH6odpB1A?=
 =?iso-8859-1?Q?WDia5cCoZ9y3VZh1qd8X1hTNCRrSJHV/dlufUNTwEPiiKtCkmf5eWgAOmT?=
 =?iso-8859-1?Q?pnUn8vVVyCsngu7sYGjGmgFs1tmGGGntZCauXD/4eUaEqBlEKKoeb3KB+d?=
 =?iso-8859-1?Q?pc9WAqZynGK8rMAdndPnLaaFnFQawtalWZLqHz0UDPkxIy6Y3BGt3H1BKl?=
 =?iso-8859-1?Q?bA9bz2pwpvrq3L5JvoGcXiYdiTrix5yOyV+nPUlx+opcC/q3/NrXSae08N?=
 =?iso-8859-1?Q?lPC6sOI7o+NJEF0oX5cR262At7lIwR7Z4DfSgr17+BvUt01jvFyX2foQJt?=
 =?iso-8859-1?Q?jn4mJkshJDwPypJPjfd7xvCpd6DwGd4BZdcAlGpFsGtlgQrS/951q0m+fW?=
 =?iso-8859-1?Q?bn/cuU0JlyYrkGKAvYz32xNrobMXQZ/VFN7PHfKx2oWc4LBZfJ0ujFtXgI?=
 =?iso-8859-1?Q?4SxHcl2eFRP7efHOCeXZYvRatgz6jNHVyXKprfbCpEifyk4riE+lh3KW0f?=
 =?iso-8859-1?Q?08MtMWaRzTxtATgIZbxGFh3VnYNPLVjQpj+binya5bF6obsWhGajGko3lH?=
 =?iso-8859-1?Q?w3uLA0iCwGVBpAnvPAcX5ASyJbYCHSTsZywzMWvPCEsEGJVZ/BWU8Fd5ey?=
 =?iso-8859-1?Q?+5XE8N5LlsB1LAP3PKHlPRGQwcBmYWQN0Nffmpw3XIJK+PU+JvVwCDCBQi?=
 =?iso-8859-1?Q?6wKkq+T5oXh/qKLkJc9FaG4oDWqkNWTsQv0TawdObesrGcCVq6zuj6101w?=
 =?iso-8859-1?Q?vYSgQ3QaU/r3bgzxSxN4zwg7UqJJL+EISk3oiy+DkxjqcD0LNkrWkYKsVm?=
 =?iso-8859-1?Q?1kfJlqe4bzMeNyFfDROYLG+X/YE8/BpYDCRBZQ/topfxadWAzfr5ltBgHe?=
 =?iso-8859-1?Q?Vs9HKHnmRlGHJEVfgMme1YC2vBQF6X11temoAV67cW7IsVGbfed+baSxwu?=
 =?iso-8859-1?Q?ET69juJBLn88r4+jbvNzPMuKBFrdpWhQuJZlBucWnl0xvY7KrKbBUCsRJs?=
 =?iso-8859-1?Q?D9Upmc8b+L4jUGtLg+C00hvQrfQmIRP9sjbbtd2axj7ywzAu5eR4Z201hS?=
 =?iso-8859-1?Q?ywWe+zvu5gP7Znr6qJ82OzKp/HKUZASl+7X6RLltumLX2QnOB21Dr3DJia?=
 =?iso-8859-1?Q?Iie6VoMX2mPl3mmrKYAFGkDrvaGcrfRhXDQsuD15EZgr3XoXmJGBTrRRSb?=
 =?iso-8859-1?Q?nRKnD/h3IhGIi0AHDb6MzZ5O/L00l12HQLe0K0Zyr9sXWmzzFERQH1vf6C?=
 =?iso-8859-1?Q?804hy+ASxNrS/oYwB/kKX2h8lcPJukNdJ8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced5488c-fb5f-4106-7428-08ddfa66a6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 06:01:34.5246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5jAkapFU9TTb7IKQprrOMC+nNSZihR81VHSWL3f1J1iT9+JPzDXun2LTazlyIub54g0hXAwbsOVkYlIRmtywjbHAg6Sks2BRb7ScdYLeaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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

Hi Christian,

>=20
> Hi guys,
>=20
> On 22.09.25 08:59, Kasireddy, Vivek wrote:
> > Hi Jason,
> >
> >> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for
> device
> >> functions of Intel GPUs
> >>
> >> On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:
> >>>> In this case messing with ACS is completely wrong. If the intention =
is
> >>>> to convay a some kind of "private" address representing the physical
> >>>> VRAM then you need to use a DMABUF mechanism to do that, not
> >> deliver a
> >>>> P2P address that the other side cannot access.
> >>
> >>> I think using a PCI BAR Address works just fine in this case because =
the
> Xe
> >>> driver bound to PF on the Host can easily determine that it belongs t=
o
> one
> >>> of the VFs and translate it into VRAM Address.
> >>
> >> That isn't how the P2P or ACS mechansim works in Linux, it is about
> >> the actual address used for DMA.
> > Right, but this is not dealing with P2P DMA access between two random,
> > unrelated devices. Instead, this is a special situation involving a GPU=
 PF
> > trying to access the VRAM of a VF that it provisioned and holds a
> reference
> > on (note that the backing object for VF's VRAM is pinned by Xe on Host
> > as part of resource provisioning). But it gets treated as regular P2P D=
MA
> > because the exporters rely on pci_p2pdma_distance() or
> > pci_p2pdma_map_type() to determine P2P compatibility.
> >
> > In other words, I am trying to look at this problem differently: how ca=
n the
> > PF be allowed to access the VF's resource that it provisioned, particul=
arly
> > when the VF itself requests the PF to access it and when a hardware pat=
h
> > (via PCIe fabric) is not required/supported or doesn't exist at all?
>=20
> Well what exactly is happening here? You have a PF assigned to the host
> and a VF passed through to a guest, correct?
Yes, correct.

>=20
> And now the PF (from the host side) wants to access a BAR of the VF?
Yes, that is indeed the use-case, except that the PF cannot access a buffer
located in VF's VRAM portion via the BAR because this path is likely not
supported by our hardware. Therefore, my proposal (via this patch series)
is to translate the BAR addresses into VRAM addresses in Xe driver (on the =
Host).

Here are some more details about the use-case (copied from an earlier reply
to Jason):
- Xe Graphics driver, bound to GPU PF on the Host provisions its resources
including VRAM among all the VFs.

- A GPU VF device is bound to vfio-pci and assigned to a Linux VM which
is launched via Qemu.

- The Xe Graphics driver running inside the Linux VM creates a buffer
(Gnome Wayland compositor's framebuffer) in the VF's portion (or share)
of the VRAM and this buffer is shared with Qemu. Qemu then requests
vfio-pci driver to create a dmabuf associated with this buffer.

- Next, Qemu (UI layer) requests the GPU PF (via the Xe driver) to import
the dmabuf (for display purposes) located in VF's portion of the VRAM. This
is where two problems occur:=20

1) The exporter (vfio-pci driver in this case) calls pci_p2pdma_map_type()
to determine the mapping type (or check P2P compatibility) between both
devices (GPU VF and PF) but it fails due to the ACS enforcement check becau=
se
the PCIe upstream bridge is not whitelisted, which is a common problem on
workstations/desktops/laptops.

2) Assuming that pci_p2pdma_map_type() did not fail (likely on server syste=
ms
with whitelisted PCIe bridges), based on my experiments, the GPU PF is unab=
le
to access the buffer located in VF's VRAM portion directly because it is re=
presented
using PCI BAR addresses. (note that, the PCI BAR address is the DMA address
here which seems to be a common practice among GPU drivers including Xe and
Amdgpu when exporting dmabufs to other devices).

The only way this seems to be work at the moment is if the BAR addresses
are translated into VRAM addresses that the GPU PF understands (this is don=
e
done inside Xe driver on the Host using provisioning data). Note that this =
buffer
is accessible by the CPU using BAR addresses but it is very slow.

So, in summary, given that the GPU PF does not need to use PCIe fabric in
order to access the buffer located in GPU VF's portion of the VRAM in this
use-case, I figured adding a quirk (to not enforce ACS check) would solve 1=
)
and implementing the BAR to VRAM address translation in Xe driver on the
Host would solve 2) above.

Also, Jason suggested that using dmabuf private address mechanism would
help with my use-case. Could you please share details about how it can be
used here?

Thanks,
Vivek

>=20
> Regards,
> Christian.
>=20
> >
> > Furthermore, note that on a server system with a whitelisted PCIe
> upstream
> > bridge, this quirk would not be needed at all as pci_p2pdma_map_type()
> > would not have failed and this would have been a purely Xe driver speci=
fic
> > problem to solve that would have required just the translation logic an=
d
> no
> > further changes anywhere. But my goal is to fix it across systems like
> > workstations/desktops that do not typically have whitelisted PCIe
> upstream
> > bridges.
> >
> >>
> >> You can't translate a dma_addr_t to anything in the Xe PF driver
> >> anyhow, once it goes through the IOMMU the necessary information is
> lost.
> > Well, I already tested this path (via IOMMU, with your earlier vfio-pci=
 +
> > dmabuf patch that used dma_map_resource() and also with Leon's latest
> > version) and found that I could still do the translation in the Xe PF d=
river
> > after first calling iommu_iova_to_phys().
> >
> >> This is a fundamentally broken design to dma map something and
> >> then try to reverse engineer the dma_addr_t back to something with
> >> meaning.
> > IIUC, I don't think this is a new or radical idea. I think the concept =
is
> slightly
> > similar to using bounce buffers to address hardware DMA limitations
> except
> > that there are no memory copies and the CPU is not involved. And, I don=
't
> see
> > any other way to do this because I don't believe the exporter can provi=
de
> a
> > DMA address that the importer can use directly without any translation,
> which
> > seems unavoidable in this case.
> >
> >>
> >>>> Christian told me dmabuf has such a private address mechanism, so
> >>>> please figure out a way to use it..
> >>>
> >>> Even if such as a mechanism exists, we still need a way to prevent
> >>> pci_p2pdma_map_type() from failing when invoked by the exporter
> (vfio-
> >> pci).
> >>> Does it make sense to move this quirk into the exporter?
> >>
> >> When you export a private address through dmabuf the VFIO exporter
> >> will not call p2pdma paths when generating it.
> > I have cc'd Christian and Simona. Hopefully, they can help explain how
> > the dmabuf private address mechanism can be used to address my
> > use-case. And, I sincerely hope that it will work, otherwise I don't se=
e
> > any viable path forward for what I am trying to do other than using thi=
s
> > quirk and translation. Note that the main reason why I am doing this
> > is because I am seeing at-least ~35% performance gain when running
> > light 3D/Gfx workloads.
> >
> >>
> >>> Also, AFAICS, translating BAR Address to VRAM Address can only be
> >>> done by the Xe driver bound to PF because it has access to provisioni=
ng
> >>> data. In other words, vfio-pci would not be able to share any other
> >>> address other than the BAR Address because it wouldn't know how to
> >>> translate it to VRAM Address.
> >>
> >> If you have a vfio varient driver then the VF vfio driver could call
> >> the Xe driver to create a suitable dmabuf using the private
> >> addressing. This is probably what is required here if this is what you
> >> are trying to do.
> > Could this not be done via the vendor agnostic vfio-pci (+ dmabuf) driv=
er
> > instead of having to use a separate VF/vfio variant driver?
> >
> >>
> >>>> No, don't, it is completely wrong to mess with ACS flags for the
> >>>> problem you are trying to solve.
> >>
> >>> But I am not messing with any ACS flags here. I am just adding a quir=
k to
> >>> sidestep the ACS enforcement check given that the PF to VF access doe=
s
> >>> not involve the PCIe fabric in this case.
> >>
> >> Which is completely wrong. These are all based on fabric capability,
> >> not based on code in drivers to wrongly "translate" the dma_addr_t.
> > I am not sure why you consider translation to be wrong in this case
> > given that it is done by a trusted entity (Xe PF driver) that is bound =
to
> > the GPU PF and provisioned the resource that it is trying to access.
> > What limitations do you see with this approach?
> >
> > Also, the quirk being added in this patch is indeed meant to address a
> > specific case (GPU PF to VF access) to workaround a potential hardware
> > limitation (non-existence of a direct PF to VF DMA access path via the
> > PCIe fabric). Isn't that one of the main ideas behind using quirks -- t=
o
> > address hardware limitations?
> >
> > Thanks,
> > Vivek
> >
> >>
> >> Jason

