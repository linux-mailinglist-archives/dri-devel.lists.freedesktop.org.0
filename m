Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACFB176EC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAC810E7E4;
	Thu, 31 Jul 2025 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1jppfdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253E10E0A1;
 Thu, 31 Jul 2025 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753992337; x=1785528337;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ueuvt3S939c38zIeTbin+WmRXxJs29uoJus8PHla2VE=;
 b=g1jppfdJL9NVTp7nXvR9NQeIUavtFgC/VmqMjDaRIiXRyyp9PVOjrcxb
 bXBjf0D/2isk/ZXSkl6vzCEQnRtqzfi/MreM6ZgckRstTwY3acRQrfDyZ
 k+6iD7ITo+Jk9mWxeLxjS0UQc28lemqXx/KAoTCTpKuiet9Es7hFzCwhf
 0Y7JoA3xGOsTaVt/0lcuVoW4YFlYNTYiwgzPvKhDwxTHS9MsgrAEOvpNy
 ImBoKYAuLYx1eUDeSZksxSGBNpTqFQlzrEtw9wkFFDUEI3Ov1Z6a3a9RT
 Rlg2oTGnHuHA9JZyvtAJiO5dt3LtQ0spnFtDete2t2qB3ZfjTmD7qLc+9 g==;
X-CSE-ConnectionGUID: d+EcOozZShK9VJHc5VrShg==
X-CSE-MsgGUID: m2WjIyhpSLy0eN9ZOgtEYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56292686"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56292686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:04:09 -0700
X-CSE-ConnectionGUID: nV6Bda5QTBeBY1LO4wDisw==
X-CSE-MsgGUID: 6GNj9X6gR6CHUUf9/TJbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162931397"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:04:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:04:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:04:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNXWSi9iofBWB9l/prMrQYqV80YxEYmojCuudRlEAS/diPrZIq1Sz6Y0lqLrSQxFn90FdbUMrkF7l2WEwetgidlhNJi/smWdE6viKnuaazarYtDAeo5YDb56b2V2JPZFaFFqChFa69VOiIgLPGiB6bWsyZO0ZYwVKv8UZfQJPk2b+R8f40g8ji5YLxBt16p2rrda8TjBVHIzLPv7p4r+CryJHw7s++llVSqhosuap8yUAlzCjbp+U6+7DYWsPSsxSzTse7RKNhTkcj32rSnrr09mmHKmsLtkEv24aiF/mJ1xQOtrFXahX8rrASGT4AoRik980o8q2HMnNFBAq+WJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ueuvt3S939c38zIeTbin+WmRXxJs29uoJus8PHla2VE=;
 b=YP4JYn8+/eFbCJlju1CZGf5ll9qApI9BwsdzwmxwG3lswmMlc6CkmCUdsrP5NVPQzOKuNWKSIH6C4VOJdMju4mFJETOjCoSzU/yt11a6HGA+01fSNEHi797EcRUfd3qcWBrYvAQY+e+U7K1R0JKZRowvUUrwz9OEFqurdS/rqCM8d0ARZNb+8aR0cIOcNwkXtvJ25ZTzGXK4WMPSVyeX7JMtasE2IytW9aEe/9ql/NTLvfeOhh8zl1SyAqHnvYIcbXxt2YSmZhDbPXu5p85yCOSiRQmo2Q089TXiqXT3MRa5zkLx8I+mWVD1WDGj5oxWCor+q+7zLm3LV6xjmcDzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.14; Thu, 31 Jul 2025 20:03:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 20:03:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to
 disable late binding
Thread-Topic: [PATCH 8/9] drm/xe/xe_late_bind_fw: Introduce debug fs node to
 disable late binding
