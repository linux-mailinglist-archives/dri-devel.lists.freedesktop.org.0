Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B2A43433
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914BA10E370;
	Tue, 25 Feb 2025 04:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Saf40MOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826EF10E108;
 Tue, 25 Feb 2025 04:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458392; x=1771994392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qcrZXKcBTZsKs4Q0hfU/S+ZRQwDl1XnjPifPh4FiNcg=;
 b=Saf40MOX/ciHCvAXxSrWb1SQmjJCCE6mtB91ylTgl4gKe+EXrPSl9aNg
 dCaOwEfyY8UeFMN0nMNpIQgCmqB5P1qepNembq1j3SpA3zw6r6ND1mpUD
 6kX5hkUQdM4YoT4cZ6h0KIqIYOSKpSjTuZEOadPHxmP5L/Yfar4VNvZZ5
 RHJyOy7ckwU1D8k/CILIwTzx6XYcEZ2/U58rnpa0+xKk2a0aCg+itmyPH
 zLAzry5wU9viGUygjxd2Q3jGKP8plXoYDEwHkX0GNPFusMut/4H3PJTRD
 2A1I9Ge6VG457/Ih/eUHhwNkYavE0YicSFLjKuawhczs0pMAt2BmE1CPH w==;
X-CSE-ConnectionGUID: 0Z2yH0hQQ2Cu7THRa9KMBw==
X-CSE-MsgGUID: QHPYPskARgymvGqXXiY74A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58788297"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="58788297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:39:51 -0800
X-CSE-ConnectionGUID: Jr2v1FuFSQ62So9O7c7y+g==
X-CSE-MsgGUID: W3FY3mIoQ0+NzAx9pNEwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116253940"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:39:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Feb 2025 20:39:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 20:39:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 20:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPE66fng/kiHCQvGpp0+1WswDLJGMzA+MJUx6HH+PYAesxnJr0/BiEqeUCK0AD5bNBTsiEGI4tIcGDRBGBtaQv7CYHbMjN2GPCyUHP34jtS1NzzHKWK0Mdfe3NNbIitapD1OgbcRNgzxDqjZ0j8k3IPpDiagVakgsmt0CYEBub5ksYpf0eEIrq0OtzuHu24Qcjx7vwCR7GkbmaE0pNEbbKLeKKanak8bb4wV1p+PNyf98EbdpBY6FQSQ7mTWA2NvYXSe/FszGZGimpxFSv+AFOteO3MQYwR6j3NvMaRBQ2QEKyHHkY33phwUh4Pz5jfEnygK5ydPhVTzIV6jhi2+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcrZXKcBTZsKs4Q0hfU/S+ZRQwDl1XnjPifPh4FiNcg=;
 b=SBixad7QhPqD58inNrqdc6acf2G6ztHQxy8AO3uEwREy/0w/Ev1Te6A9c9rFQii9PhJhHReSK/mMk2vAeHvmRHEOz8gEUDbASDFB6VBqG909xJhVgTfzMBGn8fQmp7XsWUjgbneMK0CruS2YfqiCYVG++JOiqZ8nIY9A6PhXIV//m7d675FtiREU81NVmJVymezB7y9TIJXqhJTkclD0074IhDXvAbRuOrwuIzhluRt4YAcvP8O1kvGq9lNv63eAMT5bhglDSWWEelx/SIJRB2uWUIBolu0iizqvGLUYwtVFjio43hGdNIVDnJF52Kui9HkSthvRFcuZFvXEHlntQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 04:39:26 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 04:39:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbfUG+IH/7dwIcJUihK/kEt9BQL7NWqxeAgAA6S4CAAJ1LgA==
Date: Tue, 25 Feb 2025 04:39:25 +0000
Message-ID: <SJ1PR11MB62042F65378253D198C6642881C32@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250212113830.9027-1-tejas.upadhyay@intel.com>
 <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
 <xow55bqw5z2p33fq7z2pj75fhuogweynco2j76ku4skre6axoj@t7blqywfmsqb>
