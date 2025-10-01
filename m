Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77052BAF0DD
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE50610E173;
	Wed,  1 Oct 2025 03:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHbE+kDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66A710E173
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759288180; x=1790824180;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q5dBMhpjzs7Gsd9sg/mHdQKy83Kz/fwdQnCK2JkV5kM=;
 b=BHbE+kDZb/NPe2KbaKenxDBkVdWTO6g+B5QXxLIg8lcG96/xhroZ0PID
 bo8QjP/O/yqXR919aPk6sOIZK+gtLE95W2FMb3BDqrlzGUCdaUsunyxtt
 mLkpIo31TV/vGa/cpnpLPY3V4nVAzZDXZwyr6ci/Wnxk7gV2RPm7TZLDC
 BTGN2Q1LFf/S62FICScMZ+cypFfd4lHSRAd4eKXqgtRQtlMUOP2Wp+OdQ
 GroxbErwx/I+1IKvjtVSaTxxOP5laRrGA9F3d5V8Dc5LSGg5gBWtb568y
 2LlGSvat0DzBUTBhIXsOai9YF0BOwAJag5Gi6xu2lLf8l2DmW2HQ7XeDT Q==;
X-CSE-ConnectionGUID: YceNhq3/Qh6GqZ/PReNZLw==
X-CSE-MsgGUID: jqN694/LRlyoLgcDP/frDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61663729"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="61663729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 20:09:40 -0700
X-CSE-ConnectionGUID: Z5crhRobSEuuRlD+GpFNkA==
X-CSE-MsgGUID: oTubgJRqRx+M+LpDCnl1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178632151"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 20:09:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 20:09:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 20:09:38 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 20:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+a9gf4jS66Gy5aiDTOxMW8fIBLxWC4ZCQlDEL6Sp8sIuwiupAsJWuxsNWfpkUCBUMcyHJHYXWq6iCxSfLx1Wn6XxmPFI2BKt4l2jeZjfbEnvSqnfsi3jDeYidigt8DnZ0IOgbJlQGRC+EzHXm5difsou4egZVzLuDG5PciwoqKEoJWwOsjmwoqRGCHsLaWXsHM8R326rk72ZuZahopVuBuLp2B2otYdU3UGyhDsj5tZVdTfbgaOInxc+1avK6rMpw607WL//OpkrKrBLZE9b5kB6JT6qlo/C/j/XiwsIFdKAJYbY3r1biA+FCWSX8C3rwXG82nbzodh1OfgzrnLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5dBMhpjzs7Gsd9sg/mHdQKy83Kz/fwdQnCK2JkV5kM=;
 b=XqmSpq1jgBT2dimMQ0OQ7zj1I/ZyEnmI+UlvZXwK2MBXt5aQVXwSuRYv60+A4ao3Ar5uid/e7O/7avCU5XN80AHlhjeLujzfhW9qDG3x0unEossz7ycQ+FygV7oc0FwMed3aZdrV0ucDgPonyXH3+13FAxpx9pM7wn/m3LdTIa9miTJx3/As8Qp2x63Vai5rRiUVtInJZEXsAlEFXOCWsgn2K5CVaagggUvDDfUzMp/dOHMH8l/sobGQRKNnJa+vIGJ8eyfOhXIoRkO4VV/yEoB6UpswiXu1EosbTSf7P1VFxSpNAaLvrB4Car/VPc2pzUVjZj2ORG4jwoXVCtKbkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 03:09:30 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 03:09:30 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/3] Virtio-GPU S4 support
