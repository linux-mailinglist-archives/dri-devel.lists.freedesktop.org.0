Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE89856ED
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF89B10E2FF;
	Wed, 25 Sep 2024 10:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIn9J5gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C513310E311;
 Wed, 25 Sep 2024 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727258973; x=1758794973;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c1Qy98w0KasoAaAd3CKzKG+5Qp0b6HqkuhxD41ZJ2Dw=;
 b=PIn9J5gmXIylx18SEUi+3PdCPRNbhSdhchrRoG6cOP2nMXDO+o+STnl6
 KxulCK2aogfnndykEIjf8b2k0PVUIO7WyaHNzJQth57yjDzawpkW+zUDP
 ADghhAoDEG33ZlxNjofDEFxos30i1ZV/oAVce1VhlTkgOSMxsP5Yx6VhY
 NZpenw5wqEksSWNHnFxv2w3pGMf5qnG8TID16E6ngm7t6B5e0p3UKWUGi
 eVcpMkeICZOIbRN2ldMrmYNmvvOELVl9E5H/hbGaXk/huXL8Ahk2oLS0J
 ibD1kLh5E5A2zsSPVMdDeACFYic3s3JLXdlA5uhZfB6dqLII3tChSFPhI Q==;
X-CSE-ConnectionGUID: VALTvUHxTNqt6pNXoxdFsg==
X-CSE-MsgGUID: iZLDEuNKTM27CGE9b586fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26478821"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26478821"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:09:32 -0700
X-CSE-ConnectionGUID: Wlw1yccIRaOFRn68b+Mnwg==
X-CSE-MsgGUID: ftchaIjVSw65OqXBRILmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="72176353"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 03:09:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 03:09:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 03:09:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 03:09:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 03:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td9hj+GjmjVJ8LsJi0N2/6mA8bWCBsCXdZRy5kQPp7uhk0PHEYnGhntqISXVd+m+19zG0u1emtL5NbUoQnJYQrxzaH3z9Y8vRqggiCyMy0WCnphTyDj4jLpKEl7sGeeq2HOcBLcflSF26SM7pVCCI8e0Yp0uzoBh910owApf6bhL+935guh9P930m7Cng0QJk4YMACSjg0gQmYvbtqb4XWtXWpcZBOTsILc9FMtO2ux/32BWHf6Ulf1yNv/WCcyU4KWyDWr5vWIfxlAndNMsd1R173VdydMd9S+wAQgTBxxaPEX9vwku5lUYeaS50syUAmDvKAJFsPVpRPTuUxotZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1Qy98w0KasoAaAd3CKzKG+5Qp0b6HqkuhxD41ZJ2Dw=;
 b=ASOwJePmQ0XvazwrGg6mhFk/vZXTUwhYiaxcKxMtXhfRx6VI42Mbu9kpf/qf6kMrmQ3pSZDotvLWGOHVmZKhWpF4gc6NchCCvJPoZaPXfLP5nk23gOKtbviG2owiuCxtIzUoqUptGU7Smx4Y9lArHUdJXpmykzrql9Hz+PDmn+yWwsDQCQr9KuaJxBpeBpeeuj2wtWzmOmACv3/r+H3hq8Y7s4GENeIH9tcWcj56mzCOGc851AWNjvIoE1sPGh7/3xaS6J35lfUwk4yo3hU0ywowm1YUcUfjYOlSbzxRVWp6MMt7a+M0Dq2aSIvwvQcl9MvCkbUgED+4JyY9RigBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 10:09:04 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 10:09:04 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 1/6] drm/i915/histogram: Add support for histogram
Thread-Topic: [PATCHv3 1/6] drm/i915/histogram: Add support for histogram
Thread-Index: AQHbCpmrpdYKRuLTHEmNM4QllJaoGbJoA1MAgAAJIwCAAENwQA==
Date: Wed, 25 Sep 2024 10:09:04 +0000
Message-ID: <IA0PR11MB7307444BBC717F76E6BE327EBA692@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-2-arun.r.murthy@intel.com>
 <SN7PR11MB67503E3113AA19A87C3BA123E3692@SN7PR11MB6750.namprd11.prod.outlook.com>
 <SN7PR11MB675053EF726C4E459803E31EE3692@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB675053EF726C4E459803E31EE3692@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA2PR11MB4876:EE_