In-Reply-To: <xow55bqw5z2p33fq7z2pj75fhuogweynco2j76ku4skre6axoj@t7blqywfmsqb>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: lucas.demarchi@intel.com,rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6161:EE_
x-ms-office365-filtering-correlation-id: a3100cb3-4458-4f6e-f628-08dd555661e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ck1QaG5xTmpqTnhJRlVkUk0va3E2Z2NQalQ5bHlhUGJFKzVDNTgwSjJ6L096?=
 =?utf-8?B?Zk9idEovVWhkRitEc2ExQkMzVkdtKzN1elFSVlNRR1FqNnRyUjlqWFh2eVln?=
 =?utf-8?B?KzQ0Zzg1QWlhSlRYbFNvTHlWRWlLRWY1b2ZVc2NadDZTN28waFl3MGt2ZEcv?=
 =?utf-8?B?dnRnY2dDY2pOMmF6elJLaVFhaXFVQmR5OEZoZXBGR3J1UHlpdXllNDVLdXlx?=
 =?utf-8?B?Z2NtRkdDSlZGbWVteXJBS1BhdG5raHBuWWViOEdmK3V3MFVoKy9WOXpjY1ky?=
 =?utf-8?B?eXBnbFFEUUcyVVFLYUhzQkxmSzZZbnRKT3BMS2pDRHdBY2wwa2R0bkY1Mkk0?=
 =?utf-8?B?eFJlSlRheFRsNlpBZEZ5M3ljSGhSWjNZSEVla0xldjJTSUs3WnpiL0lobjV2?=
 =?utf-8?B?eUtvQS9XeDQ3Zk9UV2gybTYxakRvejI3ODlMdkZiOFBRU0hxRS8vbDcyY25C?=
 =?utf-8?B?NUl1ZEppQ29HcnJBbHJTY1p4RnNjako2alA1OUt4ajN0eHBPZ0k0L0t5VnBF?=
 =?utf-8?B?cGU5VTA3YTRkdWw4VGNUVjI3Z1RBRUtjdEMxeFZ5a2lhTEhiRTQ2NVBFSXp4?=
 =?utf-8?B?MUVKUE01QzZuZ0Y3Um52eS8zd05jZlBiUks0NGtuWVVQbVVWUlRnUHB0WGxi?=
 =?utf-8?B?RUREaVpRNTRXVE43bSthM1JaUlV4b0haY3VHdWduS3ZhbFNZZzZDWGtIWjFy?=
 =?utf-8?B?TlJPWVJKUkQwZU9xaE5uWldFVzE0ZFBIa2VrakhEd2Z5R1VOcWdxQ2lNOUk3?=
 =?utf-8?B?Q3hPcGRhRVFrc0p5SUxuRmZWc0g0MG1HS0NUU3ZxbS9PK1MxdU1hWjVhcTk0?=
 =?utf-8?B?aGNKNGtlcjIzZ0h3N01KWk9aTW45dGRIQTRHdHNFUG1nMExYeUhpMVNVWHhW?=
 =?utf-8?B?Z1BxVzZhTUlUY2ptK05ZSGNTQjhyOUU2UGJwR0NXYS8zcHpZa1hPRndiMWlF?=
 =?utf-8?B?dXZ4bEorNlBiaC9jSlpMdDloNXgrVmJrYnhhUHdEQmxtNFh5YjFIaGZQQ2M1?=
 =?utf-8?B?V0RrOS8rdHNWTkdMbTRObE5rellFRFA1dUdkeE1kNUF0dlRBclp6aW51NEho?=
 =?utf-8?B?Q0JzcWF0S1dycjRCYURaUnZwMExQbjV5QjVIZFp6LzVvUnBIWXFBMVZhU2xY?=
 =?utf-8?B?YXMxVERjb3dBRm1UQlkvSkV1d1RSZXJwNkpTRDVxaWZqeDlxemVsVE5EZlVW?=
 =?utf-8?B?VFB2UEltbmZ1ZDJEUlA4blh2WVVmS3FxNDUrUG5La1BpTlI3bng1N1czMG5Y?=
 =?utf-8?B?eEpZajF1dVlIMGEzSWlQVEJyMjd3QzJGWHJDQ3N4NktHbTFyTUZTdC9PNGRX?=
 =?utf-8?B?dUVGQ2RNMjRvS0tpQSsyTGMwNjJYdWxwTXlaWlkzNHNUTEtPb1E3YzFjTUJY?=
 =?utf-8?B?SFg1R2R4eE50VmlMaDlMS1dmZnA3ZDczSUMzSExJZkNieWR0bnkwK0hQeDBK?=
 =?utf-8?B?bUhtNkZvenpWY24wNERYTUlGWEI0THlRS2w5clE0aEZ5akZDVHF1YmlmNUFx?=
 =?utf-8?B?VUw0Um5mUTJNNWRjUEw3OFNodkdtUFZhNzFEbjdwZ1lEVXE1aGc2aTFxbG9C?=
 =?utf-8?B?V2NSUFpvU0pJb0EyelRJUUFVOXNJM0JYbGFNYU1UeFBkTHVLREh3SE10QXYw?=
 =?utf-8?B?V1ZObW5WR2cxY2hiS2U3b05HeTJNbHBhYnoyclFmbVdmUGtTcnpQV1l2T3FB?=
 =?utf-8?B?eGhBRGI5TjFaZ3hiL2laYWI3RkJNYlZnY0l5b1dsQW11dFd3dlAzRW1VUmF0?=
 =?utf-8?B?alc4bXAxQmwyaUxBbGVUOHR2Q0xDMWFwKzU4TVo0WGFvQVZTWjdvbHFxbmd1?=
 =?utf-8?B?YWdSZTVxQklOOTVvR25id1IrRVZ2TzJUaDhMQ294elRnMHQyZDNBcEgyWVY5?=
 =?utf-8?Q?BEIzwgrYVH2cp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tmg2REo0NS9tdTBkclM3clltemlJSUVhUVdnTGpiaGpERWYvSEZXQWhwWXp5?=
 =?utf-8?B?R3c3QUs0b3l5UDRFSi8vc0NzK1NhOUh5c1NjUDNtZjBrMlN4WW9rTS9peUta?=
 =?utf-8?B?MHVUanZSOG5aM3o4dWNxRlFwdGhuTFZ4TTBmcWQ3ZVF2cHJ3OEEzQVpCait1?=
 =?utf-8?B?ejhZWUIzdWVVZjNsakc0YW52QzZ4SU1HZGMrS0IxSm14a1VLY3RSV28wVDNB?=
 =?utf-8?B?L1l1Sks5NjFoQkhGVzV4SGtGUnNtY3NJYk1KeVVlS1ZVQUNsd29XTythRDlE?=
 =?utf-8?B?cldsV0hsQ3pWSE9pRk4vb3BVSC9Ua3dtZDZ1b2lQZFN2b043WlpiSXNxNDdm?=
 =?utf-8?B?eVBEaDdFc1BxZXpsNVhFZnhyS0I1SzNjTTRCTEZIdWFVdTJHSGxzNExvRlJs?=
 =?utf-8?B?WFg3eWtYUVlvcFhTSUM4YVFMVmUyUTlqd1NlYzdSK0pleWxrRlNJb3RpMUcr?=
 =?utf-8?B?bDVrbUJ0S2t3NEVkTjJMVUNPbGxBRWhUMWpaR0x4OE9qakVzd0pwRGd4S0dE?=
 =?utf-8?B?V0lvNW0yeXNyazM3cldJcXRiWG1NVEUvbGtRSnFhUkg0azVFQXZTY2p4YWFt?=
 =?utf-8?B?YlFrYlZ2WXdxWUsySHl3R1dJVWJFbFhSOXpBZEh5cTRLc1VJMTFwUmZwTU1z?=
 =?utf-8?B?T2dkdWRMRS92TFpXZGpZaEg5eUdEUmFJTHhJdFJUZ3NLVjNkT281RWdLUERm?=
 =?utf-8?B?VFV1ZVR1eHFNQVRMakx4M1NMYmdZeXRXdVJPMERlQjJHVnY2UWhYYzJvaHRs?=
 =?utf-8?B?V1RYekY2ZXY3M3NZKzRQQysxZWJLY003U3R1dmJkNTVrY1JJTHRSRGdFUmI0?=
 =?utf-8?B?U1BEWTA3Ti8yemVGd0YwMVFmcWtlYnhkMlZiTURjYm5oeENJVlNBbE1EZ1N3?=
 =?utf-8?B?VDRWRzlhNjF3L1lXZUJqK2tQaEJkV1lQOEhsOUhvT3BIUDRSSVh0ZkxzR1JF?=
 =?utf-8?B?Y0trc25hUXBBeWxuVEIvMzhkSmUrRmhCZzJTNzMyZGxBNUdMUXNjUDcvSjdS?=
 =?utf-8?B?dXhxNlE1dU12ZXpKRkwzZWVrZjJSNFF5elFlMW11WUk3eEJXVGpicHA5elB1?=
 =?utf-8?B?bHNYWGw4eWpZaVpzSE1hek9XWDNZRzMvamlvSXhMeGxhaWU5cWdzZk84SURB?=
 =?utf-8?B?bkQwL0VhV3ZZQ09Td2Q2YkE0aG9pZzRmR1k3d0o2clVZaWVWblZObHBuNmlC?=
 =?utf-8?B?djNvM2NpM1VDZTRsZm9xaGRScU5uNTB1akFXVW1nZkQ3dG9lZW0rZHMwZjkw?=
 =?utf-8?B?ajhwTkJlSmhEaHA1MU1iMDhFV3lPT1ZWdXlaM0VpeW5hNUpNczVJS0VybC9s?=
 =?utf-8?B?NTRydVlDa2lKWjdsd0RDT1NhTEJmQWJScUNSdmNJSlZmU0RZWlhQRXpEU0Ri?=
 =?utf-8?B?SkhNWDdYdllIcHdrUkVjbVJxYU5zNU11dlZNSGdiNkhxL1VZWDRqUEY1YXh3?=
 =?utf-8?B?VkxLVmJSdnRqTG5OMis0YjRpTUpXL1VzNG5CWENwbmlFZXIrREpKdVUyb3RY?=
 =?utf-8?B?RXdCSlJPcjVkQXRUZWtYbDYxNXNIdlhGQjVLdzFTTEpvUms3dXdId3ZPVlB4?=
 =?utf-8?B?cFBiSXpkSjVNaGExL2ZFbi9ySVN3aWRGMHlqYXRkOWs5ZFBQanRlRU5Jc1RH?=
 =?utf-8?B?ZkZVR3FRS0Z2aU5rRXE2WVdjZFlERHNZY2d2TFR6WC8xc1h4RWtCMStMY3BO?=
 =?utf-8?B?eWFJU0JzRkJSMlBFZmg4NTdtWWVrUTFJZXB3T2VoZmFqMXVQRnU0YzVpQkVR?=
 =?utf-8?B?akc0Wk1BMkthQ2pmb2gvdDlWT252dXkrdm5TcWxjZkpJaytBWHJ4bnJmRk9v?=
 =?utf-8?B?K0d6UUsxU1JGajM5QWZEQmVDeDdPQW0vTTUwLzlkQjBCcHJDT1RaKzJNOHB1?=
 =?utf-8?B?Q0lTMjJmN2tzWWlQY1RSVFp5RWpzMENpRzNBN1dDSHBvamQrSW0vcnhYWFVz?=
 =?utf-8?B?Qmprc0Y0UEJtWVVEbUxBdVVlNFBOM3I4enIrdjNDOCtScE5YNm1WM1JBMHNH?=
 =?utf-8?B?UTUxa0R4TmhycENnN2hlVkVOSy9PV0MrZXVsUjZKb2s1Qkdod1ZDWTRXVkVx?=
 =?utf-8?B?aGlOYkMxS2pQRWVsN0hiR0NTSkFld0RRdWFydnJLVnBZQVM4WVdkUFl6YlZu?=
 =?utf-8?Q?CWRHl299MgNMJ4fojg6lpBkJ8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3100cb3-4458-4f6e-f628-08dd555661e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 04:39:25.4329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vy+PPpBDr+IqbMs16EhPZtlqYIxHsC5MJW3keaHeMp1X4DSGg37XblCRYBk3i9ILR1TRzG0b3vdpT81D4STimxZHMgIndQQH8zki/dJPPFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAy
