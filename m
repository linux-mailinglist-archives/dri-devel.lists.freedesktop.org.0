Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FABBC2C97
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 23:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646FE10E709;
	Tue,  7 Oct 2025 21:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIQSZoBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8A110E709
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759873519; x=1791409519;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CcDVeHpHgBp83KVu565lBQAtp1TP5Bq1cLwoVZ0IDIg=;
 b=eIQSZoBebQbTdnNNDK5xt2+sdt3M+UnovGW+DfGU5Sp6BAXdhAXqRIlS
 tKZ+EFyXzBTPK8MeIE8TF8kwSLsk657RbxR7nXkNdFbuGI9kjfwgnCQ5f
 ipcdPDWZGhwd5PvBjWbr1AbH3li++poTscL0WQXyKcaKggMcHhBUNx1kq
 0eC9NBskqTtB/TkITa4EHmaYWFMMx5yh38df1eAKVu0jLxWElPEGTxSeR
 39IRBjlEZO3nN8JejcivTguGMaujoWeF5Stc+/LdX4zJBM9Al3pnwm5A3
 3y01fpjlnNsc7vR17I0oicX4WGYrjfF5KvuAfEaiuLk8oT1xmVDDGhy6t A==;
X-CSE-ConnectionGUID: 52wIYw8gQVGJvCY6CvIIZg==
X-CSE-MsgGUID: bnmNsEuTRTKeK/eK6YeGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65891931"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65891931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:45:17 -0700
X-CSE-ConnectionGUID: b47+QQwjRQCLfaIYC+wzIQ==
X-CSE-MsgGUID: gIYd5sfnQoa10G94symZlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="180685696"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:45:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:45:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 14:45:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qse1+7UVJ22n0HTd6HSkZR5pYfY7D5jLGee8wJXrVR49F5+rG8Ytto0yx6FUTNy3D3Un4S92klA/008zssJVJNji4uZ2NPCJf3roWBGKb4xGL7oP88GZlDQpobeWIsWj8QvuqU5no0sO4K7EYIGfXqiv9Yxg9LSUsUc9bzHvcjd+cRZG7gmt/+CAp24Hb8pnV56NCHRrQgNkZTRkC1pcROqm0WaJBvRm3UUUNCz0xSUvhq4rkuJyX+EkUZfBDTCM529v1BSZBoVi8xr2Cq+vTs0Ra6a3Mpy68iTTjUI+ZsXd5ORhE3maYUUuRIlWMFDBk4uJcNKAgf/MPHtm2LUxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDVeHpHgBp83KVu565lBQAtp1TP5Bq1cLwoVZ0IDIg=;
 b=FUipW88GP5ppaI8pBJoz2csyt7nFxZh63VG+WrermrB8KoxUlYNu5mk3Rq6mh5sUvWQ4QtStU4ONnnaegUAyDKeXbLTzsjAf2zPeotuVR9EFtTnsPQo8ExsJ8ISEd5JVs7+jq6FJ5bCcrpVfKCOD3BwyOLW6LrhlZbq33Mszh02y+S+likbJbgO8mR48SDEQnC6wqN6yObukRoy6whPk2udzFHrBFg9a/XGyXxcP9xhhPqzaCL5KrRgeI909X/SYPH4mnUFqi4O7PfxGysjSEbKmD107susTAoIqB6FxPrVZE9cnn91dVYyDbXhir3H/Qa9GAV6pCl7SgBmmdSIZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Tue, 7 Oct
 2025 21:45:10 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 21:45:10 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Nirmoy Das <nirmoyd@nvidia.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcNHXEB6idhqOgWU+kU1kBCRCfnbS0+juAgAI8MHA=
Date: Tue, 7 Oct 2025 21:45:10 +0000
Message-ID: <PH0PR11MB5112114AB54D4B50E838F72CFAE0A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <e1310d88-af63-4beb-9a82-6f04b00b6f3e@collabora.com>
 <47d1cebf-710b-4799-ae2c-f586b52177c3@nvidia.com>
