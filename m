Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F8AACB5E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8422F10E702;
	Tue,  6 May 2025 16:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlvUpo6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FD810E702
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746550017; x=1778086017;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qJRQQN2gw8tiCsUI7xm33ReHXfeeSCqwksPWn6c+Qns=;
 b=RlvUpo6IGSpXJIuvSTFgULce+byORdFMGL86bup12f3MsQpE9g40CVQ7
 14mx4odh0ErbpkJrPhBF/INthsoMGKO4MJ+lVbfT+6WnL1tmC3OzV5TAI
 uxVUoMw5ee/74YHSf1G8/QobWZAcsFuKeUc7se6oCtIrW4nHfO0bnvBH4
 FMvn3ZLltPX2cvTNcebsAhfpQi9V7oWB9FqQFYAp7VlQPk3n3R7eCR//q
 HlDV8FDNmlZxLlXIAp5iBjVuKCPuL5lqtt1WBrFW9pd8FSL6JO+Vn1XWh
 FJL94pGw9lO0OI+LWqFRYmB1SYxABdm0YrAVjIQVQR8PrWO2FmpuH28jy A==;
X-CSE-ConnectionGUID: aAErQgWiQ6S9JzlhDw+aAQ==
X-CSE-MsgGUID: tDEwbp8zRXisBG5vDMhkhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47493698"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="47493698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 09:46:55 -0700
X-CSE-ConnectionGUID: MZjuHZNrRN2BPlyuxVjeqQ==
X-CSE-MsgGUID: uMEQN1HERaWLP/C3Phaovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="135385518"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 09:46:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 09:46:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 09:46:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 09:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgTveR9DkLA3lLxEY0hEB7Fe5hJBYXLlfAmAPzze8a716n50ROAfVzW6NnVP5r64ITF9apptPfOi3P4bYQ/Cvl4F/qp1m/2Nzq16wu0SdZqXI4Efk6Xl2CDtjIFSBQcLqXTiay5h8msbYddzIPdCj8cay8K85YNuiKI/HFuu4RLD+SSqmpBPK2vkYKiSYOwwBGVnQsLfOrLAA+y9V5n44foXAsb8lOuyqV0GpBl7pjlSHUmOYRQxIa4XzRBbU1jWt4XrysIMHgkZ7g99RSVovc0oR0mZZ9SwhIMvZnfbMn7o6CcBOC+h2LTRIUXmJjeNc85FMw7SRbdX+g4wwo1MGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJRQQN2gw8tiCsUI7xm33ReHXfeeSCqwksPWn6c+Qns=;
 b=mSQGsbvKA8XP4FIZKbZnqzC5QMkfnTM8TBW8TUO99Q2t80ob2R4//+TO94Fjoi3NrVa/tJ6BEALM834VDptlEALUjv4p8CLDAZOgUv5Ghej5KjWLycjcM4RDjBqMDxT78Z2XYOxER5S0LfU4bpj8fsR00rAXFk+T2ReLjLT7eYFl1bOrNQ1sWNiJReAq3KIPXnNqGFvGtvXve6N3K4OplopMZWONbMR+GjIiFnPdH9MYZwiU6msqUxdznE2Sxu3uNa9PLFJRmmeIHrMjCE5aiQrnI8mc+lbhj8DV3AhDQxCt2SJOiSkGyD1Mmuw7bfPpNE1Sz4UH0B9L7K/ECzdJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 16:46:45 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%7]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 16:46:44 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: RE: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHbveDGUI4ch9Wax0+wshHtMZeSmrPEbDcggAAE0YCAAV1kQA==
Date: Tue, 6 May 2025 16:46:44 +0000
Message-ID: <PH8PR11MB6879321F612C70117DC8A656FA89A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
 <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
 <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com>