x-ms-office365-filtering-correlation-id: 43631642-6295-4013-6618-08dcdd4a15c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RHhOdExyNXFXakRhVGt0cytjbmVWbWJzclhTMUZLTTlxRTZNQXhyRTB5MStj?=
 =?utf-8?B?REt5cFFSeldwekRnMG9iTGcwVGNZM3V0cFVHblRJaTZOL0xZYytYUUh0WmJ2?=
 =?utf-8?B?TGpaSk9aaFBMSlVOelRycDdpWFNOTGZqeHEvdHZUNVk4dTRUSUNERloxN3di?=
 =?utf-8?B?YXR3K2pkM3ZLZ3pyTnhWdzdQbjFjV2hxN0JvbnhlL21CdlQ1aDk5QVltR3dx?=
 =?utf-8?B?SHlGWlVMUnNkcFlXS3JYMWFveEkrMFJvM0xKanV5aFhzcHE5aTF2dytGL09N?=
 =?utf-8?B?dWFLVUVsR05EMW5ZZ2EzOTZkZTBMNkpDeUdQR0dES2xHSHRFSnJRakZzM0lV?=
 =?utf-8?B?anZrbzlnbWwwdnZyQ3Z0b2lrampnQmZpZlhPRGhSZkUzN09zdFRmaStiQkpL?=
 =?utf-8?B?bjc1SWJSYWExaTgwZXUxaytSMllXOVFNdlRleHVsWjBkbFZKakpERitOUndp?=
 =?utf-8?B?RVNKUzFmTUp0ZDVqaWVLYnJpUEJFcC84TkpkbzAzMzJvZ2RGK1E2aUQyYmFa?=
 =?utf-8?B?NkxnNmpkcGhCTDJrTXEzQUxmdWxqMVBqemxLT0RKYzNVbklxY01HcTNOTmtR?=
 =?utf-8?B?b0Mrck9lR0FFYlpNelpWWVIveHV3b3oxSmtTVnRDQWNtTnJSVzhKc2I1Uk5h?=
 =?utf-8?B?QThKU2JTQ1ZuUUpBYWZmRHFzbjIwV1BtTDlveWVVRHphZnMwTi9zYXAzMGJj?=
 =?utf-8?B?M3lDcDh3RGJsSjlhTlN6ZjBNSFd4bTdYbVUwMTJqRk9RNVVFdE5YT0NlMTg5?=
 =?utf-8?B?TG8yaWxyYmEyWnVjWVVUaWU3Ym1hWWZheDN5SDNxbmFiK1RWT3ZrS29YWjVV?=
 =?utf-8?B?TmFOY1IwcGZiZkxibG5Ldmx4eTJ4bEZIZ1dLT1NLUUJSSDN2ajZjWDA2Sk9r?=
 =?utf-8?B?akovNkR0YkFSVms2aSs0TSs2L1NQUlV2bVJDc21LMlorOWtqYWtsOGJMOHly?=
 =?utf-8?B?OWVNdUg0VUc5aHJ2b2I1TzdNVjdBMGRyNFZTaS9RcTVNWExXRkdWQTl5V3RG?=
 =?utf-8?B?UFJrWi9TQnN6Yzd0c015U2hTMGUxeDhtdmJLd2VqWWdFcjZaTXpqazJrRTNU?=
 =?utf-8?B?SXd2K1JWQ0xKZkNZb1FjZkgrVlgzYWJuZ3UycjIvRnhLMEtsMzJEWGI2aERB?=
 =?utf-8?B?Q0xYdEVpVUtrdmx4ZHRjQmxwN055MzM2Z1dzS2xYS3U5c0cyZ1NPZzdrQ0NK?=
 =?utf-8?B?RDkrNW5WLzVPRW53YW5SS3ZsSDV4U1Bsb0pMYjNDM2N3ZDJORXM2M0VpYkF3?=
 =?utf-8?B?eXlmU3Q4bStJM1pGWTBXU0dpRDNmSk5MOHlVUVZtcUpMVXlZTGtWYjNSNTJL?=
 =?utf-8?B?K0ZKWXFQMHdHcmNoN3pjZUZEMGg2ZjlYM3Z3WWRGUWxRb2hwL0M5bXdyRVV6?=
 =?utf-8?B?M2lMT2RsSW90M3JrZXl6VSs1YjJOaTUyZVV0SHFucCtyZGlvL0o0SGNqWXJv?=
 =?utf-8?B?YW1qVGJULytTeHNFNUdGb0dMMk1HN2ZkN214UmhXOVRGNzQya1RsOXM5eFJX?=
 =?utf-8?B?NFc5cVhnNkl0VU1PbWRhd0JISEovZ0V4SjlCNHFCKzdKNnNlSFVXMC9WYUNx?=
 =?utf-8?B?T01JRlYwOCtzWTh2TWNJQWNza2t1dmRublNQYUNoVkZQRm9mTkwvSkFUbXp4?=
 =?utf-8?B?T05VR2pFeUV4YnJJVk9jbSt4blJCdU1kMkV3UkdrU2lqYTVub2FjZFBFTElO?=
 =?utf-8?B?azM5aUhxQVVFcnVJR2RlR0wrcDNxUEJMbTJiZml0dXhXQzFZZXFjR0pwMWlW?=
 =?utf-8?B?bTNTcWxUOW00UERqUitUUFQ0TkhaK05vVmVkK0dFcUgyMG0rYjJqMzFPWU5B?=
 =?utf-8?B?WHZkNHNmVUFrL01DVzBHZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eks2ZVlQdTE5VlNwNXJEQXoyVEZoZ1Z5RXh6ZStuUWhHK1MwMDc3MTZNU2M5?=
 =?utf-8?B?SEV0cFQ2VzRWTUt1YjVIb2pMQ0IyVUhWaFR1NUo5TTF1Z3V6VGhwL1RVSW41?=
 =?utf-8?B?S2V5NWxjejhtVkYxbUlxSk9hbVVleW4vdzBiQk4reW5QQ0tPb0hPeHhhUEJ6?=
 =?utf-8?B?ZGZhSm9lMU9taDRpQ2tzMnRzTUM2Njh5SGRvVHZzQ01yS3FWRFJyVG1HN2JJ?=
 =?utf-8?B?WDIwc1I2YUNOMER0bkY5MXdJTG1wdXN4MHpQZGkrNGlLQk91RlB5WThNeCtw?=
 =?utf-8?B?S3FYWEVFYWdXUUEvT0czUmExUEh2U0FEZVBYS3FEYlJnUVF2Sk1ra0hpb0F2?=
 =?utf-8?B?cWs5Tm1xV3k3dXhVUlp6NHcvSGFUaGZnaFJJUk1zOHFpNXRLNHhJbTYvOXV4?=
 =?utf-8?B?U2lxYkN1cnBmVXUyeGp3S24xZjcvTHlaYkg1ZEFNeTFrQmJrV3JlTi9YTDVz?=
 =?utf-8?B?UTNGdnJuajF5cjFtN1pYYnFrWWRmMWQ0RE9FblRFcC9KZDVnenBjMTZoT1hO?=
 =?utf-8?B?QUwrblZiSEVxajk5M240bWpQRy9jS0xUSjJ6ZTFycUtuckhuLzEyZTRJVDM3?=
 =?utf-8?B?TE5WajFvcnY4NHRhazBoaDNYNUZlT0pvYmtqMDlKbTVDc2tETVhwY0t4N0VY?=
 =?utf-8?B?Qis0eUI0RmdFYzY5MVlwY25JSGlwWVgzOFoxNktwWkJkZDJwNGwxZ3RLT1ZH?=
 =?utf-8?B?S3hwQXVNVDd0TXNFT3lpVUE4aDh1cnhGREloeUl6OVhNOHNZM0tDY2o0SFdM?=
 =?utf-8?B?QlgxV2xxUWtDTGQrRGdwVXgzY09haElENGsrRGlEcEZleGJXZDBjcTVhQ2lD?=
 =?utf-8?B?SjdWYWdXM3l2aEV2MWFPRG51RWNxT0NudVl3MTFITlA1Z3VmTnVjU3FodjBK?=
 =?utf-8?B?czNWOWd3VUtDWGZNanl5ZTcyUHU2OGNTTVhoSWNDbUcxTmhFWVRRSURSaDQ4?=
 =?utf-8?B?WGhUWWJJVTlnVTdjM0twZlY5Zmt5UUlwZ0I0S0syZ2RhZmRkcDZBTFZlMkM5?=
 =?utf-8?B?dTJvdUhMM2dpNTVzVmVVY2FwN0lNL0V2aGt2emdaelNtMFBqU1FHTmF2TWU2?=
 =?utf-8?B?b2JQcXFCVXh5S2FxejFPVlNFc2ZCeGRWYU5QemRkWE1QVWQ3a1Rqc3orL1Zy?=
 =?utf-8?B?dzB5RGZTRHUyMUpyQ3Q2RHZ2aGhFWmp5M01FbFk0bHZpMTAvN3d1VnJPbGw2?=
 =?utf-8?B?TTBibTJOWVNtMEc4SVFWV0hPS3pmN0tma1pPRlpRa01oMDh3dVJ6THhQWHhh?=
 =?utf-8?B?RnluWUZ5R2lwQ21jd0FSMEl2aVVNeDlwd1lOVFZKblhLakZ6OVAreTEzUzA3?=
 =?utf-8?B?aGNEdWljcCttNnlGRTZLdDAxK2N2ckJFRUlNQnhrQW8yM3E5TXRseGZ4T3A4?=
 =?utf-8?B?VWdLWUZsWnIwUk84bkpPTHlTTWl5Z28waExaZ05RNGwwQXNXZ0lsSklJQUZF?=
 =?utf-8?B?T3VTTVVkTDJzY0NveWFVTGFLVTBzUzlTcWUwKzRodXpzMzRRaHVlT1piRHBo?=
 =?utf-8?B?bEUxQTk3cTE2Q3V0bXpFdzFpL0VmR3hVaUZ2TFVPZnNYL1ZwMUFXR0l0MDc0?=
 =?utf-8?B?bjdZTGJ2c1VHdWJPaGgzU1hFcXFYZ2p5OTNnUWRnY0pPUjdtakc0RGIrc3N0?=
 =?utf-8?B?TmsvSm9VZlBYVXE1M3JyalZ6R3JtbTlweDdINmFqS0FOQVdEVXM0QmhtT2Rl?=
 =?utf-8?B?Y0QxYmJXUFlzdFdnOWRDeks5ODcrTXcxTjBuVXJQNUdveEJDQjdqaXhYdkFq?=
 =?utf-8?B?RkxmNkVpZlZQd2pUbm85OU1Ga3oyeWJjaWR5Mk4wQjQ1cktWUkc2VTFyYVBy?=
 =?utf-8?B?dXlRLytrNEp0ejlhQkZIdHQzR1plSEdtSm5udVV3eGttL3p6VEhmWG9hWWhW?=
 =?utf-8?B?aEh6L01rWllmRGJyQmszNEVoRjR5L0pqSDdpZ1ZSd0RJbGhWWG9GUFNJOUNF?=
 =?utf-8?B?cWVFemYzaTdsV2UweC8wSlZkWDRvNUM2UERTeHFXd1I3VjBBanF1TGpNci9D?=
 =?utf-8?B?KzJyRHJOZDVUcG1laFJaM0NBeTU4TE5uMFE5d1J0b2haclRCOUlHMlBUU0hU?=
 =?utf-8?B?clRRVUp4dW9QSmNvRmc2Wnd1cmtsOUllWUpoU0pndHNrMFB5cDRyRHpwelRs?=
 =?utf-8?B?alpHSWdQTzVSTWowbGNGNDlyQk1hQWVLbUN2dVhXZUhCekVpOUVaNzhGZFhR?=
 =?utf-8?Q?dftliIzUBo9CLTeeXMtFgJu/1AUtmmZxDrGGPqjJMmeZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43631642-6295-4013-6618-08dcdd4a15c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 10:09:04.2049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ca7BT5dGuEezDgcIB6Ij0h2omhJELqS9fw9tx9nYP/6FCbvi2ykjsrsUNbXjQquFzDgxdwmTAOKdiazVgy0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

