Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBuTNDaRqGkLvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:08:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803C62076EA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2E10EAB2;
	Wed,  4 Mar 2026 20:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch/HGWrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAA510EAA6;
 Wed,  4 Mar 2026 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772654895; x=1804190895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFE9JGU1LOuq3bXXQr+giVoLy7cfTIpklRNpbPqlZ4s=;
 b=ch/HGWrBjwsK351jgcYCaSj3Jd3kX84BBjWu93m71QynJQPmN/hKgkPq
 bdPI/77EhKJnQ9ijcb1n2DFN9duFvu9VpGzN2efLmRsD2uMKuq4Uavny2
 gz32aMCgC8nTHshTNEUV1LZxTTxooXdKossyitHwMJ+xT/JOx0Yq8udO9
 hF/OV+PO7cNLA7x9WgBij2GhiXvngzF01zP4m8JPYjl53jzbM0fiskQY3
 kQIqlzUNYR6OpT3AMeQVLWS/le20n/kR88NrCmb3HxE9JWHxBeSBbiyxP
 v1At4WlhV18nPYASjkM4gkqvZctCWafVCPiHvK1B377w4jC0Cx9o6pl9Y g==;
X-CSE-ConnectionGUID: lmsbsj5zSB6VUN5F12uu/w==
X-CSE-MsgGUID: 0IgEhuAgQgm2wkt8/3nBOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84814804"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84814804"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:08:15 -0800
X-CSE-ConnectionGUID: GLCJiSHDQeGdnaZn8wfSmg==
X-CSE-MsgGUID: Hkzi+LyCSLKRV4MprS2sxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="256329377"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:08:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:08:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 12:08:12 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:08:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otsCU+WnIBFRewRxXMNDHs5/72sNh2+hsQfjv9XagduS9sRCSuakzpSQKONAqhq8hiB5F0E6X8L6Ey3zLbMG3qTmEhVR5LeJ2w6IihkrvHnaWyLMtq/SrCtl02DDfd3n1ka6lS694Cj+xl/THWAd3QPdkTNu+GHM3DFbQdznihYvTIZnz+yw52Cwx4hvXR0TTHwAUa21kvq5Vj59vAwJuFBUoSbbFZeL0uzE3wQ0Zk0mOR362esMIo9PZgYUL337WdKNwXvBClUz2knD3e0gVG/TIFba2JRhEdMTQ+7b5Pt2O3yHWTWdO5zPW8nhRnvBVfiAaL7PudSvmRySYq9W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ugijf31jSahCxXk8k/I7EgWgSfCcGrzVbsxvsS1Gebg=;
 b=uyNFEFVTpJCJbTfJ+0J5u5TP4OzR+SyYzfUfp/85sM18YPAWY6UspExbF9vIAzWuhAQ633u9VBmeA6K12+JeTqSf+pQW1sOlz2nFV2TL75d61A4biZren72MixYd2UgOgD7Ig11NYJ+YNtMj8waQJebM2PXgFNqDZ+7VPVzZlQoG3Xq91AfQTbfxkjJOWGdfnCrq3S8sohVeRKHjcgsWhTSxiDgwXm+b57nG4bZkvp/oVMPmjFP4TdNPF+k1E2C795jAMi4R92vHgz9KyaFN6lt4PbnJoQe1v1d67HU+/GDqu50x+SOkI62+0hnxdgHhcwdBmiR+eTxacyZouILTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA3PR11MB9181.namprd11.prod.outlook.com (2603:10b6:208:571::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Wed, 4 Mar
 2026 20:08:10 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 20:08:10 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "irenic.rajneesh@gmail.com"
 <irenic.rajneesh@gmail.com>, "ilpo.jarvinen@linux.intel.com"
 <ilpo.jarvinen@linux.intel.com>, "srinivas.pandruvada@linux.intel.com"
 <srinivas.pandruvada@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xi.pardee@linux.intel.com"
 <xi.pardee@linux.intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v7 2/6] platform/x86/intel/vsec: Make driver_data info
 const
Thread-Topic: [PATCH v7 2/6] platform/x86/intel/vsec: Make driver_data info
 const
Thread-Index: AQHcqs2DI+gGb7FqSUmES/Pc/2hDjLWez2OA
Date: Wed, 4 Mar 2026 20:08:10 +0000
Message-ID: <IA1PR11MB6418730E789345910BA86F42C17CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
 <20260303051953.1453372-3-david.e.box@linux.intel.com>
