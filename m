Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46241A7677B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 16:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ECB10E40E;
	Mon, 31 Mar 2025 14:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUrw9Qn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E210E40E;
 Mon, 31 Mar 2025 14:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743430304; x=1774966304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7X/Ui8ycbkWlGYdLU5U96Ime3h0FNXS9k5KRA72U4lA=;
 b=YUrw9Qn8oljDfpGwM+7jzOLdIpZbZwUqZOTRBJEeCsz1gXrXgpJZtkBR
 a5hBLAxDPXYJRuy//IzpsrQPGDdk96KGH8zHt7dl7vznTwmKHZKgYyup7
 jDCQeIjOacaBNbMKhZEIvBVhZbFZpI6KhXMLzxj9KUqA3DvXxB7y4E9/J
 +csV+hzQ2KyVEKubPjGdws7+hLJQ6EU9tsILQ7v11j5O/nBccBY01l+ZU
 PUJWvl2okfI1z+q4wNYjKCxuhk49FX9jNVtEJD1OXuapKeiM9nWok/YiW
 f38upqH3jDZorH9cMxs0ZbJZAjmJf9cldADeEjYUOiQLsZN7LrLdznwzw g==;
X-CSE-ConnectionGUID: rY7yR31gTqOl4DwuDQvyiQ==
X-CSE-MsgGUID: DFhFEdxbSfaoWtg9AhzZJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47441327"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="47441327"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:11:44 -0700
X-CSE-ConnectionGUID: zYj4XmBnQs2XHZmY1lb4lA==
X-CSE-MsgGUID: WT5vnIu5SMKLvhlT236u9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126085580"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 07:11:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 07:11:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:11:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfN0Bd792irIjRBEVfTSNqVBPAv34BlQhtj/VbLdgG2tOqex9MhsQT9CDGDOkNqMogvgVKcvpvibaHJjbPKO1sxJYaKCtNHLlciEBs7MFGQagbKCzznLCDKoDfCjZLxVQ61BmHgM7k03+8tVpzO8LRpCCzw9TuyasRt8AOfV4xXSQ6t0AxekloD83ggwZ+HrF7OkDHUALOo2Y71ybkqxBYTdYN5c4eL53gjCGLak1jR2XNHGqqZfGLmAuh7c4gDHzyczkDqqCm3q6onlquRQ/OmY+zSyk27teMrXBGXxl4QtYXqW1dfpksPZJHaP+mmlGFiE113++fTyBiLmhcbLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxyON/xajr+XLKTf0yBKg/2MAAfam2IySAe/c6RWdk8=;
 b=Xx+0jgC6aSPtIi0DUXh9ijRvEilQJieA4DJibWslszyC7w4osErPok1UbryJhSh8K6ehJhbSSEqUO3+Rs5OH3gzus3b6CvtHX7ZaIoWMDNCU1rot7e9t3hZgHMP+gZEx+x4Z/+bhQJnPcjYB4bKRbfywdPRFIrVXZxcJppouYcV89AczXDx4ptSOc2jyaIMh9fi/ZvISRmpj5fmQXT9CMdpWRKznHB0oqokCiYqoHiz22L5n2hQ2yjBRfz1Et3mEXLb7Rmlh0Ph+KSezPKpLIBay3WPzKj/sazlyJNlzQq2/OvE2Z+oaBiui1KTK6U1Sadcbv4Mvl3a0Jvz901vYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 14:11:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 14:11:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v15 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v15 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHboCGw87RU8LjWcU6xdczf4h3r5rOM6qkAgABg9eA=
Date: Mon, 31 Mar 2025 14:11:11 +0000
Message-ID: <CH0PR11MB5444670DE8FD4DB6C9E11FEAE5AD2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250328204045.157914-1-jonathan.cavitt@intel.com>
 <2ec8b42e-c7a2-4102-9d45-2c9cd77197df@intel.com>
