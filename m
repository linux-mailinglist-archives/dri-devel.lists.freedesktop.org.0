Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F52C52622
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A84B10E713;
	Wed, 12 Nov 2025 13:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwZjH1Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059110E025;
 Wed, 12 Nov 2025 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762952923; x=1794488923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/c4MvlHhxDQxHQKP5/HtI4QuK2YJlBrRadbxxIibj00=;
 b=SwZjH1Jx1z4diFvJZ87Vl/S9bKhYQnIeXoKWTkJGVBhLFTVpO04rNOrq
 0RSlrrgAacHZL964VwI3CQLBmzXvdXyHkuj3VM9JIDGW3ilo2maBnwPr0
 dnEPm9pNVloZadH7ZYNLQTE+UJozDMfkLW1xC2JKH2qYUsC/j0BqWfyrc
 c1Yp6cYXHzOpdJjciQUDFd70G3FpGz+/q6cmWakjuDmnaZ3Yrv9CF1B4W
 AjNIffbwSI1qzWh92N8Jqx11fbsyR2eE2IDA2C5783ZAn3m4ytoZzbw2B
 J0oA2JQkTMuJje8TLWHqsYDl7VqRSwlMe1RAYajkLOO+l/xMNjGrSuzTv A==;
X-CSE-ConnectionGUID: 3kgeA0R3S2W6ZhXW/lxSgQ==
X-CSE-MsgGUID: uK4uM2N2SeKkvpVPYMWBIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87654238"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87654238"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:08:42 -0800
X-CSE-ConnectionGUID: Gq+VjfyKTcevUqk9Frl5eQ==
X-CSE-MsgGUID: qBeZvXGRSxyA9Qaxq07gMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189480902"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:08:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:08:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:08:39 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:08:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjYvPK0itG2rwNCL0jPNWz4b5aRSU+TpYrXl9IzwjaFtcxAHkMAvNkzs4nnR7Awyqyf+sTvimeJ638WgFS/juXMt3KpKlUyNbKmNz5HgCgFPrQHdV10n6caMtw77SuCRXkt7+f+Qv/0PP4tc4UHXZ6DtBo21FkQmgjg8qGZMzfe9wfbZ2t3er4e90gfMN1nmu05xJHCw/QJjBsF6ny9JKAWGlqb5xLSBPaP2dndKuMEyXtv07A4TfkNoC8bnSe+tol2ipRzOCpACNFNPA8DRJGvcWsDLJGD3kbDbzz89hDG18jgngussM0hZkPe6CK6CEP3ZG7gwIu8O4plwjgxhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhJgaab7N/myqjWkXTyCLevbjXSoab1F/OGzWwVzsGI=;
 b=KnJp7XhfbXayehfAjOwNjeWaKoBDF4fKh5Y0CkzfF0u2sfuGtvZ2O7L55EG+ho3meCc/6hnA7eTCLpF8FN6gKr2E+hwnPOr3y/STlC9f1D2lQ+Hap+futFN56H3584HVclNo8/kjUV89pDtLi/y41Ddp0WhWZzRZN/iGOd198m8OxXM3QP91R6Vl+AU4yfjlH0kcfyLdEavY/lDtmEEbuYXhudzm+/l9qUo4lpg7+CPB9qGL/BlgQeovyRHABMVyFp9ZalQbHfn52jz3RIny11gpzUmLhBLQ1MGh5i1RyXifC0V7QDK01l0586ZxTkBWP4drKuVxpx6OToaf2BJsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Wed, 12 Nov 2025 13:08:35 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::395e:7a7f:e74c:5408]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::395e:7a7f:e74c:5408%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:08:35 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
 <corey@minyard.net>, =?iso-8859-2?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Lifshits,
 Vitaly" <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Karan Tilak Kumar
 <kartilak@cisco.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, "Casey
 Schaufler" <casey@schaufler-ca.com>, Steven Rostedt <rostedt@goodmis.org>,
 Petr Mladek <pmladek@suse.com>, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "ceph-devel@vger.kernel.org"
 <ceph-devel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?iso-8859-2?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
 <przemyslaw.kitszel@intel.com>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
 <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Rodolfo Giometti <giometti@enneenne.com>,
 Richard Cochran <richardcochran@gmail.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Stefan Haberland <sth@linux.ibm.com>, "Jan
 Hoeppner" <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 "Baddela, Sesidhar" <sebaddel@cisco.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Xiubo
 Li" <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [Intel-wired-lan] [PATCH v2 10/21] igb: Switch to use %ptSp