Thread-Index: AQHb8ayxFAn7lvwC7k2fZblFcxS9HLRMyQoA
Date: Thu, 31 Jul 2025 20:03:36 +0000
Message-ID: <1f323cf45af3ba781d46d2e889f89bc26aa9b85a.camel@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-19-rodrigo.vivi@intel.com>
In-Reply-To: <20250710150831.3018674-19-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB8546:EE_
x-ms-office365-filtering-correlation-id: 4a0cb391-c015-4f88-4ac0-08ddd06d55d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WENZMWlKOEYwMy82dXNlTURCeVNGUlo3YVJqWjJvdzBZb01QTXdydlpsKzY3?=
 =?utf-8?B?MkZGRDN5cG5EdHdXZ05zWGtnanhIblN6WE1JbzZ5ZFZJNjZZZmgvVGloZEkv?=
 =?utf-8?B?MHhUY2FWMlJmRGRwclVOQjFIclJVV0V3N3NnbDdlcWlZLzZiMzBmbnRYNmFK?=
 =?utf-8?B?ekJGWnpmMEJsOUtlcktUSmFERGRoMDYvbTY5T3JrSWUrRjJWRnpRb2szVUFT?=
 =?utf-8?B?OVAxai9sNEFKaGdqdTY2WGZIbkQrVWhaTzEvV3JjS2xTUmx0RGt2U0tmblNN?=
 =?utf-8?B?d0w3MkY1d01BVk1qNzlVdkwxYmk5UXpoUlVDR2dPTTZIa29zNlVkQUo2Lzhu?=
 =?utf-8?B?bC9UR214VFJaeTVrekxIRDZ2VkFYenVhQ2dsUlgzMGpIY09xNXZuZENxYVVm?=
 =?utf-8?B?dGJrbk5UakpnUE9iM1dDTklmcEovbGxYM2VhZ3hacUYvV2hsZ1hZSGV6RE1I?=
 =?utf-8?B?bExlSWxmQkRiTkhWNnk5TWs5SUZGdVY4Q00zWjE4Um96NU1zbmtTNjJXaTgr?=
 =?utf-8?B?aEpKc0libFV0Q3d3Y2gzekFTWmwzQWI4SDcrWFVhVlFaVE5PNmxBV0tPU3pD?=
 =?utf-8?B?UEl4MS9vN2tIRjVvSE5naDZQNXpkdnBFd1dGMUhVYXVFS3RkdDN1aDZ5Nktv?=
 =?utf-8?B?R0ZZODl1Ny9FT1VKMWJ0Wi9zeXMrVS81RXpPMlo2T0tabldUbDJKbkpSRUpJ?=
 =?utf-8?B?RFZJckNyQk1BWVJ0RkdiWUZYYlRCekYxZzEwMFp4c0J1S3NNQTF4cXI4WE9Q?=
 =?utf-8?B?d0RBc2R2K0RMNzVSVjVodjV2UmNJTitwa0VLdnBoL1l3WUVVK0xnSDEvazhi?=
 =?utf-8?B?azdwYjlkL3NKdzFLUE1LZjVjdlp5WktOa1BTbk82V2VybXM2b0xWM1NzdUMy?=
 =?utf-8?B?VVR2R1BvMUhsQmdRNE13aUIxOERqV3EzT1FoWkxKaFQwaTZ3c2N1VUVMUDZu?=
 =?utf-8?B?dlR5VkJ3amo4UFhHbU5KL0NkTFlXTGpoenVIaGlBS2YrdG5RNHZGZHYyTldR?=
 =?utf-8?B?bEZaV0tDUEh2cVpqOE5ZQ1FONEZmbHp0eWZPbmxlNWhIaDRSaTVzd0tpSWJY?=
 =?utf-8?B?MS9ZQ0dOM2JZaHF5ZWN0S3I5enJMRjhHZ3ZwNlNwYTdBTFJYd3RhS3JGcnRN?=
 =?utf-8?B?ZnlCOVBNMGYwRXVJdUhOSmN6WVROSDRZaUlCS1RacG1VT2tpdXFsRWt1VWRY?=
 =?utf-8?B?UHRTbVpyRDJPV1U4T1lVRjZ6cDRDdTFTZk9DdXJudEVOQjUzYi8vWnZpNmZr?=
 =?utf-8?B?Q0I5ZVRQMEdybk4wQnA4V2VEK2lMbW44TXZTZzFmbnlrelZkOEZtVWVRWDdK?=
 =?utf-8?B?Y0VFY1ErUWRmUDNVL1lyZHZ6azZEVnpWN21WTWpoM3VjWUJCUjZhL3I2V211?=
 =?utf-8?B?cmZXUXlSdkJUWC9nUWUyMGc4c2RSWkZHRDFlWjVVZUhDYllYT2d4T3BqSUlk?=
 =?utf-8?B?ZXpQaDRUMDJMQkVIdUhqdGFWMU5ZUTBtaUN0dktMTWpuQmNVcm04UUVZRGti?=
 =?utf-8?B?TXJNZDhaQWpBVC83V3cyeEE5d3hFRVdNZVJyRDduSHdlbGVoOFNiYVVWWDhm?=
 =?utf-8?B?bncrOUZ2YkFSaE1mTWpJZGxNMFJHOXEycjNhTEJEaW83b3JSbTZFQVJZWEZa?=
 =?utf-8?B?ei9wbmwraGxuNkhEdThXR0FRSnBrQlNYQmF5QVgwZTRXUDFBQldTSmUrNlBD?=
 =?utf-8?B?RG5NWHd1UUJxdmJuN2NPMldwT0xPNG44c0N1Z25OSi9mMHY4enR1Zi9OQStk?=
 =?utf-8?B?T0doR3RJVlp1dGtsQlpkZUZtY2lVSlZMTWRRSnR5VVhDUGRqNGpBVUNFaWdE?=
 =?utf-8?B?b3ZqSjIyZUxFVUV0L2s5eEtneUxRYnUwL3hZZEpzazd3ZlhkNVlCN2ZBa0Rz?=
 =?utf-8?B?Y2RsWEhzQmZObmFSaUFDdnk3djZNdFk2R09LYU96ZDN6R1FPZXVFYUVoQmJ4?=
 =?utf-8?B?TGEzajc1N0xuNlNTOWNuWmlkTDl3ck4wVVFMVVNKNU4wOWV1NFBpT3MvMTBu?=
 =?utf-8?Q?tIb0icpMhJk7FFXnm5RNGUgImojI64=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjlOb3I5NWlGZ0dycmU3RG5SNFpmRERiYmFqT2p3b2lyM09tdHlQVzUwZG9l?=
 =?utf-8?B?b3VrQVcyYzR6VXB1c1JRSG9QM0E5TTRkOFZRT2kxN2pJQUM4MnloRGNKdFJP?=
 =?utf-8?B?YXptc2hMdVhoMVovQUNBRFVncEJINHFUbjYxL21hUkE5RUxqbS9jRVZWaTcx?=
 =?utf-8?B?dDlST3FqK0ZzUGJRSWwvcFZMUVVDdStUa1JvVWZheUtVU1puTlFwRXdacE5Z?=
 =?utf-8?B?czFReDlmUkFrbXFmUHdDRVA4TVJtWjF6cXlVK1Vna0F2U0RkZnNielJ0R3o4?=
 =?utf-8?B?dFhiQ0ZKSnRKVEZhOCsvZ0RiUC9rNUF4UHdLR3oyUzV6bi9Nbk9VTVNzaFY0?=
 =?utf-8?B?SUVBQ3ZqcWVRZFdWbWc0Q25ySkk3WDAraTNiVmZ5RFJsWFpneUxuYnVuaHhI?=
 =?utf-8?B?d0pTZ3cyZ3lnYzRiTXdrdDVMOHRqa0E2OWxITCtsQTQ4REdkODFQZDR4UzdI?=
 =?utf-8?B?MHRQMnlxSytqbTR3RjdpV2tmaUhWSTg5cEVobVFlQ0JjVGUxNllvckl0dUN4?=
 =?utf-8?B?S0s5WUJ4bUkxOURrRURtSGJyczYzaE5oWFp1WDh0dkFSMldlN1hTbnhKY2Zr?=
 =?utf-8?B?eG1VR0dxbXFhaEZIUVRZdmFnWXRjTVBGUkhSRWVrTDZDYmpjNXc2em5OYnJn?=
 =?utf-8?B?VmtaYmprOENsMktjM1VmTjZlWkxLWDNFWXU2RndjSjRzaHIzUG5Ealo5T2o2?=
 =?utf-8?B?SEEyZnFPeGp4WGJkMFAvSlltQ1ArUE82TXQwMitvNlo3ZTZuNXZ4QU5xTlhG?=
 =?utf-8?B?RjlNL3dqMWx6Qjl4OHA5LzUwV01WRCtKUHBGRi9XdUpBd1pPUTZ1R0daWkZK?=
 =?utf-8?B?ZVhacVhQdFMvSWk5RGptOFdtS3ZZSTlZNzEwRkplQzI2Y0NTWW50MjFXVHRs?=
 =?utf-8?B?QUVEQ0dldkpSUnVZcWdJQjRhdjBlQ2c1ZEZZVWJKb2NtYVZ2a3hNYW5MaXNL?=
 =?utf-8?B?a3g2cy9BQWFoYWhmSWZ6SlpGSlA1L1pOSzdPN0lpSkZNUjBuYjNqd3VKQmFW?=
 =?utf-8?B?QWNYVU5XR3krUllOUitVaEdnTDQ1d0hCTHNlMk94eDlFSDdwOHZuOHk5OHEz?=
 =?utf-8?B?Yzc0VWVzNTNrbVpYak1LOWF0Y3Ntdjl1R0NTMGU5OHpXMldyemxZaHJsNVBG?=
 =?utf-8?B?VWdWbTFzTDVhcUlXZTlEMVRySDcybnZZMDkxcXZFcHg0dTBNc1BwTjFYWmtm?=
 =?utf-8?B?MFZMdDk3NHJtTGZFSzlFVHh5SDN4T1NqRnVJczg0UmZWcWV4eEoyNWxURU4w?=
 =?utf-8?B?VTVJV0ZJOUNBc1dLblgrT3BqSTZlNmhUVXh6L3l3aEpKL0xzTGtCblpjSTlT?=
 =?utf-8?B?TG91eTVHTnlXc1BFZHVmanpvRUlMNmVNcU1YL0VFR0ZnQkRtWWZWbnlkWUJ6?=
 =?utf-8?B?aEJlNlZFaTF5djRXamlxZ3IxU3BNQStKZmFXaHV2QzFGWkJEMEsreWxPdnVP?=
 =?utf-8?B?KzRWV0lWRFZiajJQME9ZZHFrY2JEemxEVzZiUTdJV3c3L2UxMWdoeGV5cWU0?=
 =?utf-8?B?c2huQTFmc3Z1ZVdiYzkza3hlN2RzR0xJcnllSzFsWnVYMCtLZ2hVWVdGVnpt?=
 =?utf-8?B?OWhEWjhmbFZDdEhqM1pYTjVVSkNSTWZpSmErcGdFRkVUT3dka0VzcVIwZ2lu?=
 =?utf-8?B?em1HbHhBT211VXlqTXRna3dBQjRuTjFlNmRYai9KWnJlTEl4TFNBREZ0ZjF2?=
 =?utf-8?B?bFJyYlFLanpOenAwcjlCeGtPWkYwbjgxcmxsZEhQbC9SV09pWXZ5M1I2OW5J?=
 =?utf-8?B?dCtYcFV2SENZcTY0ZVJlQ05nOVJNWkdjMlhuVjVlSHFoMHE5WFV1ZTQrenJB?=
 =?utf-8?B?WU5yb2N2engvYTZNQVpvOXVoVXBVOC9xNElwaEVhbXh4Y1dCRXJqOW5MSzg3?=
 =?utf-8?B?UWhDYjlRdm00dldGT2gydzJXYUtPeUlYZ2dnSW5GQnp3MlJFSEdkTDE2cEwv?=
 =?utf-8?B?elY1VHVVNWlydkMzd29EYWtyNEtpWmhUZWlYcTM0TXRGbjBaWTJGdHQ3Wk84?=
 =?utf-8?B?ZEplcllHdHlJc3FTZExKaVNibStubndFZU9ONDI3OGRyQmpWWnBYU1IySVg5?=
 =?utf-8?B?M2t6WllpMEo0Y1pETEJ1YVd2S3ZhUXZQaVVpdlN5bkJaTDIzbHB0cDJ3Y3hJ?=
 =?utf-8?B?U2VxSjVlYWE1UjB5S0ZoTFVSeXlTSUE5WFBmSHd1VjZMa0tHakwxVGpWRitY?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A11D2A5983B47146A5B1A74A8F1B213B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0cb391-c015-4f88-4ac0-08ddd06d55d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 20:03:36.6764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+Co6AJUwGtbKd2ROs81wZgsT9bZbwnojt/2qywwPL7KxhYfD2Z0QbbPR0TSpYZejN+IJKygZzbGaC+5ni7ADNuPKfoY8OI4ngu/dpwSqa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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