PiA+ID4gK3N0YXRpYyBpbnQgaW50ZWxfaGlzdG9ncmFtX2VuYWJsZShzdHJ1Y3QgaW50ZWxfY3J0
YyAqaW50ZWxfY3J0Yykgew0KPiA+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9
IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfY3J0Yyk7DQo+ID4gPiArCXN0cnVjdCBpbnRlbF9oaXN0
b2dyYW0gKmhpc3RvZ3JhbSA9IGludGVsX2NydGMtPmhpc3RvZ3JhbTsNCj4gPiA+ICsJaW50IHBp
cGUgPSBpbnRlbF9jcnRjLT5waXBlOw0KPiA+ID4gKwl1NjQgcmVzOw0KPiA+ID4gKwl1MzIgZ2Jh
bmR0aHJlc2hvbGQ7DQo+ID4gPiArDQo+ID4gPiArCWlmICghaGlzdG9ncmFtKQ0KPiA+ID4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gPiArDQo+ID4gPiArCWlmICghaGlzdG9ncmFtLT5jYW5fZW5h
YmxlKQ0KPiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiArDQo+ID4gPiArCWlmIChoaXN0
b2dyYW0tPmVuYWJsZSkNCj4gPiA+ICsJCXJldHVybiAwOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiBQ
aXBlIERpdGhlcmluZyBzaG91bGQgYmUgZW5hYmxlZCB3aXRoIEdMT0JBTF9ISVNUICovDQo+ID4g
PiArCWludGVsX2hpc3RvZ3JhbV9lbmFibGVfZGl0aGVyaW5nKGRpc3BsYXksIHBpcGUpOw0KPiA+
ID4gKw0KPiA+ID4gKwkgLyogZW5hYmxlIGhpc3RvZ3JhbSwgY2xlYXIgRFBTVF9CSU4gcmVnIGFu
ZCBzZWxlY3QgVEMgZnVuY3Rpb24gKi8NCj4gPiA+ICsJaW50ZWxfZGVfcm13KGRpc3BsYXksIERQ
U1RfQ1RMKHBpcGUpLA0KPiA+ID4gKwkJICAgICBEUFNUX0NUTF9CSU5fUkVHX0ZVTkNfU0VMIHwg
RFBTVF9DVExfSUVfSElTVF9FTiB8DQo+ID4gPiArCQkgICAgIERQU1RfQ1RMX0hJU1RfTU9ERSB8
DQo+ID4gPiBEUFNUX0NUTF9JRV9UQUJMRV9WQUxVRV9GT1JNQVQsDQo+ID4gPiArCQkgICAgIERQ
U1RfQ1RMX0JJTl9SRUdfRlVOQ19UQyB8IERQU1RfQ1RMX0lFX0hJU1RfRU4gfA0KPiA+ID4gKwkJ
ICAgICBEUFNUX0NUTF9ISVNUX01PREVfSFNWIHwNCj4gPiA+ICsJCSAgICAgRFBTVF9DVExfSUVf
VEFCTEVfVkFMVUVfRk9STUFUXzFJTlRfOUZSQUMpOw0KPiANCj4gV2h5IDEuOSBhbmQgbm90IDIu
OCAsDQo+IEFsc28gc2hvdWxkIHdlIGJlIGNoZWNraW5nIHdhcyB0aGUgaW5wdXQgdHlwZSBpcyBi
ZWZvcmUgc2VsZWN0aW5nIG1vZGUsDQo+IA0KVGhpcyB0ZWxscyB0aGUgZm9ybWF0IHRvIGJlIHVz
ZWQgZm9yIGltYWdlIGVuaGFuY2VtZW50IHZhbHVlIGluIG11bHRpcGxpY2F0aXZlIG1vZGUuIFRo
ZSBhbGdvcml0aG0gd2lsbCBoYXZlIHRvIHVzZSB0aGlzIGZvcm1hdC4NCg0KVGhhbmtzIGFuZCBS
ZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