Thread-Topic: [Intel-wired-lan] [PATCH v2 10/21] igb: Switch to use %ptSp
Thread-Index: AQHcUwbAW3+yA5BeK0OppAjS2cyJKbTvBMIQ
Date: Wed, 12 Nov 2025 13:08:35 +0000
Message-ID: <IA3PR11MB8986FC6F03EB47A625D37A89E5CCA@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-11-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111122735.880607-11-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|DS7PR11MB6128:EE_
x-ms-office365-filtering-correlation-id: fd2aa9e1-8b8f-4d4a-4902-08de21ec96a9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?neXLULHeLxamYiW+QWwIGxQ1DA5RZ76CNpT7emInZEbpW1suScYAE32rmw?=
 =?iso-8859-2?Q?Vx7Sp1cRblNnLZph+dX6G2wqn8U8kcggfqTc9CNt5Ng5O5HJ0RDLG6qFiy?=
 =?iso-8859-2?Q?Px1gXif53xmnnTxp8AZ6hzMKpd/yDp3g0BFgYSrvYEYmTJrh7mgvDujeOj?=
 =?iso-8859-2?Q?MSOcsoLwKSn11g4BMXfPU6lTxcbx5tuKk6pURlwDbXhRlWJRZdB6d8Xvp3?=
 =?iso-8859-2?Q?C8ByJAM9diyvWDdxbOw7+7LzmC9ZnemuT+4WLoT6VXd9VV4CW8VPBxz3em?=
 =?iso-8859-2?Q?kbELoqBH9Q6lScJGW+lfRaNXurs4dBwoB+DnBSTbsN9CYB8LQ02EGngOVH?=
 =?iso-8859-2?Q?DkU00Q0b3Rk1wQq4zWBR+pSNiO1EU6z2MZ5NDJUB/ZGE6hqZoxEuslaHZJ?=
 =?iso-8859-2?Q?0LRc4sAM4oLsUVuYDiiaLu5KE0/kVxE4YcK8hC9FjIMIj/AFGYYjlI7mgn?=
 =?iso-8859-2?Q?cHui7czNb7+okN+z1vCH/zqrkRqcExghP+V24Pd/Bgln1vZEiy343taPfV?=
 =?iso-8859-2?Q?v05xXAoiVTfhWeioW6IpVlqJxpcsbjgZ6gqp7yAfWSCrE9QCYv7Ssp1iJ9?=
 =?iso-8859-2?Q?95WH553hTGhQpGZl3FwBSSzb2G2Ma5nJPLr78YdvRq3hMgrpcKIFUvRUjY?=
 =?iso-8859-2?Q?KHbyEMwmTwz9SCUtWuYt/ECMqYFOwmnEZWq3AcQfkGw1qKXJRlY0FIAJBW?=
 =?iso-8859-2?Q?IhC13KNHxhiowlyyleGsK6vM93Ja4ecok9vCFYIdBu7SjIjpVX0BNjyg+V?=
 =?iso-8859-2?Q?ytYp9cwgwZyhx+R92Ho/4aGQ3K5CtOFtBc4jejOb3UscZ/BdMaZhpfmXbT?=
 =?iso-8859-2?Q?C0GRp3ewbKHHB3zHE4xVnbutkS6FJXrXDQaWrr4QWk0ZrDX7sKuItyD+OL?=
 =?iso-8859-2?Q?4bBBAIeLZ5S7PtNHjQ1GpQWJzh/le0+OXWWhU1/qdAaIxO+YM0dWtrBOLA?=
 =?iso-8859-2?Q?gn2rTji6AlpunVNE4WSvO6KD3f5qN/B5XrFjvIZx6WPs5+rXqKaXxCb35c?=
 =?iso-8859-2?Q?btgBHT4WPdPIXxUvsaMU/YbJuuuphMuE5qxQXVLLDryq6Gq8wXh2n5D6Uj?=
 =?iso-8859-2?Q?BDgVKiwR+1h4ZiaeO1iu5r3VyztN8vNiI8HZduGt5AFOkWG2XoBwpkTlkd?=
 =?iso-8859-2?Q?9u4fgEl6lCGSdml2ykmMEcJ5NG0+3dKs5gTcNVbTj9msZLlxCzERM49boH?=
 =?iso-8859-2?Q?ofwFH9xudIG3TKLO05yY6oKsN9yCCaijxSNk/RgCpM+Q+Nbn2ZbeNE+/zY?=
 =?iso-8859-2?Q?3vkPeCBq4sv6sQk15FRu/ealV3gbnOVEqh9yYmtrmOGrBkIa2Um+mACDn1?=
 =?iso-8859-2?Q?NgWVMYkj6w4vw8A4VjVRsjmrIl4zWFfR1YhOra56lBDLLz4dDpso9kAna/?=
 =?iso-8859-2?Q?RXNncqZi7QnHoCjT0oVqAaNkHC4u7Y6gBLmQMVktXPsfPsFtaETH5VwEXp?=
 =?iso-8859-2?Q?y7ZXo2MT3ihqXx8CCPCCpEATFQEOfreZk/jHYqJdP0gxU7SoifDXA1rqGY?=
 =?iso-8859-2?Q?H98wpMlV2D/z4ZDtAolUSKUQFCFJuD27896SM4UwhAC4Uk8U/gnxt6N09f?=
 =?iso-8859-2?Q?qf98XmiljSJonn4VTJTVY5OGhgJQJa281s36rDGN71D5TCOJ4A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8986.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?44rD2PiUoeiTgtKLeSAcStnKOAK8d0M9DNsWPjx4EukRYJ1rBulYB0tZ1Z?=
 =?iso-8859-2?Q?CeL3HFOwyKfiVYDam64M9JDTxj8UTioVI9qU3EA1kYxcXl9oYfQ1vphT+7?=
 =?iso-8859-2?Q?ttxnaY5GM7HnnrwMlf1n698o2Yl+VdtUis+WSNep4dr1a7Wc77+73/AdwE?=
 =?iso-8859-2?Q?6+mUGXHCf4VrWFL5Lhz4eKB6DTuqrGgGJhrvKUWTqKcLOL9dsU0bbDNlXD?=
 =?iso-8859-2?Q?dP/iL+OZATCfw6dqT4JqQfvHGm9Sf6r1y5MMDknik5wTfcWeazVG61NG3j?=
 =?iso-8859-2?Q?P8dVfR6Vytl5hsnCFe6yKg4JwOmCe6bqYIiWTJ0JQnTSU9bvXSLO/Iw7CZ?=
 =?iso-8859-2?Q?RWQrqohv7Zx0NlH1jJJmWBzNiudXrs6LsoS4ZAQvOQoefCjf03Qpjc/6Lw?=
 =?iso-8859-2?Q?XVBlombV1TpkQkenoXN31EFPJq1i81Ca731q0OML2+48RrVvVgjfsBhQkt?=
 =?iso-8859-2?Q?4o/TCqZ4gSq0A5/e3Zrh3I5GWqUEIA3H8pp8SYswr0MqQt1AtkPRGVOB7+?=
 =?iso-8859-2?Q?bIyGN4q0sJ7LQU0d+kC+bm/hJxehk62NQYIm1hVBzhnHrvFRMNKKU6sshe?=
 =?iso-8859-2?Q?K68h+9ySTZdPk+eVeWV/bbV9ikBipmitnzqaAv8Bcj6Ma8VnuB7keTlX8b?=
 =?iso-8859-2?Q?0zpcHHKqVbWrE2IZTRuD7IWO/PnsfnQ19VcVi7LEA9AXUFHdzOsSfImjhz?=
 =?iso-8859-2?Q?SS5OL6WeoEswm0mNNn+WHRSWfShtJpv9gUV35eAhz4p1StIFEgIyKnMGb4?=
 =?iso-8859-2?Q?Jc2RstJJXjDDwukFlv6N2ThHGtrGtELeBRjuQI98R7InjNGZnfp9pDOoEM?=
 =?iso-8859-2?Q?ifBrnTYoJYvZFsUl/6fAI8aE+zgpIXxHsAZJp4TjMwF6j87toPQKb14j91?=
 =?iso-8859-2?Q?+/Zb0PECp7FNk3U+x6nqygLfZy06OCBtOPP8qmWYMI5T9LcGF1Zm9NIKmd?=
 =?iso-8859-2?Q?hx/9Mk22jX0hlRjCOerk4tv5TcUn5i2lnjPEKFqsNkmadfV+0IsPJNYJls?=
 =?iso-8859-2?Q?EQ2mTlWh1nvLg2Owv6TfzSaXsIszIXDNwGWaBQMMURZCscOmULncuY7rEX?=
 =?iso-8859-2?Q?m8Me5Jijh5yQ8wcS8Gs/uRBcElR5JOyLhX0pCnl1tNST5SaSTgVcGlsdM+?=
 =?iso-8859-2?Q?QE2X4pCeE3uwW/Lx2zcFJNJJLxx22dm4VWr7+bBgUp0XJrMqW7lq+ICq12?=
 =?iso-8859-2?Q?Jmlh+h0q5YpOMrnSOisNzk6YJCPo1tm7w6rL6A6A5koh1vz3rQQCi3vbvz?=
 =?iso-8859-2?Q?vECXmmsaRXnxe3hkzCwFc62fziZH1CmxHBBQqMUR0t0IP37J6amQ8f0CK3?=
 =?iso-8859-2?Q?X27b7Nr5KEs3adVeiJv0VuGMRCU8+c1a4vIGiOdgKMdvwvlcJrMdf7+Htq?=
 =?iso-8859-2?Q?sKpVkTcCgQHLTtwW3+bgPmVk2ORwl1xlu72UPLQzwE9ehXlRGVrYPY7MPh?=
 =?iso-8859-2?Q?GUdtKYEKm5c1/axgvGCbEpY1yCvW3EM6kOOr7ogti6u+wnv2laCPH7fJlL?=
 =?iso-8859-2?Q?+naclpSoQyfi4ZxHmNUYjWUZUERjU2CrqUuYwk4gAqwV0DGrc7i7AcUPr4?=
 =?iso-8859-2?Q?VWWklFUiduDV2Yjo7sFnedjbAz/zTEsQWfiKcN1cc9CuBdgsrkzSxfPVMy?=
 =?iso-8859-2?Q?/yLEkp/62PDNYYKCY/2Xp66m9OH3L21KMVs+rMUvy6bNZY4hQyid32Hw?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2aa9e1-8b8f-4d4a-4902-08de21ec96a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 13:08:35.6427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYXuuuoHipMXPR1l0pbZwX8udZSh3+eyKsePJohm4nmdDk7yTsTwdhdo3DFiVg5bpD/lD/HWOIESzymXjgF3cKbUxDLsJ0H+CU3E6zt6QvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> Of Andy Shevchenko