In-Reply-To: <20260303051953.1453372-3-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA3PR11MB9181:EE_
x-ms-office365-filtering-correlation-id: 0840df07-6c9d-4b4f-7b04-08de7a29c20e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020|38070700021; 
x-microsoft-antispam-message-info: iqKsr8DXC9lc+kcYKoOjT0THWBOmSHU1+TUCZXdM9k5Q03ucISHmSoSkoWbv8tA7RdhbL1Qe5E7OK1rRDsrIjfKawCrxIXLPXXFVUYVPmrSEC7U/vNnMad8d1n7JKqY8IOzG2WNRIsWxqMHlEkxoEtVR/fAw+2oMsXfE8P8X7C/2imvDH63e9rxV4aGfv5ulb5R+ZeLacTx8B/uvjU1ttXA8s80J+0W3SNwKYozq6q4oHu8CBTa0mDD9iNBmkkfTDbt904KGGPkAi4zxlItSj+9h4V2oenV2wklxLlmER4epRtg/dZRQhSFyIyZJnVtp0wMyVFOKwsL5K54mhUebcE2YEA8muSK6tUSkJ23ZMVuxarUoOssDTY5kTnUG9HR1Qn747on9grGwYEqxqsIKqkxXOrSJqNQrOCKFUVXwMjLKbo10GAFRG4s0JKRknMUh7DuqJjdYSVBkexv0ar/wHrpx5pLrshllzjqNICgeHfDG3BR7wxQoTZGgRv41rI/KoN/63cbugrgLh8P+Tx8OHmNyFHzfbNHnLwh379dxWe4s5fwDVQwr8/nu6ABLzN+t7RoQMHHqixLX1DRUOVaioCsRI6Q+1VXr5g7wTRw09gz173Jtw04a7tG1mbtZTRqAaILoKa3pzfHiaSHiVHDOKtJpeQyJmoe5I84/QRaG/UOqRveIgQeREICOsrgXnEJCUgOSkxAeTZ9hxXXh70TH21F6J1GPELIS0PpV3xZMdw/lMM9wfj5+vqNUFYmQJ35IwiiKxfJvL/v7+GnLbQIV5hgMSXZiaAdVmUqD/YpWWLWtgu4JNUtkB5VVuOSNAqdl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZCgHUwAY9VjWNRChzMqKk7iQ3fnjH/XHlQo+JIsBTPpr7c98UaIPgBRVYGKx?=
 =?us-ascii?Q?IsO9jgUj1V5BdpOxyuVGmye64t/63jUKXAoU4AVZaqz8lltK1mjRIg3S5y8s?=
 =?us-ascii?Q?TOODpvz9CZmkYhOJoAdYilYJtnJoGjL1BaKpci1kpqS804vbp59d4CmjHq3F?=
 =?us-ascii?Q?KLFQ6Ha+XzYATl9kBw7+aKlqWimCAONHfiwxHy1ivPUT+P21aNfExS1THNrN?=
 =?us-ascii?Q?uLsDo1rXUwW6+2sFcshKkfSzyZQPdZ4WbfYBWutkVmtz+nnCBxqymdnqQ+UX?=
 =?us-ascii?Q?TJdkd6xTRwGmfANx7jNb6yNQ3SSCATqnD5O73PTP531cDKdqB+BHwZnjwGQX?=
 =?us-ascii?Q?3u4SLMpacodDqK85Z1TS210B0q+msvHNmQoJHJlowEw6rvLQQBF2IohWBnxr?=
 =?us-ascii?Q?OOH2rtUTTDA3SQ8hIwABr+FFY0Deq5OM3ePifgXwU4wt5SH066GbbLUqZXrN?=
 =?us-ascii?Q?JfrWOoL7Y2LahWi3bB2pwDj2DP0X40HT4ZJIbG+80chJkdm2Pmsx4gF5A2ZE?=
 =?us-ascii?Q?XYazz8XskQKuh3AcQzmKvSWSjBTE0uxKQoo0nTk89iMyJ6WJa7ssXMWbHQmj?=
 =?us-ascii?Q?UVVJXFNDdBb2H9OMXCsR+7pcBAlBDnarAY88GpYp79X0s78zc0T+Jv/syxo4?=
 =?us-ascii?Q?r7+0j8FzXCuBGqUXKtpbq9DnIN7xy7YBFQaA9uHweYpWfRJ6rIhLIdvr55+c?=
 =?us-ascii?Q?jT907z5/QbLKHdx7yvbM+k6FaC79tu701t6ZxfnVbIX5Ehhyh7G983672IIW?=
 =?us-ascii?Q?NENXJeRjIRMlWoCK74tBzvrmsbIBypds4EtVW58Ir+/2Y3/Qb1b+hs3AzSME?=
 =?us-ascii?Q?yB7NCI7+7kZerWrkTo4Z8IpdaUgmLHoO0ITyK4FSWQni1+O1wSh9AFFBV7V2?=
 =?us-ascii?Q?lr2GDL6+oUdr16w92bxt7hlY5QVCZ/pnZGoPd3oa/QSrQO5sLJrbE14c75IX?=
 =?us-ascii?Q?gJTBWEMzLhcwf9Am3ZVf2knIkJ1xjKdXtHwYBiKXd8OBVwlcg50ilz9VbRwz?=
 =?us-ascii?Q?+jUTL0HJq2KsccAIzfIoAimho8/82QTMgaGx4cYfrX2Uj34gXzq5OJDjknlU?=
 =?us-ascii?Q?6nOpppJpV1swfs4B7GZnnglQTfD0ZQQBu9L/zjgKeB5oHDICg54O3j6f1Ohq?=
 =?us-ascii?Q?JLjTv6O73Nzs2sidADU/E4Q6lHYvGWQTNGCnjSBsyaN97zAP9rMXMON7Barn?=
 =?us-ascii?Q?l2v5j0oY+dsClVfrh7FYMP5N6wKEWORoMrwLgNehoYDOo+S6zL++mIb4fVp9?=
 =?us-ascii?Q?wjHwkA15ZKYMlJoVQtcRRNeNBV5jU3g74bMzfap8QICsoH3gQnlEBj7AXwzg?=
 =?us-ascii?Q?1TCrlX/m6qHNBfH+Hn5rZvFiWEPYm2xwY5gZhgoIIMX0sL/JWjrBieTU3P4x?=
 =?us-ascii?Q?xNZOMDN8puJ1hjIPJ/63lSaU1233XmsUhM2YZuJRax7LInpE5tiIiQKd7MzS?=
 =?us-ascii?Q?iEFHNTILofi/ZGrkGJP3mXGgv/ERPwLlJ8UQsrutn/xoaYbns3AIL/FVLozZ?=
 =?us-ascii?Q?NI7PUQnFJ+m90l9Al8ZQgy92NilA/qEbi9y+zMnHPOZ/SPv2KEumrDaTYANm?=
 =?us-ascii?Q?+fl2BQ6aG88B9g4Ht5ppJA2LwyEf65MZQ722eEHl0Fye6WNHKC+6bN2VXSA4?=
 =?us-ascii?Q?W1qSLL3JxjzozDUeOFyKsYqlodEtkwabZKY4pv50CtbXgdNsbFV3WRg2uvqk?=
 =?us-ascii?Q?067Os/MscuUJ2vCFlbmtjj9//A24jUXQ0/JAyu1dZTMVL6LaV92e1uWZ+rV9?=
 =?us-ascii?Q?bLzty+oUrg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h8927WvTbwDH4kCVFDU89OZjJDPykEb/ahhtjOYoBsRGYbz/LbXxK4uHbgxhN2YVtAJsqw2fQUq50bhm2ljE+YvvvogE08lyozq5UlttYQs9gAv8mBp6E3YIlpn1b549Zki4xboUvxmIGXClUiE/aSZeu/+Ntu+K9wABIokAv1hNfy1Z7gv7KpK2I/1eobi2yuOth9pGW5tK5/90sjtkfreVDioCQ0aPvPUxqTy9COabyZ+flhDma7PC2IglbB/om9zv/azpGJniBpe37AgjQkeX+DXMDRscQSyXTliMqulnXfYsdvHQRQW4TOmtBUo6Et4xacJeszWjMnOsxhzgiA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0840df07-6c9d-4b4f-7b04-08de7a29c20e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 20:08:10.0411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jA4DXIE1PSY9Rr86sGZbpOm6DXZgrsbvQUn9NbQLAjYZ/jV/RQfouIZbA4l/rveSRcCVZ6vV4y4xHY8r88vjR/Koj7CaoqmWqc5a8WB66c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9181
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
X-Rspamd-Queue-Id: 803C62076EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,lists.freedesktop.org:email,IA1PR11MB6418.namprd11.prod.outlook.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	SURBL_MULTI_FAIL(0.00)[intel.com:query timed out];
	FROM_NEQ_ENVFROM(0.00)[michael.j.ruhl@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of David=
 E.
>Box
>Sent: Tuesday, March 3, 2026 12:20 AM
>To: thomas.hellstrom@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>;
>irenic.rajneesh@gmail.com; ilpo.jarvinen@linux.intel.com;
>srinivas.pandruvada@linux.intel.com; intel-xe@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; xi.pardee@linux.intel.com
>Cc: david.e.box@linux.intel.com; hansg@kernel.org; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>Subject: [PATCH v7 2/6] platform/x86/intel/vsec: Make driver_data info con=
st
>
>Treat PCI id->driver_data (intel_vsec_platform_info) as read-only by makin=
g
>vsec_priv->info a const pointer and updating all function signatures to
>accept const intel_vsec_platform_info *.
>
>This improves const-correctness and clarifies that the platform info data
>from the driver_data table is not meant to be modified at runtime.
>
>No functional changes intended.
>
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

>---
>Changes in v7:
>  - No change
>
>Changes in v6:
>  - No change
>
>Changes in v5:
>  - No change
>
>Changes in v4:
>  - No change
>
>Changes in v3:
>  - No change
>
>Changes in v2:
>  - New patch
>
> drivers/platform/x86/intel/vsec.c | 20 ++++++++++----------
> include/linux/intel_vsec.h        |  4 ++--
> 2 files changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>index 46966edca03b..e0096be605d9 100644
>--- a/drivers/platform/x86/intel/vsec.c
>+++ b/drivers/platform/x86/intel/vsec.c
>@@ -42,7 +42,7 @@ enum vsec_device_state {
> };
>
> struct vsec_priv {
>-	struct intel_vsec_platform_info *info;
>+	const struct intel_vsec_platform_info *info;
> 	struct device *suppliers[VSEC_FEATURE_COUNT];
> 	struct oobmsm_plat_info plat_info;
> 	enum vsec_device_state state[VSEC_FEATURE_COUNT];
>@@ -270,7 +270,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct
>device *parent,
> EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
>
> static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_hea=
der
>*header,
>-			      struct intel_vsec_platform_info *info,
>+			      const struct intel_vsec_platform_info *info,
> 			      unsigned long cap_id, u64 base_addr)
> {
> 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
>@@ -406,7 +406,7 @@ static int get_cap_id(u32 header_id, unsigned long
>*cap_id)
>
> static int intel_vsec_register_device(struct pci_dev *pdev,
> 				      struct intel_vsec_header *header,
>-				      struct intel_vsec_platform_info *info,
>+				      const struct intel_vsec_platform_info *info,
> 				      u64 base_addr)
> {
> 	const struct vsec_feature_dependency *consumer_deps;
>@@ -452,7 +452,7 @@ static int intel_vsec_register_device(struct pci_dev
>*pdev,
> }
>
> static bool intel_vsec_walk_header(struct pci_dev *pdev,
>-				   struct intel_vsec_platform_info *info)
>+				   const struct intel_vsec_platform_info *info)
> {
> 	struct intel_vsec_header **header =3D info->headers;
> 	bool have_devices =3D false;
>@@ -468,7 +468,7 @@ static bool intel_vsec_walk_header(struct pci_dev
>*pdev,
> }
>
> static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
>-				  struct intel_vsec_platform_info *info)
>+				  const struct intel_vsec_platform_info *info)
> {
> 	bool have_devices =3D false;
> 	int pos =3D 0;
>@@ -519,7 +519,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev
>*pdev,
> }
>
> static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>-				 struct intel_vsec_platform_info *info)
>+				 const struct intel_vsec_platform_info *info)
> {
> 	bool have_devices =3D false;
> 	int pos =3D 0;
>@@ -565,7 +565,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
> }
>
> int intel_vsec_register(struct pci_dev *pdev,
>-			 struct intel_vsec_platform_info *info)
>+			const struct intel_vsec_platform_info *info)
> {
> 	if (!pdev || !info || !info->headers)
> 		return -EINVAL;
>@@ -578,7 +578,7 @@ int intel_vsec_register(struct pci_dev *pdev,
> EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
>
> static bool intel_vsec_get_features(struct pci_dev *pdev,
>-				    struct intel_vsec_platform_info *info)
>+				    const struct intel_vsec_platform_info *info)
> {
> 	bool found =3D false;
>
>@@ -622,7 +622,7 @@ static void
>intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
>
> static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_de=
vice_id
>*id)
> {
>-	struct intel_vsec_platform_info *info;
>+	const struct intel_vsec_platform_info *info;
> 	struct vsec_priv *priv;
> 	int num_caps, ret;
> 	int run_once =3D 0;
>@@ -633,7 +633,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev,
>const struct pci_device_id
> 		return ret;
>
> 	pci_save_state(pdev);
>-	info =3D (struct intel_vsec_platform_info *)id->driver_data;
>+	info =3D (const struct intel_vsec_platform_info *)id->driver_data;
> 	if (!info)
> 		return -EINVAL;
>
>diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
>index 1a0f357c2427..d551174b0049 100644
>--- a/include/linux/intel_vsec.h
>+++ b/include/linux/intel_vsec.h
>@@ -200,13 +200,13 @@ static inline struct intel_vsec_device
>*auxdev_to_ivdev(struct auxiliary_device
>
> #if IS_ENABLED(CONFIG_INTEL_VSEC)
> int intel_vsec_register(struct pci_dev *pdev,
>-			 struct intel_vsec_platform_info *info);
>+			const struct intel_vsec_platform_info *info);
> int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> 			   struct intel_vsec_device *vsec_dev);
> struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
> #else
> static inline int intel_vsec_register(struct pci_dev *pdev,
>-				       struct intel_vsec_platform_info *info)
>+				      const struct intel_vsec_platform_info *info)
> {
> 	return -ENODEV;
> }
>--
>2.43.0