In-Reply-To: <47d1cebf-710b-4799-ae2c-f586b52177c3@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|DM4PR11MB5309:EE_
x-ms-office365-filtering-correlation-id: 164c352b-96b8-4778-f01a-08de05eac9e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cWxDWm1CSndIZWp3WmYzS1g4ZVpCVllMSUk1YjgwYmRkTTBFWitBZTN0OG9a?=
 =?utf-8?B?S0xVcWJZcFRXRzFTVFk1T0lUanJySUpPMnlrT1JsTkt2Z25UbEdWOE1FU3JM?=
 =?utf-8?B?N3ZrRGllMHFDTytjUHczSW8vVnVBSDJiaVh0aktLdjM2OXJCWklEZ1lreTRG?=
 =?utf-8?B?RVI1eFFnZnpDNndqYStxNWlndkVVaEd5SUVTUHFKU3VoWFM2Z3NhdDBXbnN6?=
 =?utf-8?B?SkYyYW5ROFhEcWoxKzc5UWVyMEpBZCtTbHo4cWhvN0cyQ1VoaUdwR2VjWng4?=
 =?utf-8?B?QXhHY0NlYkRZQ2k0ZFVrZ3VOSTRHbG51cFBvNnVMTDJmZDVxOUs2am11U3lD?=
 =?utf-8?B?cHZ1Nng3M3JiR0dNVDBvSWlJY0F2TnVUT2l1MlBIdEdNdzh0ZzRITUFtT0J2?=
 =?utf-8?B?TXh5RFZIZXdjNnpBNlI5MHhYVXdKb0lOWEUyZUMzNm01cys0ajFYaE5DVEdT?=
 =?utf-8?B?UEVaUm42eDA4SlF4R2ltbUtreDUvZXdwK1MxeXo3dGM5NFhHcnYwYkJ4Mkkr?=
 =?utf-8?B?Q096UFJXR21ndGZrUGFqaFg1Ym43ZFpMYkZTRlh1TGRIZ2JPTlNKSWJCbGJK?=
 =?utf-8?B?TFo5MURHMW02RWVlZFQ4RWJqNDZwOEQvbmNsSEo3ZjRORmx2c0RqR2Z5cWhJ?=
 =?utf-8?B?NXlHU3pwczJEbHZ0YUV3WlYxYU8yWFFKdDEzTGkveGFpczNWYlFFVU1QMklu?=
 =?utf-8?B?Skg1OG5rd3dhUUdKM2VhWDJvU3Q1cm9acS8vWjdHZG1lbWUwMHZJbzRpdUE5?=
 =?utf-8?B?eEhtSzFWRUVRYUQ4UGtmcThQTThpU1dVNlJCeis0QklvS0Fmd1FkTXN0ODlK?=
 =?utf-8?B?NVZ0c0ttSTlJY3B2MnJBYjJFSkNIYnFTdG41bnRpWFdjUUlXSW85aERtMitJ?=
 =?utf-8?B?MUdMVUhyZUdVbHl5WHg4Qk9LTDYyWmFINnErRVdoakJneHRHa3o1aHRkYXVK?=
 =?utf-8?B?UDVaazRwcWpKWEhLTjNzZDl4NlVwODUyU0N5RnBDSEpSMGtGVjV2dW5XVmpw?=
 =?utf-8?B?M1ZBQlo0bHVvSkRVNktvMmFZTmxTS2krenVVdnd1SGYvUlZGc3NUVWI0cVZX?=
 =?utf-8?B?QWQyUGhNUndocDRqRmgyZlp1eUw1TGdnSXVkeEpCSW5mazEwdGFGaVEyZjVr?=
 =?utf-8?B?NkpMNEtoOGV5K0EyWWd3T25lZ2lDWjRzMlpwUjkzMjk0RDdCR0o2amNjYkNj?=
 =?utf-8?B?Y2VpYTFsRU1Wb3JzRi9OT0FCN3JReHk5ajBkRmhRSjhaU21CT2ZvbUJrWXdO?=
 =?utf-8?B?Yy9UZTZ6YmY0WWZHNFlZRkZFNEdxbDlHaXR1b25LTkFnTURZblhGdURyU1Mr?=
 =?utf-8?B?dkpKbkVXNnovanZlRXE4alRSVVh5SVhaVlhZa3pxZUhZamlOa2hmUUNHM2Rp?=
 =?utf-8?B?bEVEeTBQSk0zWll6UkZSenRXN09QRzhLQ2poMmE2b1BOSWlsY0hSSGdRb0kz?=
 =?utf-8?B?NWVwWVFZdWYvM0RRbktvWHNFaGpIN2NYSjBab3BSbjY5Q3p0eG9maVNITkJL?=
 =?utf-8?B?bEI3U3k4NjhjSWxUWjUzN3cxQWx3V1lyRjJDc0RycWxBT3lZajJFVk42eGdC?=
 =?utf-8?B?WlA1cndPRXVOelJ2N3RyZjhYUkt0NzRFejA5RFZEdHc3OC9vS2ZWaFFxWGJN?=
 =?utf-8?B?djA5TFZYem8reldYWVpUdXlVK1liN2lsMDNBK25IZmpjclJXYUROU2pENE1o?=
 =?utf-8?B?bDlWd1hDTGNZbUorQW9hMnpiSVJrK3J0aVZzNm9wbUNwekRyeDhlNEpJcDU0?=
 =?utf-8?B?ZnkzWnRmbWNMQTZwTCsvcVQ4Y283cWY3d1loelNMQ2plcVVYSmNYdXNGRWFw?=
 =?utf-8?B?Zmpqb0J3NTdnSXJ1TXNhMUxieVVIdUpUdTd1bDBvM08wZTJDNWVpYW5RU29v?=
 =?utf-8?B?a3ptVWVsSVJtQzlTQlhTcEJuMnludjlmd3g1MFhxWDFzamo2VnRPbEJtekhx?=
 =?utf-8?B?dzdlaG9qNXo0eUJPQUdCd2ttU3ZrMnhRMHRBb2dyMmJMdHhLZVRNdjl2SWFv?=
 =?utf-8?B?STZodFRsc2xRK1NyNktHOEV3eklpY1JYemhoaWU2cDR6YlZNdnI5aDZ6RWJ2?=
 =?utf-8?Q?lh1vg0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUVoOEgvZHlBLzNJZGFWbE5MSnlKYW9QN2ZITERMUEtSTXFFa2NIQTFZbUtl?=
 =?utf-8?B?NzN2cDR0Z1c4ZUh1SWlWak45S3Z5RGNBWTRpbkhVQmVCaSthd1lVV2x6c09u?=
 =?utf-8?B?dXloUTFmRHdQcFE0RWFWdW9YcURIRWN3NDF4MXc0QW1tR1pONXhEUmxVT0NC?=
 =?utf-8?B?am9lQ3JVZ0FDR0VyUW1ZNmZRV2xBZmlXQjRSU3pjS3Y1T2ZmaThtTGhCSUdM?=
 =?utf-8?B?emVCaVlxYTZkWGdobDFVRldzUXhGb09ROFdTUWhXd3VqV2x0eHI3bjViMlRK?=
 =?utf-8?B?cmdidU1YVnhwUms2Z2hpR2ZUQ045endZTFFkRlBDRHdIUzIwZ3FOSEJsM0hR?=
 =?utf-8?B?NFdhNEMyWk10WWJNK0UxVk1yN2hIOTRub3lmRzVLb3FQS1RJVTV5QjRNUCtN?=
 =?utf-8?B?aDJIMEpjZ21lV0ZHRmkwMm15aTJ0M1p2SFVnZm8yNGlIbm50RkE5RGtBY0Zh?=
 =?utf-8?B?MEZOcjQxTGMzQnNUMnBzRzl2SDZ6bkFxYkRHZk5VTWNoa0FaR0V0S2ZjZWJQ?=
 =?utf-8?B?Y01BMjNlT1MxN2gvVlYrY0pPUnBYNGdtcjBVUE4vK0JNbmlkUG1TRE9DUzNk?=
 =?utf-8?B?QUE0UGN2VmNxNXV5YmdKVmNKS3M3eGFZeUVIRllKN0dwMUxXRmNtS29tM3ZW?=
 =?utf-8?B?aDRrSCtLekhtL0syUHhMaldpMVdrVm50NmEyZEpJalNBbHB3dm5NNkE0NFV0?=
 =?utf-8?B?S3NPTEpzVFV6UUhYMHRwN0VCazFXWU0rVFhxVEl0Y2daeVF2R3hLVjJpWnZN?=
 =?utf-8?B?QnYzMkVkNHVaNlFMZWJITHd4aTc3RjNLSzE0S2RPdFNXSlB3WmJMWXZhKzdj?=
 =?utf-8?B?T2RDcjFWSERla0cwYWJoenhUcW5LY0dXRE4raWNkdkxvMlJIbmFGWlhpWURR?=
 =?utf-8?B?RFFOUTdWZEMwa0NnUXBEbFV1VU1xMlZxWG1PVnJoamREVzc4d3VoL0Jrb1Nz?=
 =?utf-8?B?Zjh2UWFLODBzeEIxMGlSWWdpT2tmRmwvRW1hblpvOU00WWVWWWxYRkJSZFNM?=
 =?utf-8?B?OGJkMVJ2ejIzL1BIN0k3U0xyL2FoWU1FWGpoTkxoeXh2dmtncitPeHM2SjNT?=
 =?utf-8?B?dzVzWVl2T0loMSs4U3VsZWVBQ1o2d213ZkU5cUV1K3RjK3lKWm1RbHZ4cTIx?=
 =?utf-8?B?KzlxbUtRT2hQcFhkNTJwejlITjU1WUxvc1VzalI0L2c4c2hZS0VUdmI0cFhO?=
 =?utf-8?B?K21WMkIvK0RtaTlsY3R0TE9hZnpzOGpCNWJIM1BHQU9PdWg3VXpveWJPd21a?=
 =?utf-8?B?Q2V0YkxqbTBvcmtQZXlVbCtKMzdsSnhNVVE0TDJWaTVRMURoaHJxZ0ttS0kw?=
 =?utf-8?B?Y05sNGV3YWZjc0FuWjZmWFpVQ2VSTzhQdW9SOEwraFFXVDJqQ2U0S1dtamZr?=
 =?utf-8?B?YnUydmo1VU5NZk1iblNLNjNnUmNPYTVzcFdKVDFoclJnSU45ZFlZc0cySG16?=
 =?utf-8?B?SzlFSGI3OTE2TU12VnBsdm1Sczd4YXJaNzlRRWcxdXBoNU01S01aSmVZNERS?=
 =?utf-8?B?WTNhM3ZaSFZMTXp1bzVuL1IyaWkxNHN6SElIUUp6QnE3Q3BpL3A3ZXM3VW1s?=
 =?utf-8?B?b3poQkxzcHBnNjRoSVhPUGtDYVdnMnJpeDNTVUh2UDFMclJEUnRFaEdGd0xX?=
 =?utf-8?B?SVQrOWZ2NWRlVWVkQjNDaGgvUkoyQjBTNS92cENtYjZxNWRXS1lYZ1NHeHZs?=
 =?utf-8?B?d3FnWkpaOWdvT0IybWdORHBCeS9zZ0greGYxd2h5VTVaZ2cwbWkwdHQvRk9M?=
 =?utf-8?B?WFArUE1Gb3U1VzlEV1lNbkI3dGV0ejNLUjFiV3hDaDRjcVdsaEJjTFBPNE94?=
 =?utf-8?B?bU9aUzVRNEx6Z2orbFUrRURJRk5veUhWajI3bVUyQVlONHVydFA1UFBOWHRs?=
 =?utf-8?B?OGZxYXpNRWRoWTFaQWhsT2JoNHQxbTdHcjJIeVFodEYzTy9CZzhMd3k5TUQ4?=
 =?utf-8?B?MVJLZlVKbDFxb3RMdGhJK1JvV2YyRDY1ZFB6R2Rxenlna0RoZFo4em9nSlFD?=
 =?utf-8?B?OXpCeHhrYVBMaUIzdUZHVnVhMTZTVUhxOHBqMzR6aXgvbUpYeUczM09ObmpZ?=
 =?utf-8?B?b2xSMzJCUXZ5OFNTdUJxdlM1VWpmTEUxdXZYNzNKck9zZVpUcEVNeStpYVN5?=
 =?utf-8?Q?IMeBrCTMsyPbX9IdEnX4gvKCC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164c352b-96b8-4778-f01a-08de05eac9e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 21:45:10.0568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEIvqwpl0PE2dMEHwH5YakRWlhJBgUfnIj+nTtIBtlCuoYQjFPISXFSf9Hs6GWrdvSd2GePfgSKGap2PRigaYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