> Sent: Tuesday, November 11, 2025 1:20 PM
> To: Corey Minyard <corey@minyard.net>; Christian K=F6nig
> <christian.koenig@amd.com>; Dr. David Alan Gilbert
> <linux@treblig.org>; Alex Deucher <alexander.deucher@amd.com>; Thomas
> Zimmermann <tzimmermann@suse.de>; Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>; Rob Clark
> <robin.clark@oss.qualcomm.com>; Brost, Matthew
> <matthew.brost@intel.com>; Ulf Hansson <ulf.hansson@linaro.org>; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Lifshits, Vitaly
> <vitaly.lifshits@intel.com>; Manivannan Sadhasivam <mani@kernel.org>;
> Niklas Cassel <cassel@kernel.org>; Calvin Owens <calvin@wbinvd.org>;
> Vadim Fedorenko <vadim.fedorenko@linux.dev>; Sagi Maimon
> <maimon.sagi@gmail.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; Karan Tilak Kumar <kartilak@cisco.com>;
> Hans Verkuil <hverkuil+cisco@kernel.org>; Casey Schaufler
> <casey@schaufler-ca.com>; Steven Rostedt <rostedt@goodmis.org>; Petr
> Mladek <pmladek@suse.com>; Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>;
> Max Kellermann <max.kellermann@ionos.com>; linux-doc@vger.kernel.org;
> linux-kernel@vger.kernel.org; openipmi-
> developer@lists.sourceforge.net; linux-media@vger.kernel.org; dri-
> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; amd-
> gfx@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> freedreno@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> linux-mmc@vger.kernel.org; netdev@vger.kernel.org; intel-wired-
> lan@lists.osuosl.org; linux-pci@vger.kernel.org; linux-
> s390@vger.kernel.org; linux-scsi@vger.kernel.org; linux-
> staging@lists.linux.dev; ceph-devel@vger.kernel.org; linux-trace-
> kernel@vger.kernel.org
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Sergey Senozhatsky
> <senozhatsky@chromium.org>; Jonathan Corbet <corbet@lwn.net>; Sumit
> Semwal <sumit.semwal@linaro.org>; Gustavo Padovan
> <gustavo@padovan.org>; David Airlie <airlied@gmail.com>; Simona Vetter
> <simona@ffwll.ch>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Dmitry Baryshkov <lumag@kernel.org>; Abhinav
> Kumar <abhinav.kumar@linux.dev>; Jessica Zhang
> <jesszhan0024@gmail.com>; Sean Paul <sean@poorly.run>; Marijn Suijten
> <marijn.suijten@somainline.org>; Konrad Dybcio
> <konradybcio@kernel.org>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Vladimir Oltean <olteanv@gmail.com>; Andrew
> Lunn <andrew@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Nguyen, Anthony L
> <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> <przemyslaw.kitszel@intel.com>; Krzysztof Wilczy=F1ski
> <kwilczynski@kernel.org>; Kishon Vijay Abraham I <kishon@kernel.org>;
> Bjorn Helgaas <bhelgaas@google.com>; Rodolfo Giometti
> <giometti@enneenne.com>; Richard Cochran <richardcochran@gmail.com>;
> Jonathan Lemon <jonathan.lemon@gmail.com>; Stefan Haberland
> <sth@linux.ibm.com>; Jan Hoeppner <hoeppner@linux.ibm.com>; Heiko
> Carstens <hca@linux.ibm.com>; Vasily Gorbik <gor@linux.ibm.com>;
> Alexander Gordeev <agordeev@linux.ibm.com>; Christian Borntraeger
> <borntraeger@linux.ibm.com>; Sven Schnelle <svens@linux.ibm.com>;
> Satish Kharat <satishkh@cisco.com>; Baddela, Sesidhar
> <sebaddel@cisco.com>; James E.J. Bottomley
> <James.Bottomley@HansenPartnership.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Xiubo Li <xiubli@redhat.com>; Ilya Dryomov <idryomov@gmail.com>;
> Masami Hiramatsu <mhiramat@kernel.org>; Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com>; Andrew Morton <akpm@linux-
> foundation.org>
> Subject: [Intel-wired-lan] [PATCH v2 10/21] igb: Switch to use %ptSp
>=20
> Use %ptSp instead of open coded variants to print content of struct
> timespec64 in human readable format.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/ethernet/intel/igb/igb_ptp.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/intel/igb/igb_ptp.c
> b/drivers/net/ethernet/intel/igb/igb_ptp.c
> index a7876882aeaf..bd85d02ecadd 100644
> --- a/drivers/net/ethernet/intel/igb/igb_ptp.c
> +++ b/drivers/net/ethernet/intel/igb/igb_ptp.c
> @@ -840,14 +840,11 @@ static void igb_ptp_overflow_check(struct
> work_struct *work)
>  	struct igb_adapter *igb =3D
>  		container_of(work, struct igb_adapter,
> ptp_overflow_work.work);
>  	struct timespec64 ts;
> -	u64 ns;
>=20
>  	/* Update the timecounter */
> -	ns =3D timecounter_read(&igb->tc);
> +	ts =3D ns_to_timespec64(timecounter_read(&igb->tc));
>=20
> -	ts =3D ns_to_timespec64(ns);
> -	pr_debug("igb overflow check at %lld.%09lu\n",
> -		 (long long) ts.tv_sec, ts.tv_nsec);
> +	pr_debug("igb overflow check at %ptSp\n", &ts);
>=20
>  	schedule_delayed_work(&igb->ptp_overflow_work,
>  			      IGB_SYSTIM_OVERFLOW_PERIOD);
> --
> 2.50.1

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