T24gVGh1LCAyMDI1LTA3LTEwIGF0IDExOjA4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4g
RnJvbTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+Cj4gCj4gSW50cm9k
dWNlIGEgZGVidWcgZmlsZXN5c3RlbSBub2RlIHRvIGRpc2FibGUgbGF0ZSBiaW5kaW5nIGZ3IHJl
bG9hZAo+IGR1cmluZyB0aGUgc3lzdGVtIG9yIHJ1bnRpbWUgcmVzdW1lLiBUaGlzIGlzIGludGVu
ZGVkIGZvciBzaXR1YXRpb25zCj4gd2hlcmUgdGhlIGxhdGUgYmluZGluZyBmdyBuZWVkcyB0byBi
ZSBsb2FkZWQgZnJvbSB1c2VyIG1vZGUsCj4gcGVydGljdWxhcmx5IGZvciB2YWxpZGF0aW9uIHB1
cnBvc2UuCj4gTm90ZSB0aGF0IHhlIGttZCBkb2Vzbid0IHBhcnRpY2lwYXRlIGluIGxhdGUgYmlu
ZGluZyBmbG93IGZyb20gdXNlcgo+IHNwYWNlLiBCaW5hcnkgbG9hZGVkIGZyb20gdGhlIHVzZXJz
cGFjZSB3aWxsIGJlIGxvc3QgdXBvbiBlbnRlcmluZyB0bwo+IEQzIGNvbGQgaGVuY2UgdXNlciBz
cGFjZSBhcHAgbmVlZCB0byBoYW5kbGUgdGhpcyBzaXR1YXRpb24uCj4gCj4gdjI6Cj4gwqAgLSBz
Lyh1dmFsID09IDEpID8gdHJ1ZSA6IGZhbHNlLyEhdXZhbC8gKERhbmllbGUpCj4gdjM6Cj4gwqAg
LSBSZWZpbmUgdGhlIGNvbW1pdCBtZXNzYWdlIChEYW5pZWxlKQo+IAo+IEFja2VkLWJ5OiBSb2Ry
aWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmFkYWwg
TmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbGUg
Q2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgoKQml0IG9mIGEg
Zmx5YnkgY29tbWVudCBoZXJlLCBidXQgd291bGQgaXQgYmUgYmV0dGVyIGlmIHRoaXMgd2FzCmNv
bmZpZ2ZzIHJhdGhlciB0aGFuIGRlYnVnZnMgaW4gY2FzZSB3ZSB3YW50ZWQgdG8gc2tpcCB0aGlz
IG9uIHRoZQpmaXJzdCBwcm9iZT8KClRoYW5rcywKU3R1YXJ0Cgo+IC0tLQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RlYnVnZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MQo+ICsrKysr
KysrKysrKysrKysrKysrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZncu
Y8KgwqDCoMKgwqDCoCB8wqAgMyArKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmlu
ZF9md190eXBlcy5oIHzCoCAyICsrCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYwo+IGluZGV4IGQ4M2NkNmVkM2ZhOC4uZDFm
NmY1NTZlZmEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jCj4gQEAgLTIyNiw2ICsyMjYs
NDQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMKPiBhdG9taWNfc3ZtX3Rp
bWVzbGljZV9tc19mb3BzID0gewo+IMKgwqDCoMKgwqDCoMKgwqAud3JpdGUgPSBhdG9taWNfc3Zt
X3RpbWVzbGljZV9tc19zZXQsCj4gwqB9Owo+IMKgCj4gK3N0YXRpYyBzc2l6ZV90IGRpc2FibGVf
bGF0ZV9iaW5kaW5nX3Nob3coc3RydWN0IGZpbGUgKmYsIGNoYXIgX191c2VyCj4gKnVidWYsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3Qgc2l6ZSwgbG9mZl90ICpwb3MpCj4gK3sKPiAr
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGZpbGVfaW5vZGUoZiktPmlfcHJp
dmF0ZTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfbGF0ZV9iaW5kICpsYXRlX2JpbmQgPSAm
eGUtPmxhdGVfYmluZDsKPiArwqDCoMKgwqDCoMKgwqBjaGFyIGJ1ZlszMl07Cj4gK8KgwqDCoMKg
wqDCoMKgaW50IGxlbjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgbGVuID0gc2NucHJpbnRmKGJ1Ziwg
c2l6ZW9mKGJ1ZiksICIlZFxuIiwgbGF0ZV9iaW5kLQo+ID5kaXNhYmxlKTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgcmV0dXJuIHNpbXBsZV9yZWFkX2Zyb21fYnVmZmVyKHVidWYsIHNpemUsIHBvcywg
YnVmLCBsZW4pOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3NpemVfdCBkaXNhYmxlX2xhdGVfYmluZGlu
Z19zZXQoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIKPiBfX3VzZXIgKnVidWYsCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykKPiArewo+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZmlsZV9pbm9kZShmKS0+aV9wcml2YXRlOwo+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9sYXRlX2JpbmQgKmxhdGVfYmluZCA9ICZ4ZS0+bGF0
ZV9iaW5kOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiB1dmFsOwo+ICvCoMKgwqDCoMKgwqDCoHNzaXpl
X3QgcmV0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSBrc3RydG91aW50X2Zyb21fdXNlcih1
YnVmLCBzaXplLCBzaXplb2YodXZhbCksICZ1dmFsKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICsKPiArwqDC
oMKgwqDCoMKgwqBpZiAodXZhbCA+IDEpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAtRUlOVkFMOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBsYXRlX2JpbmQtPmRpc2FibGUg
PSAhIXV2YWw7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHNpemU7Cj4gK30KPiArCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRpc2FibGVfbGF0ZV9iaW5kaW5nX2ZvcHMg
PSB7Cj4gK8KgwqDCoMKgwqDCoMKgLm93bmVyID0gVEhJU19NT0RVTEUsCj4gK8KgwqDCoMKgwqDC
oMKgLnJlYWQgPSBkaXNhYmxlX2xhdGVfYmluZGluZ19zaG93LAo+ICvCoMKgwqDCoMKgwqDCoC53
cml0ZSA9IGRpc2FibGVfbGF0ZV9iaW5kaW5nX3NldCwKPiArfTsKPiArCj4gwqB2b2lkIHhlX2Rl
YnVnZnNfcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqB7Cj4gwqDCoMKgwqDCoMKg
wqDCoHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2ID0gJnhlLT50dG07Cj4gQEAgLTI0OSw2ICsyODcs
OSBAQCB2b2lkIHhlX2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDC
oMKgwqDCoMKgwqDCoGRlYnVnZnNfY3JlYXRlX2ZpbGUoImF0b21pY19zdm1fdGltZXNsaWNlX21z
IiwgMDYwMCwgcm9vdCwKPiB4ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJmF0b21pY19zdm1fdGltZXNsaWNlX21zX2ZvcHMpOwo+IMKg
Cj4gK8KgwqDCoMKgwqDCoMKgZGVidWdmc19jcmVhdGVfZmlsZSgiZGlzYWJsZV9sYXRlX2JpbmRp
bmciLCAwNjAwLCByb290LCB4ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmZGlzYWJsZV9sYXRlX2JpbmRpbmdfZm9wcyk7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqBmb3IgKG1lbV90eXBlID0gWEVfUExfVlJBTTA7IG1lbV90eXBlIDw9IFhF
X1BMX1ZSQU0xOwo+ICsrbWVtX3R5cGUpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgbWVtX3R5cGUpOwo+IMKgCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZncuYwo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jCj4gaW5kZXggZGY0MzUyM2U5MDQzLi44ODM1NWFk
Y2UxZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9mdy5jCj4gQEAgLTE2Nyw2
ICsxNjcsOSBAQCBpbnQgeGVfbGF0ZV9iaW5kX2Z3X2xvYWQoc3RydWN0IHhlX2xhdGVfYmluZAo+
ICpsYXRlX2JpbmQpCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghbGF0ZV9iaW5kLT5jb21wb25lbnRf
YWRkZWQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT0RFVjsK
PiDCoAo+ICvCoMKgwqDCoMKgwqDCoGlmIChsYXRlX2JpbmQtPmRpc2FibGUpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgZm9y
IChmd19pZCA9IDA7IGZ3X2lkIDwgWEVfTEJfRldfTUFYX0lEOyBmd19pZCsrKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsYmZ3ID0gJmxhdGVfYmluZC0+bGF0ZV9iaW5kX2Z3
W2Z3X2lkXTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChsYmZ3LT5wYXls
b2FkKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZndf
dHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9md190eXBlcy5oCj4g
aW5kZXggNWMwNTc0YWZmN2I5Li4xNThkYzFhYmUwNzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xhdGVfYmluZF9md190eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2xhdGVfYmluZF9md190eXBlcy5oCj4gQEAgLTY1LDYgKzY1LDggQEAgc3RydWN0IHhl
X2xhdGVfYmluZCB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3
cTsKPiDCoMKgwqDCoMKgwqDCoMKgLyoqIEBjb21wb25lbnRfYWRkZWQ6IHdoZXRoZXIgdGhlIGNv
bXBvbmVudCBoYXMgYmVlbiBhZGRlZCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBib29sIGNvbXBvbmVu
dF9hZGRlZDsKPiArwqDCoMKgwqDCoMKgwqAvKiogQGRpc2FibGU6IHRvIGJsb2NrIGxhdGUgYmlu
ZGluZyByZWxvYWQgZHVyaW5nIHBtIHJlc3VtZQo+IGZsb3cqLwo+ICvCoMKgwqDCoMKgwqDCoGJv
b2wgZGlzYWJsZTsKPiDCoH07Cj4gwqAKPiDCoCNlbmRpZgoK