NSwgMjAyNSAxMjo0MiBBTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBp
bnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxn
YXVta2FyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOV0gZHJtL3hlL3VhcGk6
IFVzZSBoaW50IGZvciBndWMgdG8gc2V0IEdUIGZyZXF1ZW5jeQ0KPiANCj4gT24gTW9uLCBGZWIg
MjQsIDIwMjUgYXQgMDk6NDM6MDlBTSAtMDYwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+
T24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgMDU6MDg6MzBQTSArMDUzMCwgVGVqYXMgVXBhZGh5YXkg
d3JvdGU6DQo+ID4+QWxsb3cgdXNlciB0byBwcm92aWRlIGEgbG93IGxhdGVuY3kgaGludC4gV2hl
biBzZXQsIEtNRCBzZW5kcyBhIGhpbnQNCj4gPj50byBHdUMgd2hpY2ggcmVzdWx0cyBpbiBzcGVj
aWFsIGhhbmRsaW5nIGZvciB0aGF0IHByb2Nlc3MuIFNMUEMgd2lsbA0KPiA+PnJhbXAgdGhlIEdU
IGZyZXF1ZW5jeSBhZ2dyZXNzaXZlbHkgZXZlcnkgdGltZSBpdCBzd2l0Y2hlcyB0byB0aGlzDQo+
ID4+cHJvY2Vzcy4NCj4gPj4NCj4gPj5XZSBuZWVkIHRvIGVuYWJsZSB0aGUgdXNlIG9mIFNMUEMg
Q29tcHV0ZSBzdHJhdGVneSBkdXJpbmcgaW5pdCwgYnV0IGl0DQo+ID4+d2lsbCBhcHBseSBvbmx5
IHRvIHByb2Nlc3NlcyB0aGF0IHNldCB0aGlzIGJpdCBkdXJpbmcgcHJvY2Vzcw0KPiA+PmNyZWF0
aW9uLg0KPiA+Pg0KPiA+PkltcHJvdmVtZW50IHdpdGggdGhpcyBhcHByb2FjaCBhcyBiZWxvdzoN
Cj4gPj4NCj4gPj5CZWZvcmUsDQo+ID4+DQo+ID4+On4kIE5FT1JlYWREZWJ1Z0tleXM9MSBFbmFi
bGVEaXJlY3RTdWJtaXNzaW9uPTAgY2xwZWFrDQo+ID4+LS1rZXJuZWwtbGF0ZW5jeQ0KPiA+PlBs
YXRmb3JtOiBJbnRlbChSKSBPcGVuQ0wgR3JhcGhpY3MNCj4gPj4gRGV2aWNlOiBJbnRlbChSKSBH
cmFwaGljcyBbMHhlMjBiXQ0KPiA+PiAgIERyaXZlciB2ZXJzaW9uICA6IDI0LjUyLjAgKExpbnV4
IHg2NCkNCj4gPj4gICBDb21wdXRlIHVuaXRzICAgOiAxNjANCj4gPj4gICBDbG9jayBmcmVxdWVu
Y3kgOiAyODUwIE1Ieg0KPiA+PiAgIEtlcm5lbCBsYXVuY2ggbGF0ZW5jeSA6IDI4My4xNiB1cw0K
PiA+Pg0KPiA+PkFmdGVyLA0KPiA+Pg0KPiA+Pjp+JCBORU9SZWFkRGVidWdLZXlzPTEgRW5hYmxl
RGlyZWN0U3VibWlzc2lvbj0wIGNscGVhaw0KPiA+Pi0ta2VybmVsLWxhdGVuY3kNCj4gPj5QbGF0
Zm9ybTogSW50ZWwoUikgT3BlbkNMIEdyYXBoaWNzDQo+ID4+IERldmljZTogSW50ZWwoUikgR3Jh
cGhpY3MgWzB4ZTIwYl0NCj4gPj4gICBEcml2ZXIgdmVyc2lvbiAgOiAyNC41Mi4wIChMaW51eCB4
NjQpDQo+ID4+ICAgQ29tcHV0ZSB1bml0cyAgIDogMTYwDQo+ID4+ICAgQ2xvY2sgZnJlcXVlbmN5
IDogMjg1MCBNSHoNCj4gPj4NCj4gPj4gICBLZXJuZWwgbGF1bmNoIGxhdGVuY3kgOiA2My4zOCB1
cw0KPiA+Pg0KPiA+PlVNRCBDb21wdXRlIFBSIDogaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2Nv
bXB1dGUtcnVudGltZS9wdWxsLzc5NA0KPiA+PlVNRCBNZXNhIFBSIDoNCj4gPj5odHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMzMyMTQNCj4g
Pj4NCj4gPj52OShWaW5heSk6DQo+ID4+IC0gcmVtb3ZlIGV4dHJhIGxpbmUsIGFsaWduIGNvbW1p
dCBtZXNzYWdlDQo+ID4+djgoVmluYXkpOg0KPiA+PiAtIEFkZCBzZXBhcmF0ZSBleGFtcGxlIGZv
ciB1c2luZyBsb3cgbGF0ZW5jeSBoaW50DQo+ID4+djcoSm9zZSk6DQo+ID4+IC0gVXBkYXRlIFVN
RCBQUg0KPiA+PiAtIGFwcGxpY2FibGUgdG8gYWxsIGdwdXMNCj4gPj5WNjoNCj4gPj4gLSBpbml0
IGZsYWdzLCByZW1vdmUgcmVkdW5kYW50IGZsYWdzIGNoZWNrIChNQXVsZCkNCj4gPj5WNToNCj4g
Pj4gLSBNb3ZlIHVhcGkgZG9jIHRvIGRvY3VtZW50YXRpb24gYW5kIEd1QyBBQkkgc3BlY2lmaWMg
Y2hhbmdlDQo+ID4+KFJvZHJpZ28pDQo+ID4NCj4gPmhtbi4uLiB0aGF0IGRvZXNuJ3QgbG9vayBy
aWdodC4NCj4gPg0KPiA+Li4uDQo+ID4NCj4gPj5kaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9n
cHUvZHJtLXVhcGkucnN0DQo+ID4+Yi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QgaW5k
ZXggYjc1Y2M5YTcwZDFmLi43MzM3ZDFiZTQ1ZWYNCj4gPj4xMDA2NDQNCj4gPj4tLS0gYS9Eb2N1
bWVudGF0aW9uL2dwdS9kcm0tdWFwaS5yc3QNCj4gPj4rKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9k
cm0tdWFwaS5yc3QNCj4gPj5AQCAtNTgzLDMgKzU4MywyMSBAQCBkbWEtYnVmIGludGVyb3BlcmFi
aWxpdHkNCj4gPj4NCj4gPj5QbGVhc2Ugc2VlIERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9k
bWEtYnVmLWFsbG9jLWV4Y2hhbmdlLnJzdCBmb3INCj4gPj5pbmZvcm1hdGlvbiBvbiBob3cgZG1h
LWJ1ZiBpcyBpbnRlZ3JhdGVkIGFuZCBleHBvc2VkIHdpdGhpbiBEUk0uDQo+ID4+Kw0KPiA+PitM
b3cgbGF0ZW5jeSBoaW50IGJ5IHVzZXINCj4gPj4rPT09PT09PT09PT09PT09PT09PT09PT09DQo+
ID4+Kw0KPiA+PitBbGxvdyB1c2VycyB0byBwcm92aWRlIGEgaGludCB0byBrZXJuZWwgZm9yIGNh
c2VzIGRlbWFuZGluZyBsb3cNCj4gPj4rbGF0ZW5jeSBwcm9maWxlLiBQbGVhc2Ugbm90ZSBpdCB3
aWxsIGhhdmUgaW1wYWN0IG9uIHBvd2VyDQo+ID4+K2NvbnN1bXB0aW9uLiBVc2VyIGNhbiBpbmRp
Y2F0ZSBsb3cgbGF0ZW5jeSBoaW50IHdpdGggZmxhZyB3aGlsZQ0KPiA+PitjcmVhdGluZyBleGVj
IHF1ZXVlIGFzIG1lbnRpb25lZCBiZWxvdywNCj4gPj4rDQo+ID4+KyAgICAgc3RydWN0IGRybV94
ZV9leGVjX3F1ZXVlX2NyZWF0ZSBleGVjX3F1ZXVlX2NyZWF0ZSA9IHsNCj4gPj4rICAgICAgICAg
IC5mbGFncyA9IERSTV9YRV9FWEVDX1FVRVVFX0xPV19MQVRFTkNZX0hJTlQsDQo+ID4+KyAgICAg
ICAgICAuZXh0ZW5zaW9ucyA9IDAsDQo+ID4+KyAgICAgICAgICAudm1faWQgPSB2bSwNCj4gPj4r
ICAgICAgICAgIC5udW1fYmJfcGVyX2V4ZWMgPSAxLA0KPiA+PisgICAgICAgICAgLm51bV9lbmdf
cGVyX2JiID0gMSwNCj4gPj4rICAgICAgICAgIC5pbnN0YW5jZXMgPSB0b191c2VyX3BvaW50ZXIo
Jmluc3RhbmNlKSwNCj4gPj4rICAgICB9Ow0KPiA+PisgICAgIGlvY3RsKGZkLCBEUk1fSU9DVExf
WEVfRVhFQ19RVUVVRV9DUkVBVEUsICZleGVjX3F1ZXVlX2NyZWF0ZSk7DQo+ID4NCj4gPmhvdyBk
b2VzIHRoaXMgZHJpdmVyLXNwZWNpZmljIGRvYyBtYWtlIHNlbnNlIGluIHRoaXMgZmlsZT8NCg0K
VGhhbmtzIGZvciBsb29raW5nIGF0IHRoaXMuDQoNClRoZXJlIHdhcyBzdWdnZXN0aW9uIHRvIGFk
ZCB0aGlzIGluIGRvY3VtZW50YXRpb24gZHVyaW5nIHJldmlldywgQFZpdmksIFJvZHJpZ28gQ2Fu
IHdlIHJlbW92ZSB0aGlzPyBBbmQgaWYgd2UgcmVtb3ZlIHRoaXMgd2hhdHMgcG9pbnQgaW4ga2Vl
cGluZyBkb2N1bWVudGF0aW9uIGhlcmUgZm9yIDQgbGluZSBwYXJhZ3JhcGg/IA0KQERlIE1hcmNo
aSwgTHVjYXMgRG8geW91IG1lYW4gY29tcGxldGVseSByZW1vdmUgZnJvbSBoZXJlLCBqdXN0IGtl
ZXAgaW4geGVfZHJtLmg/DQoNClRlamFzDQoNCj4gDQo+IHRvIGF2b2lkIG5lZWRsZXNzIG5vaXNl
IGluIHRoZSBsb2csIEkgemFwcGVkIHRoaXMgY29tbWl0IGZyb20NCj4gZHJtLXhlLW5leHQ6DQo+
IA0KPiAgICsgOGY3OGMwZGZiZTlkLi4uOGI0YjNhZjg2OWU5IGRybS14ZS1uZXh0IC0+IGRybS14
ZS1uZXh0IChmb3JjZWQNCj4gdXBkYXRlKQ0KPiANCj4gOGI0YjNhZiBvIFtkcm0teGUtbmV4dF0g
e2RybS14ZS9kcm0teGUtbmV4dH0ge2RybS14ZS9IRUFEfQ0KPiBkcm0veGUvdXNlcnB0cjogcmVt
b3ZlIHRtcF9ldmljdCBsaXN0DQo+IDZiOTNjYjkgbyBkcm0veGUvdXNlcnB0cjogZml4IEVGQVVM
VCBoYW5kbGluZw0KPiA0ZTM3ZTkyIG8gZHJtL3hlL3VzZXJwdHI6IHJlc3RvcmUgaW52YWxpZGF0
aW9uIGxpc3Qgb24gZXJyb3IgOGY3OGMwZCDilIIgbw0KPiBkcm0veGUvdXNlcnB0cjogcmVtb3Zl
IHRtcF9ldmljdCBsaXN0IGYyMjExYWEg4pSCIG8gZHJtL3hlL3VzZXJwdHI6IGZpeCBFRkFVTFQN
Cj4gaGFuZGxpbmcgYjlhYWFiYiDilIIgbyBkcm0veGUvdXNlcnB0cjogcmVzdG9yZSBpbnZhbGlk
YXRpb24gbGlzdCBvbiBlcnJvcg0KPiBiZWUzN2E4IOKUgiBvIGRybS94ZS91YXBpOiBVc2UgaGlu
dCBmb3IgZ3VjIHRvIHNldCBHVCBmcmVxdWVuY3kNCj4gDQo+IHRoaXMgZG9jdW1lbnRhdGlvbiBp
cyBhbHNvIGluIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgsIHNvIG1heWJlIHRoZSBiZXN0DQo+
IHRoaW5nIHRvIGRvIGlzIHByb2JhYmx5IHRvIGp1c3QgZHJvcCB0aGlzIHBhcnQgdGhhdCBnb3Qg
aW5jbHVkZWQgaW4gdGhlIHdyb25nDQo+IHBhcnQuIE9uY2UgdGhpcyBpcyBmaXhlZCB3ZSBjYW4g
YWRkIGl0IGJhY2suDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCg==