Thread-Topic: [PATCH v4 0/3] Virtio-GPU S4 support
Thread-Index: AQHcMn+MpD5udzZ8L0uecF3EK7yF0LSsmlpg
Date: Wed, 1 Oct 2025 03:09:30 +0000
Message-ID: <PH0PR11MB51120592EE7474A289D98970FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <2bbe0b9a-b0bb-4dbc-901e-1162791eb437@collabora.com>
In-Reply-To: <2bbe0b9a-b0bb-4dbc-901e-1162791eb437@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|SA3PR11MB7625:EE_
x-ms-office365-filtering-correlation-id: a507e93d-2e74-44ca-c100-08de0097f057
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NmZuM1lrMDhNMXlzVzlWU2F3SHpmN0k4KysvaDAzYUpkYVpOdnYzN2gvZnN4?=
 =?utf-8?B?empSTWNjM1M4VkNJMmdqbzlFMXViNkZuQ1gyZGlyVVgwOTBMQm5mR0k5dEZM?=
 =?utf-8?B?TURJbFd1UUNrOEFqM2ttdUhrVUZWSVBMdFVHdmpCMm1zQzg3UXlvNjVWbVhu?=
 =?utf-8?B?dDk5MEpvdEx5aUNqZGwvYjRXV05LSm9Ka096ZnhVWkhjSE1XelBJZnYyMnpw?=
 =?utf-8?B?bnovUDVnZWE4MnlmQkwxTTZGdGM5TU96S2VqUnZjditpYjF6eUUvbXNkS3VR?=
 =?utf-8?B?bDQ1WHhVUmM4SnFPRXVqNURFTHBHZmNTVFRjblI1WWRacHlkWHNIYTI4em1v?=
 =?utf-8?B?UTZzSWJTQUJBektvM0I5RFFSaUR6Ly9zNGZJZmJXS3hva08vZ3lDaWVKZ3oz?=
 =?utf-8?B?UHY2VzROODVFNXNxcEozTUZLbXd5QXBsd29KaENSRldGMHhUM25tNmhzdUxU?=
 =?utf-8?B?Tks1QWtQMkFjc3NvZE1NSzVBa2NTbFo2czdWTzFBekcvOTRydUxsNHRYYUxD?=
 =?utf-8?B?Ylo0NXhLZDFIODQzd0VKZzV6RXJWVGV0TnJEb2t0b1JqQXB3T0RTWFd4MjNJ?=
 =?utf-8?B?d0FHRURqT3Q2dFJsSEVuNXNodG9COVUwaEduOG1JVWVOR0t0MjZiTDJ5TERX?=
 =?utf-8?B?MWdyYzJTNHY3K3U3OG9KUzV0eG4yUjFWZmJad1BucXh5VmM1UndKaFJuRTJL?=
 =?utf-8?B?NnJEQnoxMUQ3MEFBZzA3WFZUWEt4YllYcngzOGMrSUdQZ0JpVFNIa2FpTzc3?=
 =?utf-8?B?SERzRFFSbVdDaGhsV1R5V1AvcVAvNDhPTlZhMFlmVUNvM0tsOGxycENJTU9I?=
 =?utf-8?B?SHlWTjRKaXM3cDhvd2RTQUF4MThnWUxmci80VlF5TFE5ZXppTFhFNkNrNkpX?=
 =?utf-8?B?Z2JmT2hpR3FZT2hSUnpZUzBYMzl3bUhxUlBCSWlyK1IreU1MZkFhOUplSjd3?=
 =?utf-8?B?a0JycFJvMkFxRndndHhhZ0pyNFc3c2dubGtlcjlyNXZqWkxZakZMeVIzRlVF?=
 =?utf-8?B?RU5EZFdFVm4zY2pXTEp5RVdjRUp3dVNUYUxzYkMrU2RrYWk3UG9wTGlrTkVN?=
 =?utf-8?B?cUR4VThCT0Nmd0RHbStjWVpydjVPenNZTXhkKzJ0UU1GTXVNb01qenBlWFBN?=
 =?utf-8?B?Q0RxcnVUT0RGbEtMejNsaG10YldydnhoT1FJM1ZpQUxCbTNlLys1NVVZKzU2?=
 =?utf-8?B?d09NckZxNW1RVW5ranFCbEQvR0dyMStSWjE3M01HcEJaWldrV1RhYk91QW5C?=
 =?utf-8?B?K1h3aGJOWG94YXloZzhPcjJ5THI5ZDl3Q1FvbUg3WEh3N3VBSDB1ZzRyaWJ0?=
 =?utf-8?B?OUN4TVVPUnRQOGNJZ3VqaFdhOUlFSDl6NUkyMDJiSm5UeWVlUWwyVkxhYmVU?=
 =?utf-8?B?R2FEcEtSS0E4R1J5WWp2ZFVWTHpZUVpSUUxJSDZiQ3dldjh4VWg5aWFFRGF3?=
 =?utf-8?B?WG9KUy8vcUVwTkZ4MVd2TnZOTUw5U1l1SWg4RU0xZnQ4NmlBeE1aL2RKejZC?=
 =?utf-8?B?N0EvL0kxNVZ2UHVwcHpiSTFjOVRSTzFDM1FwSjBpUXI5Smh6cTF2M1ZHUHFs?=
 =?utf-8?B?Y0VDdUIwV1QrR2FtM0JPdlhtdTdwMkVIT3hnR0Y1SndWLzZtc0g0dUc2NUdM?=
 =?utf-8?B?WVpkRGhmSk55MmtSeWFKYkdIMFpXaytpcGJwY1JnS0g0aS9FMmZzRzlra2dD?=
 =?utf-8?B?dmlKRjJlVUt6N3ZLc0RXZmZJbDczWlNIZUU3S1loMGdEMklFZ0tTYjF0REZ5?=
 =?utf-8?B?OFRKbWptSU1ScytheGgxdXhXSFl6VmtaL0VVMW4zdnNoelBiOXlueStTTFEx?=
 =?utf-8?B?TUFBd3NLM2laWXBtdXBvN1lzU1N0U0pHT1ppd3pvdTNBK2d2TDJRVThQNk85?=
 =?utf-8?B?Q3VVbkU1aXhSTEJkb2tiTFZjWXVvRUJZbnpWNUJ2d0hNaGlsa3JSZUpDbTVY?=
 =?utf-8?B?ZWdIK2JnMkpqWVRWVndZYmFZTXJ2WngzWmQyQXp3ZGVWNG9rZ0ZBY2wwWC9n?=
 =?utf-8?B?Y2l3VHo2bFBnT011QU9CblN5Uit1QVBQYm9Rb2diMStLOTBhK2NHeXIxQzI5?=
 =?utf-8?Q?PAlnPM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ak5qdVl2YlFOT3diMStFTGpsTEw3N1Z6MVdBb1RXRERKNkJQYWx0citLeTJs?=
 =?utf-8?B?aWNFbXBlVDg1VytGUzRmaDVQNDg2alJuNkc0V255TXBxM3ZVUXN0MVgzbE5V?=
 =?utf-8?B?NDhOb3U4bCsvK0hFQjd4cTF3cDYyWmdodWRPejZ3LzRkZElGNjJ0bUVkYmdy?=
 =?utf-8?B?dWZuaUxZRW9XNENVa2xLWWxoeWF3RFFzWGRZbC9sOEdSQ0JXWllUVTFINzlP?=
 =?utf-8?B?NC9oQWNFWXFxd2xXSzd2Z2dBVld6RVdoNzVHTDZwcEl0WERPL0tZeVU3dlpE?=
 =?utf-8?B?S1ZUQisxZWFSTkpRbTNVNzVVSEdmK1gvVlBrOUM1aUlsUktBeGtZSGNGM1Zp?=
 =?utf-8?B?bjgrRVRhRTN6MkJaVEhTRGlhN1plMTdwdXdVRlhLcTFOeHVKUzV5L1JISGFr?=
 =?utf-8?B?Ynhrc1orNkNieUJ3dmgrcll3d25FMXlXNW40US9ITjBFVVh3a2Z3alV6VHoy?=
 =?utf-8?B?SE5Sa0dMWW44Um9sS0RwampBSi9xSDhCMS8yOXVRMndsUDVDQ1dtZnVySDJP?=
 =?utf-8?B?QjZwbHFOck10eUJsa2E5R1Z0a1lpWkdyMlo2SDNWa1M3Z1BwRVZPZVFGekRY?=
 =?utf-8?B?clY5VW42cGVmVFhRb3JxUTRjZnI3cEpOUGVuRzVWdVlRTHVTekZkbldIbm9t?=
 =?utf-8?B?bVRCSytQK2V6TlVoZHE3cDlmM095b1FWQUlRaEY4WVM4ZHQwdTEwOFRzS1Y5?=
 =?utf-8?B?TGZmR1pqa3h5S2xFYWFCRnF2VW45QkIvY2xUR01MdGNtRTdYa0ljaGNXY1cr?=
 =?utf-8?B?a2luRUhIMDRpWVc3NHhxY2tSNnJuK0U4KzZTRzhpL2xCaE1BdDE0UERLTVFn?=
 =?utf-8?B?cXhOQTd2Vk05Q29HVlhoOXI0a1JPWlkra2oybVo4Wm9FU0VEYkxqaHc5Q1JQ?=
 =?utf-8?B?aDkwMGJQellzU0ZlOEh1eVhnTHhwU3lSMGlOQXhOUWpHT0IwYlBwUnJoRXRP?=
 =?utf-8?B?TzlJbURibldZZ2htWkFyRWY4OU94M1gya1B3cWVnQU1Ib2QvelAyMWcxUlpl?=
 =?utf-8?B?SDJyVTY1bksySTIwRnNCb3BIbFlEODd3cmhhZWpNVUZQWW5TSlVHcks0bjFD?=
 =?utf-8?B?dmMzaklIWklpUFI4OThrc0ZONjVEZkxITWY0d3lBU1BrNzRpWXVvZ2YxYWFI?=
 =?utf-8?B?Vk9uTmpsbVVhYjNCNStoc2ZNcUo4WE0rSldMbUJJOXpSZXBzVG90bVh1VllT?=
 =?utf-8?B?VUN1eTVKYmJvL1ByMitybTdaamhKVmxDVnAzNS9QWDhVMTJJbWRPdm1mR0Fj?=
 =?utf-8?B?dUtDUk0yRkpKUGRiSkhVa1VyQlpjMXhTK0FSV2xjMmZSUUUxbzZ4U05VOWR1?=
 =?utf-8?B?dTdUQk83cHJQOXRuRmJNMFN6bHhSQWsvRWJ1bURtaWlqQllNNjU0QXJrM3N0?=
 =?utf-8?B?MjkvQW1GQ25VamMybnNNRWVGc29QWkpKb3ZpZkt6YTJQMEQrZnVaa1c2am1H?=
 =?utf-8?B?MkNGbUt1VmZwVVJ3N2x3TW1md3FIb05KNmNlSmtDVkdWZlFCU3RlMWRNbmwv?=
 =?utf-8?B?cW9Wd1l2Tm9nOERNUkpOOFZIa0cralh4amg2SjZwdTY1d1B3ZVgyekVGNTNx?=
 =?utf-8?B?R1VMUGErVTVCUVhnU0pnVGc5NUZHemFZTjZMZzZ2clNzYXFadkF6WUJHM2VN?=
 =?utf-8?B?aG1mME52WlZqS0E1eDZZNXUyUTlkNXVkZHlNblJ6UXcraThjZzVwNnRBejc2?=
 =?utf-8?B?aHpDQU15WXIyVkIvUmdoV2dTQUhKVHhYai96NFdtSklKODBQV2dTVEgwcXFp?=
 =?utf-8?B?am1jQVdHRUdKQW5WSThMUzY4YldQY1BhaCtta1FSYmFOd0NwbUlHMXVUcGtW?=
 =?utf-8?B?bjY5aEFaMkhnNjk1R3EyaHozdmRmQnJ1cHltdHhCc2RnZ2x3Y0tCcEc2V2dB?=
 =?utf-8?B?T0M2MVNlMys2MC82OHFlR2ZLd09WOUFEckEyVVdyajZxTFpFaDc3YTFybUd5?=
 =?utf-8?B?cGMwSVZxT0ZOaUVVZXZ6cnZKWktNakFtU01HMTMwSlRkdUdWR0F0ekNNM2c2?=
 =?utf-8?B?NTZCaWRoallxS2JuWEZibEtQTjA3NGNGbzdmb0M5TW1hV0daL3lFQkJDbTI1?=
 =?utf-8?B?Q2dXQlFqVCtFOHhjVHJSaUl2YWpXSTRYOWJFcjhtVnlwMTNaZG1FYVZSRU8x?=
 =?utf-8?Q?DKqJFLRFjJ63oQ2lnEeAWKXeX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a507e93d-2e74-44ca-c100-08de0097f057
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 03:09:30.5424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4c5/mavYCF4ZBsbXr6PRavQ91Ac/YJDl2FcOYliWGJ5XkQb2LjGwr+8F1hIig9V6XIX4rgPQOOCrlU9JQ4XhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMC8zXSBWaXJ0aW8tR1BVIFM0
IHN1cHBvcnQNCj4gDQo+IE9uIDkvMjQvMjUgMjI6NDcsIGRvbmd3b24ua2ltQGludGVsLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPg0KPiA+
DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBoYW5kbGluZyBo
aWJlcm5hdGlvbiAoUzQpIGluDQo+ID4gdGhlIHZpcnRpby1ncHUgZHJpdmVyIGJ5IGltcGxlbWVu
dGluZyAuZnJlZXplIGFuZCAucmVzdG9yZSBob29rcywNCj4gPiBhbG9uZyB3aXRoIGEgUE0gbm90
aWZpZXIgdG8gcmVzdG9yZSBHUFUgcmVzb3VyY2VzIHVwb24gcmVzdW1lLg0KPiA+DQo+ID4gUGF0
Y2ggMSBhZGRzIHZpcnRncHVfZnJlZXplIGFuZCB2aXJ0Z3B1X3Jlc3RvcmUgZnVuY3Rpb25zLCB3
aGljaA0KPiA+IG1hbmFnZSB2aXJ0aW8gcXVldWUgdGVhcmRvd24gYmVmb3JlIHN1c3BlbmQvaGli
ZXJuYXRpb24gYW5kDQo+ID4gcmVpbml0aWFsaXphdGlvbiBkdXJpbmcgcmVzdW1lLg0KPiA+DQo+
ID4gUGF0Y2ggMiBpbXBsZW1lbnRzIGEgbWVjaGFuaXNtIHRvIHRyYWNrIGFuZCByZXN0b3JlIHZp
cnRpb19ncHVfb2JqZWN0DQo+ID4gaW5zdGFuY2VzLCBhZGRyZXNzaW5nIHRoZSBpc3N1ZSB3aGVy
ZSBRRU1VIGRpc2NhcmRzIHJlc291cmNlcyBkdXJpbmcNCj4gPiB2aXJ0aW8tZ3B1LXJlc2V0IHRy
aWdnZXJlZCBieSBoaWJlcm5hdGlvbi4NCj4gPg0KPiA+IFBhdGNoIDMgYWRkcyBhIFBNIG5vdGlm
aWVyIHRoYXQgdHJpZ2dlcnMgcmVzdWJtaXNzaW9uIG9mIEdQVSBvYmplY3RzDQo+ID4gdG8gUUVN
VSB3aGVuIHRoZSBndWVzdCByZXN1bWVzIGZyb20gaGliZXJuYXRpb24uDQo+ID4NCj4gPiBUaGVz
ZSBjaGFuZ2VzIGVuc3VyZSB0aGF0IHRoZSB2aXJ0aW8tZ3B1IGRyaXZlciBjYW4gcmVsaWFibHkg
cmVzdG9yZQ0KPiA+IHZpcnRpby1ncHUgcmVzb3VyY2VzIGFmdGVyIGhpYmVybmF0aW9uLCBwcmV2
ZW50aW5nIHJlc291cmNlIGxvc3MgdGhhdA0KPiA+IGxlYWRzIHRvIHN5c3RlbSdzIGluc3RhYmls
aXR5Lg0KPiA+DQo+ID4gdjI6IDEwbXMgc2xlZXAgaXMgYWRkZWQgaW4gdmlydGdwdV9mcmVlemUg
dG8gYXZvaWQgdGhlIHNpdHVhdGlvbg0KPiA+ICAgICB0aGUgZHJpdmVyIGlzIGxvY2tlZCB1cCBk
dXJpbmcgcmVzdW1wdGlvbi4NCj4gPg0KPiA+IHYzOiBQbGFpbiAxMG1zIGRlbGF5ICh2MikgaXMg
cmVwbGFjZWQgd2l0aCB3YWl0IGNhbGxzIHdoaWNoIHdhaXQgdW50aWwNCj4gPiAgICAgdGhlIHZp
cnRpbyBxdWV1ZSBpcyBlbXB0eS4NCj4gPiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0KPiA+
IHY0OiBOZXcgdmVyc2lvbiBvZiBwYXRjaHNldCBvbmx5IGNvdmVycyBTNCBjYXNlIGJlY2F1c2Ug
bG9zcyBvZiByZXNvdXJjZXMNCj4gPiAgICAgaW4gUzMgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBz
a2lwcGluZyB2aXJ0aW8tZ3B1LXJlc2V0IGluIFFFTVUNCj4gPiAgICAgKGh3L2Rpc3BsYXkvdmly
dGlvLWdwdS5jKS4gRm9yIHRoaXMsIHZpcnRpby1ncHUtcGNpIGRldmljZSBzaG91bGQgYmUNCj4g
PiAgICAgYXR0YWNoZWQgdG8gUENJRSBidXMgQU5EIGEgUENJRSBvcHRpb24sICd4LXBjaWUtcG0t
bm8tc29mdC1yZXNldCcgbmVlZHMNCj4gPiAgICAgdG8gYmUgZW5hYmxlZCB3aGVuIGxhdW5jaGlu
ZyBRRU1VDQo+ID4gICAgIChlLmcuIC1kZXZpY2UNCj4gPiB2aXJ0aW8tZ3B1LXBjaSxidXM9cG9y
dCx4LXBjaWUtcG0tbm8tc29mdC1yZXNldD10cnVlKQ0KPiA+DQo+ID4gRG9uZ3dvbiBLaW0gKDMp
Og0KPiA+ICAgZHJtL3ZpcnRpbzogRnJlZXplIGFuZCByZXN0b3JlIGhvb2tzIHRvIHN1cHBvcnQg
c3VzcGVuZCBhbmQgcmVzdW1lDQo+ID4gICBkcm0vdmlydGlvOiBBZGQgc3VwcG9ydCBmb3Igc2F2
aW5nIGFuZCByZXN0b3JpbmcgdmlydGlvX2dwdV9vYmplY3RzDQo+ID4gICBkcm0vdmlydGlvOiBS
ZXN0b3JlIFZpcnQtR1BVIHJlcyBvbiBoaWJlcm5hdGlvbiByZXN1bWUgdmlhIFBNDQo+ID4gbm90
aWZpZXINCj4gPg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAg
fCA2MCArKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5oICAgIHwgMTMgKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2ttcy5jICAgIHwgNDkgKysrKysrKysrKysrKystLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIHwgNzENCj4gPiArKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTg2IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+ID4NCj4gDQo+IEhpLA0KPiANCj4gSGliZXJuYXRpb24gd29ya3Mgd2VsbCBmb3Ig
bWUgd2l0aCB2NCwgZ29pbmcgdG8gYXBwbHkgcGF0Y2hlcyBzb29uLg0KPiANCj4gUmUgYHgtcGNp
ZS1wbS1uby1zb2Z0LXJlc2V0PXRydWVgLCBhcHBhcmVudGx5IGl0J3Mgbm90IGVub3VnaCB0byBo
YXZlIGl0IGZvciBTMy4NCj4gSSdtIHN0aWxsIHNlZWluZyB2aXJ0aW8tZ3B1IGJlaW5nIHJlc2V0
IHdpdGggUzMgYW5kIHRoaXMgcmVzZXQgY29tZXMgZnJvbSBhDQo+IGd1ZXN0IGtlcm5lbCB3cml0
aW5nIFBDSSByZWcsIHJlc2V0dGluZyBQQ0kgZGV2aWNlIG9uIGtlcm5lbCByZXN1bWUuIFdpbGwg
bG9vaw0KPiBmdXJ0aGVyIGludG8gaXQuDQoNCltLaW0sIERvbmd3b25dIFRoYXQgb3B0aW9uIG9u
bHkgd29ya3Mgd2hlbiB5b3Ugc2V0IHVwIHZpcnRpby1ncHUgYXMgYSBQQ0lFIGRldmljZS4NCkkg
YW0gd29uZGVyaW5nIGlmIHlvdSBzZXQgdXAgeW91ciBQQ0lFIGJ1cy4gVGhpcyBhcmUgcGFyYW1z
IEkgYWRkZWQgZm9yIGl0Lg0KLWRldmljZSBwY2llLXJvb3QtcG9ydCxpZD1yb290X3BvcnQxLGJ1
cz1wY2llLjAgXA0KLWRldmljZSB2aXJ0aW8tdmdhLGJ1cz1yb290X3BvcnQxLHgtcGNpZS1wbS1u
by1zb2Z0LXJlc2V0PXRydWUgXCANCg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0
cnkNCg==