In-Reply-To: <2ec8b42e-c7a2-4102-9d45-2c9cd77197df@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7307:EE_
x-ms-office365-filtering-correlation-id: 9c936093-ab4e-4824-8c0c-08dd705de40a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZJS3ooFh5MYIptGStQCXmwpH1qeU4lBUGANTjOp0IYOOwCZJhN2VF1dpQahl?=
 =?us-ascii?Q?0bfLlcAvLAmt59RUNN4Gce/x7VSzFpAgPXg/guLqG4aLISDkEL1zfUDDQnU7?=
 =?us-ascii?Q?l3l/U/QDhChpypzADWaB4KmliW3jLObAb63tK32Q6fHOABh0fFDv0/9VNzzf?=
 =?us-ascii?Q?bxNVdfZ/6YU5+TUCqLZXtqbRhB2ISE1F/UhkZW3vEVxLcyw5eluWVl7G3F81?=
 =?us-ascii?Q?jiltCCMu4PXQIxlCSGiUuF428HMKMgEbnqpqa7lXclEo4UN5GqXfHR/UjGZJ?=
 =?us-ascii?Q?BCJ3rykVryx2BXCsHSsvJzjKch3BK59aWnYijGFKhsgq5uT93eF+dB0uibwn?=
 =?us-ascii?Q?03j0NSkZ7nm0UUE3fOiFKyVrsQr+YeCLLhnUdxqOXIJqHvdEqVLIn7A5cdeI?=
 =?us-ascii?Q?Y4nFHPWHlBYp/gg6cmnUI5rHHdd71AayLgpI54Dc4wq5ByKnJFwPzzYv+Rkh?=
 =?us-ascii?Q?orRsG7W5HK/17jEjg2x5mwedInOaV0BKh3VyQ17KHikDawH6yA6MPsfbYVxx?=
 =?us-ascii?Q?LM7Ttfi5A1Ye/Wl5SODiulPQrMA02pFgi/1gsoN82iRt+NPe0Od7gS8b7o5S?=
 =?us-ascii?Q?u6m2QqLLU10MUKQqxRNZsjWC1GJo2WYLKwz8i8bkHK45yO6bSo+LQeH9JPUJ?=
 =?us-ascii?Q?xg2IRBlWzgoH2E5DIIwoCUI9FEZNBdOso02L768cBWgswiQWoMF62m8Ry8yq?=
 =?us-ascii?Q?HJgyT2yXsUC7lRfClju4vkhfi+T2CPEBUmhDVih5MEXmSr+DHzDJ2zl4RafW?=
 =?us-ascii?Q?oeoQ/9A1BwgmAEdymZj6Ozn5H24d/9Y7I/m/i9uZs8sxL3cyT6doIzW5UToV?=
 =?us-ascii?Q?oDibtnfdSL2R3j6x0jxfOo/wIyGuZCCSicI580ftrx+ub7xtdDsSCZYxbzJH?=
 =?us-ascii?Q?NIJ5G36uC/TXSDUpCBKXn2pyYJ4tLXq8mUguRrOLmCKh9koQP3t2GboOVD1p?=
 =?us-ascii?Q?5McDM5+CyGBDs2ZgOZPyyll5DpjK8ijz9910/srYHoPvoNrKHCQDhtfcYrr8?=
 =?us-ascii?Q?PLaNW34RKCTNgmN5ib4yHxrn7DZ9dpLpzlsEAVT8eDEX93KpddocJWRie90g?=
 =?us-ascii?Q?WE80Y6mwEyCmZKMAR4YnttfaYYK3TxU3gVMa3QIyUKMQaLqamUMfgdAqm2yB?=
 =?us-ascii?Q?vQacm8iqTeMzCYEMxK8bc4hbfP4I+V0TVLBwjZCAwZ+KXqlIkvYBH27waPtw?=
 =?us-ascii?Q?Cjr6W9vjM58MuQTXCKLKly6G5YEBTeHKQsMYE6qce19VF5di95AGDBalxvuD?=
 =?us-ascii?Q?+ytyoP3cl+P00OBwJmm8SCCL4+sii21NwZ3p5fPIdo11+uaYmY5oVKGQtLO5?=
 =?us-ascii?Q?65pQKFIVsyyPJ+d5MSLr4eJb9lW8V//01hClVDhY+Qw1e0JsO5JabgcE1WjW?=
 =?us-ascii?Q?T3CpHQuzB9BCrmQQ0UlgO4O59YOpM6WYdC6BOAf8ScLMrbbjEkoByp/q09r0?=
 =?us-ascii?Q?kQT8RZnIWq1ufGSHJYcXf+zdh9D/nm6O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VAraTqq05YA+USRVjPtxEuvbkC/2xi73syuqqF9p8RKfqFM78GEhyzTNMMZ1?=
 =?us-ascii?Q?Goy1c65vY23v8ZB11CPeUIzytZfsnyCnKt4YEJdS54TQ6IztSYGyuK83qgiF?=
 =?us-ascii?Q?LjpEPf6v/Txs+JyyZ1xjicpTDu1kOSu3jRpaE/ILRY9D0sRylz5gPSksJAtM?=
 =?us-ascii?Q?xHUUfvxHIWnM04nQBRHki74QybhGoOAxYqY+wY9cSrzbI5vTg8Ksnj7CnN4U?=
 =?us-ascii?Q?WGwcOdQu2avkzDDp/HI7coG4OPd0gN5+Z1TikvWN9vjaHtzQbPQhn2BZSZf2?=
 =?us-ascii?Q?gnhxDa8Udyv8I6Xj13ye0enYU0ie36ltpNPLjF8KmzQGIfYgv9FW6nYo4HVN?=
 =?us-ascii?Q?55vUn122JhIa+NnCSdDg/sEGua7yen97Jr7TGYoIw/pczdfigCwHo4bP2cVe?=
 =?us-ascii?Q?xomtsIJl3/av+4jRaQZANtSWAAuacSuPdzGGCPTcIRlRquVPb84KNpK+mtcs?=
 =?us-ascii?Q?N8Op4P5GpEVVMC0mOEtJd4WwM9T+0zlMPPq9YAKkZGnhJmkI0tOAxExlJJSd?=
 =?us-ascii?Q?puVoT0oX+2e3Vt0DNK1Ac/FcmRS2pXHgFOLOB2VRK6MLH+X322zEcG+PABIY?=
 =?us-ascii?Q?1YcUEv4J1r7OzCmJc/XA6AQv/SME6UYQX4y7X0MUb3uqER+m+9i8lWuaBTem?=
 =?us-ascii?Q?b8ZhfWScsyaoMXhAxx4oSuW5YoFCUZXOl3kLEKynRLOLttvRc5N49QoRDuWH?=
 =?us-ascii?Q?SKFrXUtt4CQyrjRYbZu3UxaLBcMHM+o1KOWYolkp+Suuqzq9uJ5Tp+sTAVH2?=
 =?us-ascii?Q?pszmGKlVaELB2vzmjh56qflI5Rzq/A9mvI/6jVwqrWRZKp4Fnw/leB9WHxGM?=
 =?us-ascii?Q?ktpHkcTJD2Xg7KbFCrXNDq3UnRXEx5a9pzVnkE2CzP1sIPdD4CSImF51+uSu?=
 =?us-ascii?Q?db1fvvtTLrhnDG4P1DzCvtyWhKq1hU6CfFz08YYTacD1MgD4knUv3nEza7u9?=
 =?us-ascii?Q?ZnGnfXOY+WP1SNQ/c+JRUY1HnpWRzVTmY8z0M8I/J0KlYbdbFwrlIbS1xCf+?=
 =?us-ascii?Q?8IpbDrd3JVHDN2LOo1x1d9IH2nwFUPomdacClpKK/P/jHwvz1627/pQ35Zus?=
 =?us-ascii?Q?mos2bSOQgCrerrF/snCulpENnlOX+hAdOYecALcXoSdG0Xf8KParadZzrU+8?=
 =?us-ascii?Q?E12UlZXkFjoxlPVFcpK/LIH6LPoiLUUr8cmmWzrHmD23oTussKT6jhn39SR1?=
 =?us-ascii?Q?3H3DvcEYAVrDlVcwq7DqPJncQoETNJ1zJcSq89AYhSnr2pehp/4ielVs7m8u?=
 =?us-ascii?Q?PBE/chW3Ny0PECUWiaZZzKunr2Fq+tyk8FFOO9F97h1s2gvAMENRDrOMzPJ7?=
 =?us-ascii?Q?55BJkBvf2wPeKAVCDSLOqpRbARGp6615N81vAxWRdWRlsUqjTS/pKgy5wF7G?=
 =?us-ascii?Q?TdYc/TT9CkiveyYbUyudtduCWlSL3jiIf5rA2N/6IFuwRwn4CnFVPD5Ok45W?=
 =?us-ascii?Q?91u55TLh4FHcziJeL/afQSwryUpo8Pg+q4aBo10LjvY6H1pMBT/Cb23nnYAL?=
 =?us-ascii?Q?R082jMrRdRXccUCG5JyT07qOWtPxST/WbzVbaGnEoansYbAuleaPhgeTwVV5?=
 =?us-ascii?Q?JNcHgTm7Hgq+4/mV/BFvzJYmlIcvOs7Il9sRMuJH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c936093-ab4e-4824-8c0c-08dd705de40a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 14:11:11.6022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdEbhh0qAYWYnPvTB0dn3RdLObZszLc1NNJdq+i4Wq+kgYu9TIEyutZrsOHF5XTYNHWFtM/scry9KKnVGfNNdNYqKER4bGahZh/HC9+BZ8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
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
From: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>=20
Sent: Monday, March 31, 2025 1:18 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wa=
jdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <=
raag.jadav@intel.com>; Harrison, John C <john.c.harrison@intel.com>
Subject: Re: [PATCH v15 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> Hi Jonathan,
>=20
> Are the pagefault reported for any unit in the GPU (including command=20
> streamer?) or is it limited to execution units?

Currently, the only faults that are reported are pagefaults that are handle=
d by
the XE pagefault handler (pf_queue_work_func), and that are reported on a=20
userspace-visible engine class (I.E. not "reserved").  So, I think that mea=
ns only
execution unit pagefaults are visible?
-Jonathan Cavitt

>=20
> Thanks,
>=20
> -Lionel
>=20
> On 28/03/2025 22:40, Jonathan Cavitt wrote:
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen faults.  Only pagefaults are saved this way currently, though i=
n
> > the future, all faults should be tracked by the VM for future reporting=
.
> >
> > Additionally, of the pagefaults reported, only failed pagefaults are
> > saved this way, as successful pagefaults should recover silently and no=
t
> > need to be reported to userspace.
> >
> > To allow userspace to access these faults, a new ioctl -
> > xe_vm_get_property_ioct - was created.
> >
> > v2: (Matt Brost)
> > - Break full ban list request into a separate property.
> > - Reformat drm_xe_vm_get_property struct.
> > - Remove need for drm_xe_faults helper struct.
> > - Separate data pointer and scalar return value in ioctl.
> > - Get address type on pagefault report and save it to the pagefault.
> > - Correctly reject writes to read-only VMAs.
> > - Miscellaneous formatting fixes.
> >
> > v3: (Matt Brost)
> > - Only allow querying of failed pagefaults
> >
> > v4:
> > - Remove unnecessary size parameter from helper function, as it
> >    is a property of the arguments. (jcavitt)
> > - Remove unnecessary copy_from_user (Jainxun)
> > - Set address_precision to 1 (Jainxun)
> > - Report max size instead of dynamic size for memory allocation
> >    purposes.  Total memory usage is reported separately.
> >
> > v5:
> > - Return int from xe_vm_get_property_size (Shuicheng)
> > - Fix memory leak (Shuicheng)
> > - Remove unnecessary size variable (jcavitt)
> >
> > v6:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> >
> > v7:
> > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > - Fix double-locking error (jcavitt)
> > - Assert kmemdump is successful (Shuicheng)
> > - Repair and move fill_faults break condition (Dan Carpenter)
> > - Free vm after use (jcavitt)
> > - Combine assertions (jcavitt)
> > - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> > - Remove return mask from fill_faults, as return is already -EFAULT or =
0
> >    (jcavitt)
> >
> > v8:
> > - Revert back to using drm_xe_vm_get_property_ioctl
> > - s/Migrate/Move (Michal)
> > - s/xe_pagefault/xe_gt_pagefault (Michal)
> > - Create new header file, xe_gt_pagefault_types.h (Michal)
> > - Add and fix kernel docs (Michal)
> > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > - Store address, address type, and address precision per fault (jcavitt=
)
> > - Store engine class and instance data per fault (Jianxun)
> > - Properly handle kzalloc error (Michal W)
> > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > - Store fault level per fault (Micahl M)
> > - Apply better copy_to_user logic (jcavitt)
> >
> > v9:
> > - More kernel doc fixes (Michal W, Jianxun)
> > - Better error handling (jcavitt)
> >
> > v10:
> > - Convert enums to defines in regs folder (Michal W)
> > - Move xe_guc_pagefault_desc to regs folder (Michal W)
> > - Future-proof size logic for zero-size properties (jcavitt)
> > - Replace address type extern with access type (Jianxun)
> > - Add fault type to xe_drm_fault (Jianxun)
> >
> > v11:
> > - Remove unnecessary switch case logic (Raag)
> > - Compress size get, size validation, and property fill functions into =
a
> >    single helper function (jcavitt)
> > - Assert valid size (jcavitt)
> > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> >
> > v12:
> > - Remove unnecessary else condition
> > - Correct backwards helper function size logic (jcavitt)
> > - Fix kernel docs and comments (Michal W)
> >
> > v13:
> > - Move xe and user engine class mapping arrays to header (John H)
> >
> > v14:
> > - Fix double locking issue (Jianxun)
> > - Use size_t instead of int (Raag)
> > - Remove unnecessary includes (jcavitt)
> >
> > v15:
> > - Do not report faults from reserved engines (Jianxun)
> >
> > Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
> > Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: John Harrison <john.c.harrison@intel.com>
> >
> > Jonathan Cavitt (6):
> >    drm/xe/xe_hw_engine: Map xe and user engine class in header
> >    drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
> >    drm/xe/xe_gt_pagefault: Move pagefault struct to header
> >    drm/xe/uapi: Define drm_xe_vm_get_property
> >    drm/xe/xe_vm: Add per VM fault info
> >    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
> >
> >   drivers/gpu/drm/xe/regs/xe_pagefault_desc.h |  50 ++++++
> >   drivers/gpu/drm/xe/xe_device.c              |   3 +
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c        |  72 ++++----
> >   drivers/gpu/drm/xe/xe_gt_pagefault_types.h  |  42 +++++
> >   drivers/gpu/drm/xe/xe_guc_fwif.h            |  28 ----
> >   drivers/gpu/drm/xe/xe_hw_engine.c           |  24 ++-
> >   drivers/gpu/drm/xe/xe_hw_engine_types.h     |   3 +
> >   drivers/gpu/drm/xe/xe_query.c               |  18 +-
> >   drivers/gpu/drm/xe/xe_vm.c                  | 177 +++++++++++++++++++=
+
> >   drivers/gpu/drm/xe/xe_vm.h                  |  11 ++
> >   drivers/gpu/drm/xe/xe_vm_types.h            |  32 ++++
> >   include/uapi/drm/xe_drm.h                   |  79 +++++++++
> >   12 files changed, 453 insertions(+), 86 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> >
>=20
>=20