In-Reply-To: <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|DM4PR11MB6430:EE_
x-ms-office365-filtering-correlation-id: 046901a2-3306-4ea6-729c-08dd8cbd95f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MUM1UmgvMElRTUYwekc5VmdzdHVqdEkvek5jTjJYS2NwWVZVWUs1eXRZcUZZ?=
 =?utf-8?B?RUk2NEIzaXNtUW9wUDhDRUZqcmNFN3lsZlVoc0hyalF1eW9QK2FrTXhwQ1Nm?=
 =?utf-8?B?VkptMko1bHIyc24rcElSRllBVWlSRFk0NnZhM3ZuNTkwVWROUlZQSnd2Rnpz?=
 =?utf-8?B?Y05tRlJzT0JHQ3lreU14bFpyOGdkZUVGdUhvZXhYV1R0NG41WEt5NDlickVt?=
 =?utf-8?B?RzFFUG5SeGRXcC9Eb0d3NjFpV1A4bzlTQkRCeWZzNHptTnk2RWh1WThMbmVr?=
 =?utf-8?B?WE0yVmNPekNRNklrcHFXNkx5ZDhOZzEraXNqY0hhamI3RnFGSDBRYkVMb3A2?=
 =?utf-8?B?TGhyVjBWUlNNTDEyTU5Hbm1VcmEvSUU0QmVrSU9GZ3JNb2hOWFFLZ0JCSmRD?=
 =?utf-8?B?b2NLQVpzZCtmNTdJSkxYbDB3VTlNYmJLcG4wZ2J2MTkyUnNCdzlxK0lLL0dL?=
 =?utf-8?B?MmlHQXY4QzBHRDdnOGpBbzJVTS83RkUvY0duYXBpdlhxRFBVWVR3YlFpaTIv?=
 =?utf-8?B?UHZkSnFiMENaZTIxQ3NDN3ptZ3Vtbmw0M1hIcUl2djJFRjh1MEtJOXdqaEdC?=
 =?utf-8?B?NDRQa1lUc0RST1lESzZobTVhYmRNb09zY1dHSFZaQ0sxblBvQUgweXphRDhN?=
 =?utf-8?B?SFRGbTJrMDBLN2p6SUdvZHVzbDZxRmNkK25Fc2d3dXB6MWZEcHJUbHI4ZStt?=
 =?utf-8?B?L1o5M1hEOTVoOHNKbFUxTlpJTDlQY3RFMEpJSENIb21sQkkwdyswbTdxQjBw?=
 =?utf-8?B?cFJwY0hoUkFGZG8vTUtVNzdKY3Jmbmw0UktDU0Z0Vm5JUnh5WVNhYnVwNzhC?=
 =?utf-8?B?ZDRVSHVLeUNQWTVTc1FHVWVJWnZCSmR3WDJha2htbEMxVno0eGdjdk1rMUFO?=
 =?utf-8?B?RjJnOEFmVVZKaFRQVHJkZEl4SE1IT0ZXdU9VZVQrRUtMNU1KSmhyMWNUVG9C?=
 =?utf-8?B?L2VQQ1BPSTBheCttS1NoMU16blN2YkdwV1NHL1hhT01sL0FIbWdaU0VqMllE?=
 =?utf-8?B?aitxMVJtd1gva1o0NlV3U1dDeXpVZ0d0UkR1UnFNdmxnTDltWCs5MHcwcXYr?=
 =?utf-8?B?MGVER3MxUXZ3eUtaaE9hL2I4UUVPbTAxREE5QUNsU2RBUWRYUWpOdmMwemlx?=
 =?utf-8?B?blR0Uy9TWnltNm1zaks0TGVIRk1VYlpnVUs4cmFUbE1Ob1kzMmMyYXYvcms3?=
 =?utf-8?B?VksrdVJXWmhROFZMVnZRM1d6ckRCdmlLUUJWaDZjclI3VnFtN2dNTk5leklx?=
 =?utf-8?B?NkR4cEYzdkt2RXk1OXE3Vzc2b2szRmlQRnNyYmlFbERBTlQzbmNSZlhzUENu?=
 =?utf-8?B?dnpNWEhBSUFpTmczV1AvV2J4K0EraW5nbWYySVU3RnRRWGdCa3htb3V3L3pP?=
 =?utf-8?B?VStSNmRIZi8rN0Raaklld0pXckhqa05MQWxvWitKczVYUmZ5Y1RibUZvcFJX?=
 =?utf-8?B?NUptVGpKYURrSG5PWVk0T2ZaK2Y4dExsTWlCYk5zV1F1bkZvMjZmV0VJYlZO?=
 =?utf-8?B?c3JEMzZ1Z2JwY0NMQUhtakZnNGhDeEZHdGF4eG5mVEdYZzcwWVVtNEVkdUJ4?=
 =?utf-8?B?WU5XeUN6UkhKNFBhUmhYQ3dRS1BpM0dmVXd6M3VuTWRmNWlPQW16UVlnSXlj?=
 =?utf-8?B?elRXQUlLVk9UbTR4WnhXSzBJeXJDVVBXQzUyY1ZSTFlnbFVUbGU5TjBxWjBl?=
 =?utf-8?B?emVnVEdtczNhUDhDOXNOWFlybTR4Rnh1bWJrUFV5dFcvSklOZGErQk42SkY3?=
 =?utf-8?B?NG9uUkVpeUpZOEdIVUZxMmpRM1VlWmloa0RCejlqNi9iRDhxRDhVZ2ZjNGtq?=
 =?utf-8?B?Yyt6K1dYNTVKQVA1VGcvNHd0WE5PNkl4WEdwV09OcU1sWi94cnhFRUJaSHpZ?=
 =?utf-8?B?TXlEc3RBZ0VkcWVYTVJ0TDB2Skh0c0lDZDBmOHgxa2loSTVYZUcwdldKUnQ3?=
 =?utf-8?B?T3FMU2xsZ09rUHVmQ3JKYmdJZi91QTZQSUpDMTFCUE01TUV3WlcxUG0xZVZT?=
 =?utf-8?B?RDlTTXkrUmRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUt1VGdIa0xwT2d5SytaK0FMSlA4YXY2eEhCTmt3Rk1hZit1TVhsYzQzaEQx?=
 =?utf-8?B?N1VZRVhGRFBqcmhpTjh3ZVEwaEE1OHZja2RRUU1BcC9JeWpDQm9PZUYxVkRB?=
 =?utf-8?B?cWpyMDdtSGRCU2plb2o4RjZHaEl3b0ZCV213VDFOSGNmOE1VY0hVSjVxL3Yr?=
 =?utf-8?B?eENBajhxSTY1TzJLWitwcDJ2R1Z3azBuVm95clhaZExWdGwrdjBoZVF5UkRB?=
 =?utf-8?B?TS92bFBSbktua2xZNXdUWW1MazhqWlRtTVFZeW96SklhaGhJY05Nbk1GV2xs?=
 =?utf-8?B?TldDSHViWGpHTkliVEE3bzJOdEQwQ0thb3dqSTVudnJCdE90ZkNJWnFMMEN0?=
 =?utf-8?B?SG1YcERlNkVyeERoMkJNbktua1VycWRuY3MvMVdpYUVRQXJGbkYwT3JCTW9Y?=
 =?utf-8?B?OWFYYWZYM3pHZmRObXJrR1gxRVBmb0hDb2JCZzJST0hLZWozUFpTWjE0MzJY?=
 =?utf-8?B?TDgvNFc3ZzlTSzlrdngxR1BOUmIrSkVyUWlQcE9obzBGRnFvdllCUHZkdjRo?=
 =?utf-8?B?WGFqeDhwelRiS00vbkpwMmN0d282ZVhQdnBBamRybTlZV2FqMW1OTXpFd1Bt?=
 =?utf-8?B?c3RKVXg3dk5EdFhQbmY3V29QaUFheDdTT1pZVlJqTitPT3ZhQmFJQmRCOHpY?=
 =?utf-8?B?L2tZWXVzSGgyMVFQVWIxbVZYT0dEZ1BibC9rZVdDQ09kQnUwWnhNSEVaWmpH?=
 =?utf-8?B?UTdLN0hWWE9WMUI4cTdqNVZxVTFxU3ZRQU5yc3JNeitsWlNNbWNNS0tRU3Vk?=
 =?utf-8?B?Y3NXYTZCRDBvN21jdGNnMnkrSUwyU2REdDFsaFhzZ0tSQXdxL3pFc1cwdGlL?=
 =?utf-8?B?MnJVcDVIakMzbm0xZnJ6ZHExbEw0RE1qaWxpV25DYm5rN1hZTVhpRHpSSklY?=
 =?utf-8?B?blhIOTNaeFh4VEdmYkd1aWtlTVV0MVRRTnVRUmV2NG9WTjhoVVpscXN0Z1Nj?=
 =?utf-8?B?NFBMVFFjK1krMFRZK3h0SmlZZjdXa2lKTXhGbUVTcjNCUzl1bjZLYjM0dnNp?=
 =?utf-8?B?WkhUdVMrSDVhcEhHM0RaVktnZGg2QTFnRmgzaDZhSkR4YnhOdVBkYW1SQ0tW?=
 =?utf-8?B?aWpWcUo4d1grT3paeEJVYit4ZTgvWlFkNTYxYVVwMU1qaER4RkNScSs4Wnhl?=
 =?utf-8?B?MFZ4YXI5YWk0cU5IRVJMVUtad1Vock5YblhNVFdySkJ5cVVSRG1WRnhCOWk0?=
 =?utf-8?B?YTFaR2J5cGlTNnVoaTJnS0hOZmM0SHZjZlpkNVVhZzNyai9BR0FVN3dpUEtt?=
 =?utf-8?B?UU5sZ1RKT0d0QkVUemhBaXlKY3dJR0tzT3Jud1hrQWNieENZZmdZZ0x1Q0Z4?=
 =?utf-8?B?OVhKZ3hRbXp0RnNKbjZ2citRUkdWYXA3Ym1wbHpENUtzeG9TOUFDSU9vZ1pV?=
 =?utf-8?B?bExia2FUY0dUY25FT3RUTlVScmQ3NnE2VlFTbE9RcVhDSnNYZnNZTU9IWFNy?=
 =?utf-8?B?UXpyeWlzc3lURm1rVU1xbmV1K0czSEd1TXZBRDVwNno0M1YwMFlPMld5NHNU?=
 =?utf-8?B?YTJHY3R4NyswaHNtSFVqaksxLysrNkw1V2VHd0l5MVJyWWVlUlFVc0Y2U3lI?=
 =?utf-8?B?ckdOdE9rcG5pdXp5QnV2dlZORWkxWFk3aW1lRVJ0bFllTUw3OWJUL2tHdFdq?=
 =?utf-8?B?ZE9DSnJ1Q2FoZHhEblVOTXF4VVc2MVduQ0Fpa2NHMlEwYVBid1FucExOY0lT?=
 =?utf-8?B?SENORmNZNWNIYTJQbWIreENkeGdtdEZJaEpUcHJoRHdKN2hUQ2F2Vlg2TU11?=
 =?utf-8?B?YTBpUlBLMkhuWkFlVUFSL3RVdUJJd0tidjV4UnVWaFl4bEVML3A3QjQrSVkx?=
 =?utf-8?B?TTRBcWFNZjVGZ1BJMi92YkdneVBkL1RHWmdvYXpsRVh1bGxvcUoyWFhxUVpN?=
 =?utf-8?B?NWh4cm5FeW95QUE1WkRtNXJjcGRsVDZ5SHE0ZlNJMDBaTU44S3pmbmNzK3Ri?=
 =?utf-8?B?RU12QVZKUVg3VENWSjN5d3BkTnoyM0d5MXRuU1pEd1daVVlUQnFsdSsxejd4?=
 =?utf-8?B?RlR5ZVFqVkQwWmRwSE13RjU4eGhWZktid1BuN01pdmVyaEYrR3E2RWo5eEQ0?=
 =?utf-8?B?TkhDc05NSVJ2cFZJTVJ1ZUdGcitwQnMzbElVMFhFOEZOM25XejVKTVVWblRy?=
 =?utf-8?Q?h1Tqyb31MwPP8E/B1LereHaVN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046901a2-3306-4ea6-729c-08dd8cbd95f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 16:46:44.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU+bKjXT46tUEpipIU2mP7J2M6muJi9F0GEtcuZYaAImkjDWioc1pOqRM0RtS/PJGcFXXm+UaG5wmeVGYa1WPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAvMl0gVmlydGlvLUdQVSBz