SGkgTmlybW95LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcNCj4gdmlydGlvX2dwdV9vYmplY3Rz
DQo+IA0KPiANCj4gT24gMDMuMTAuMjUgMTY6NTQsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToNCj4g
PiBPbiAxMC8zLzI1IDA4OjM0LCBkb25nd29uLmtpbUBpbnRlbC5jb20gd3JvdGU6DQo+ID4+ICsJ
LyogZm9yIHJlc3RvcmF0aW9uIG9mIG9iamVjdHMgYWZ0ZXIgaGliZXJuYXRpb24gKi8NCj4gPj4g
KwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfcGFyYW1zIHBhcmFtczsNCj4gPj4gKwlzdHJ1Y3Qg
bGlzdF9oZWFkIGxpc3Q7DQo+ID4gVGhlc2UgYXJlIGJpdCB0b28gZ2VuZXJpYyBuYW1lcyBmb3Ig
c3RydWN0IG1lbWJlcnMgdGhhdCBhcmUgc3VwcG9zZWQNCj4gPiB0byBiZSB1c2VkIGZvciBoaWJl
cm5hdGlvbi1yZXN0b3JlIG9ubHkuDQo+ID4NCj4gPiB3aGF0IGFib3V0IHRoaXMgdmFyaWFudDoN
Cj4gPg0KPiA+IHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCB7DQo+ID4gCS4uLg0KPiA+DQo+ID4g
CXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdF9wYXJhbXMgcGFyYW1zOw0KPiA+IAlzdHJ1Y3QgbGlz
dF9oZWFkIHJlc3RvcmVfbm9kZTsNCj4gPiB9Ow0KDQpZZWFoLCBtYWtlcyBzZW5zZS4NCg0KPiA+
DQo+ID4+ICtzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF9kZWxfcmVzdG9yZV9saXN0KHN0
cnVjdCB2aXJ0aW9fZ3B1X2RldmljZQ0KPiAqdmdkZXYsDQo+ID4+ICsJCQkJCSAgICAgICBzdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKSB7DQo+ID4+ICsJc3RydWN0IHZpcnRpb19ncHVfb2Jq
ZWN0ICpjdXJyLCAqdG1wOw0KPiA+PiArDQo+ID4+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KGN1cnIsIHRtcCwgJnZnZGV2LT5vYmpfcmVzdG9yZV9saXN0LCBsaXN0KSB7DQo+ID4+ICsJCWlm
IChibyA9PSBjdXJyKSB7DQo+ID4+ICsJCQlzcGluX2xvY2soJnZnZGV2LT5vYmpfcmVzdG9yZV9s
b2NrKTsNCj4gPj4gKwkJCWxpc3RfZGVsKCZjdXJyLT5saXN0KTsNCj4gPj4gKwkJCXNwaW5fdW5s
b2NrKCZ2Z2Rldi0+b2JqX3Jlc3RvcmVfbG9jayk7DQo+ID4+ICsJCQlicmVhazsNCj4gPj4gKwkJ
fQ0KPiA+PiArCX0NCj4gPiAxLiBUaGUgd2hvbGUgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkg
bmVlZHMgdG8gYmUgcHJvdGVjdGVkIHdpdGggYQ0KPiA+IGxvY2suIEJ1dCB5b3UgZG9uJ3QgbmVl
ZCB0aGlzIGl0ZXJhdGlvbiBhdCBhbGwuIEluc3RlYWQgb2YgdXNpbmcNCj4gPiBjbGVhbnVwX29i
amVjdCgpLCB1bmNvbmRpdGlvbmFsbHkgcmVtb3ZlIG9iamVjdCBmcm9tIGxpc3QgaW4NCj4gPiB2
aXJ0aW9fZ3B1X2ZyZWVfb2JqZWN0KCksIHNpbmNlIHdlIGNhcmUgb25seSBhYm91dCBzaG1lbSBv
YmplY3RzLg0KPiA+DQoNClJpZ2h0LCBJIGhhdmVu4oCZdCB0aG91Z2h0IGFib3V0IGl0IHRvbyBt
dWNoLiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGUNCmVycm9yIGhlcmUuDQoNCj4gPiAyLiBV
c2UgbXV0ZXggaW5zdGVhZCBvZiBzcGlubG9jaywgd2UgZG9uJ3Qgd2FudCBwcm9ibGVtcyB3aXRo
IG1lbQ0KPiA+IHJlY2xhaW0gc2l0dWF0aW9ucw0KDQpJIHdpbGwgdGFrZSBhIGxvb2sgYXQgaXQu
DQoNCj4gPg0KPiA+IHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfZnJlZV9vYmplY3Qoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopIHsNCj4gPiArCW11dGV4X2xvY2soJnZnZGV2LT5vYmpfcmVzdG9y
ZV9sb2NrKTsNCj4gPiArCWxpc3RfZGVsKCZiby0+cmVzdG9yZV9ub2RlKTsNCj4gPiArCW11dGV4
X3VubG9jaygmdmdkZXYtPm9ial9yZXN0b3JlX2xvY2spOw0KPiA+DQo+ID4gCWlmIChiby0+Y3Jl
YXRlZCkgew0KPiA+IAkJdmlydGlvX2dwdV9jbWRfdW5yZWZfcmVzb3VyY2UodmdkZXYsIGJvKTsN
Cj4gPiAJCXZpcnRpb19ncHVfbm90aWZ5KHZnZGV2KTsNCj4gPiAJCS8qIGNvbXBsZXRpb24gaGFu
ZGxlciBjYWxscyB2aXJ0aW9fZ3B1X2NsZWFudXBfb2JqZWN0KCkgKi8NCj4gPiAJCXJldHVybjsN
Cj4gPiAJfQ0KPiA+IAl2aXJ0aW9fZ3B1X2NsZWFudXBfb2JqZWN0KGJvKTsNCj4gPiB9DQo+ID4N
Cj4gKzEgSSBoYXZlIGV4YWN0bHkgc2FtZSBjb21tZW50cyByZWdhcmRpbmcgdGhlIGxvY2tzIGhl
cmUuDQoNClRoYW5rcyENCg==