dXNwZW5kIGFuZCByZXN1bWUNCj4gDQo+IE9uIDUvNS8yNSAyMjozOCwgS2ltLCBEb25nd29uIHdy
b3RlOg0KPiA+PiBJIHRyaWVkIHRvIGFwcGx5IHlvdXIga2VybmVsIHBhdGNoZXMgYW5kIHRoZW4g
c3VzcGVuZC9yZXN1bWUgZ3Vlc3QNCj4gPj4ga2VybmVsLCBpdCBkb2Vzbid0IHdvcms6DQo+ID4+
DQo+ID4+IHZpcnRpb19ncHVfdHJhbnNmZXJfdG9faG9zdF8yZDogbm8gYmFja2luZyBzdG9yYWdl
IDINCj4gPj4gWyAgIDIyLjkwOTQ1NF0gW2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5j
XSBFUlJPUiByZXNwb25zZQ0KPiA+PiAweDEyMDAgKGNvbW1hbmQgMHgxMDUpDQo+ID4+IHZpcnRp
b19ncHVfdHJhbnNmZXJfdG9faG9zdF8yZDogbm8gYmFja2luZyBzdG9yYWdlIDINCj4gPj4gWyAg
IDIzLjE2OTEzOF0gW2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSBFUlJPUiByZXNw
b25zZQ0KPiA+PiAweDEyMDAgKGNvbW1hbmQgMHgxMDUpDQo+ID4gW0tpbSwgRG9uZ3dvbl0gSSB3
aWxsIGNoZWNrIHlvdXIgZmFpbGluZyBjYXNlIG1vcmUgY2xvc2VseS4gQXMgeW91DQo+ID4ga25v
dywgd2UgdXNlIHZpcnRpby1ncHUgZGV2aWNlIG9ubHkgZm9yIGRpc3BsYXkgZGV2aWNlLCB3aGlj
aCBtZWFucyBJDQo+ID4gdGVzdGVkIHRoaXMgaW4gdGhhdCBzcGVjaWZpYyBlbnZpcm9ubWVudCBh
bHRob3VnaCBJIHRob3VnaHQgaXQgaXMgZ2VuZXJpYw0KPiBlbm91Z2guLi4NCj4gDQo+IEkgdXNl
ZCB2aXJ0aW8tZ3B1IHdoZW4gZ290IHRoZXNlIGVycm9ycy4NCg0KW0tpbSwgRG9uZ3dvbl0gSG1t
IEkgdGhvdWdodCBJIHdvdWxkIGJlIGFibGUgdG8gcmVwbGljYXRlIHlvdXIgcHJvYmxlbQ0KaWYg
SSByZW1vdmUgYmxvYiBndWVzdCBmcmFtZWJ1ZmZlciBidXQgSSBjYW4ndC4gSW4gdGhlIGNvZGUg
Y2hhbmdlcywgd2UgYXJlDQphdHRhY2hpbmcgdGhlIGJhY2tpbmcgc3RvcmFnZSBmb3IgdGhlIHJl
c291cmNlIGR1cmluZyByZWNvdmVyeSBwcm9jZXNzLg0KDQorCQl9IGVsc2Ugew0KKwkJCXZpcnRp
b19ncHVfY21kX2NyZWF0ZV9yZXNvdXJjZSh2Z2RldiwgY3Vyci0+Ym8sICZjdXJyLT5wYXJhbXMs
DQorCQkJCQkJICAgICAgIE5VTEwsIE5VTEwpOw0KKwkJCXZpcnRpb19ncHVfb2JqZWN0X2F0dGFj
aCh2Z2RldiwgY3Vyci0+Ym8sIGVudHMsIG5lbnRzKTsNCisJCX0NCg0KSSBkbyBub3QgdW5kZXJz
dGFuZCB3aHkgaXQgc2F5cyBpdCBjYW4ndCBmaW5kIGl0LiBEaWQgeW91IGdldCBhbnkgZXJyb3Ig
d2hpbGUgZG9pbmcNClZpcnRpb19ncHVfb2JqZWN0X2F0dGFjaD8gDQoNCldoYXQgbGludXggZGlz
dHJpYnV0aW9uIGRvIHlvdSB1c2UgZm9yIHRoZSBndWVzdD8NCkFyZSB5b3UgdXNpbmcgdmlyZ2wg
ZHJpdmVyIG9yIHN3IHJhc3Rlcml6ZXI/ICANCg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0K
PiBEbWl0cnkNCltLaW0sIERvbmd3b25dICBUaGFua3MhDQo=
