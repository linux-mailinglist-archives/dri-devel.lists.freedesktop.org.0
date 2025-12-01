Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E4C964EF
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B81910E35F;
	Mon,  1 Dec 2025 09:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qg3bKrY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A70510E35F;
 Mon,  1 Dec 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579784; x=1796115784;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aix/p+a9R8ADHmNUT9Y7rDDB/gTlAWmj41OXlIR7GFM=;
 b=Qg3bKrY4hBNa6GrMqENB/7u8iuaWNL3eOcX3D4cp1iL2NcP0QVwPynW+
 w2PnzVf27jZMLNN9tKx3jP1hLhiiYMGQS8vLslYJatq3RgyFCWBZw00Ys
 L/WH1BGSzqsdXFpOeT7cKlRDKnIYXp/HCMa1Wjw4S/+HfDFenRvFOGsdv
 W/MMT5jUQitWtU5yDkHBukoKxmqPBxKzdaTdnRvJasFACwfMLAOEv9ReR
 n0Gk/4KP9sMuAn5RIwb198QGjFwfnXTdvkUUzkevT4BIP61mvraE8VW/H
 VwCAYM7bgBOYPQoMUpHzQ9jNQuCMBSnlgR9oFh/K/uftVGqgEybAAPFVF w==;
X-CSE-ConnectionGUID: HsXH5fDyTeOiOqT3ECfz+g==
X-CSE-MsgGUID: 1zbGdHYWSnaHDBozJQTtIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69106989"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="69106989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:03:04 -0800
X-CSE-ConnectionGUID: esQg0ky8Rw61P2KrJwtxNg==
X-CSE-MsgGUID: KT8wKDupRGCMr2tfZKPSWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194219074"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:03:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:03:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:03:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:03:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUiSCJxoIyEMadiguaJ+WL3cMF499Al9K+hE6i8P6yfN6tesj+CNmyJXytHmom1HWi97QqOi1hPtEs+/ZBeQh5ykE4+qYz5KQxKNaR3uJRTOTif8AERrlm+iom7vHu+LdV/yD0bDZEvlxmiUh2W4PYdTQ6q30ysbTDkZWRzVTkCKhBMK4oDf8I6/7NCsQ5BCzm+y9kosL8udLURlGrzuF89OGbvE9Fh+7pR1uo0aWIPHGgDYOOd76DMsIQ45WH1iRb665fXKfJlouMqMQsSpPPbb5BhtpUR8zGVb/QMsxvOXtlv9DlD2Fmgqq9FVX2pn/0tX8wJS9blLv9CRRr+rQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aix/p+a9R8ADHmNUT9Y7rDDB/gTlAWmj41OXlIR7GFM=;
 b=dtjUX+52glWDc6yq6Bn3nkej7jSnHh0v+b6ABuZNTXiByubmzV3zty6gAfqM0CFCRBXlm/zdAFKkJFDt4DAktVeGuC9IqlLlhq2tJxuOfSt1arRsLsqwsD7RQUq45b9v+C26Rosqor7SKoUr+F4r5MqikrxXXZmC78caNwHzRntIJUi064DXUsVMUHNJoYMK34CapT5tWI/t63+2NRtrw5msW2pt8T4VFjxhoYtqA2oGAjW++d/Ic4aNft02gkBBUsV2osxVg7F5qRw0n5GZrslwDWQGqI0pU1te7UUhkYEOVEl1MfAOUi8V4QGEQvtOg28NzTlRsCaXANhmIK+D6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:03:00 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:03:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 04/15] drm/i915/color: Create a transfer function color
 pipeline
Thread-Topic: [v7 04/15] drm/i915/color: Create a transfer function color
 pipeline
Thread-Index: AQHcYozIVRSt6CkDakOUY3coN+cNRrUMfQ3A
Date: Mon, 1 Dec 2025 09:02:59 +0000
Message-ID: <DM3PPF208195D8D9F812798E4298F0285A6E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-5-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-5-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CO1PR11MB5057:EE_
x-ms-office365-filtering-correlation-id: b2e5653f-e545-421c-f105-08de30b86d6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eHNvRS9TejFVN29EMk1GN252aHlBUEs5TEZ3dnBxcTRDVlZiTzB4QzlYc0Jy?=
 =?utf-8?B?OWQ1djUwVk5GTE15cWZJeHBwT2hWb2c1TnBrVlp1VUV3ZFhjV1NacGovd2Z3?=
 =?utf-8?B?RGhVY3EzdW1waW5LTWJESWZmWXFJdjBqZzJMMFd6VTU1YUtKZFQ5cHVoZWox?=
 =?utf-8?B?RjQvWVVzeUxVQnFMODJ4eDJDZmszbUNkejNsWXo0R2tPclNQbWF3UWxYVitK?=
 =?utf-8?B?MEh0SUxyVCtNeVlTbVVwR1IraGs4cGd2TmRSQi9FTWY3aWxkU1hacElRUmx0?=
 =?utf-8?B?SmFYNUNCQTdBeFlNWld4RTZxUG1IdXRJTVBvUlJjSlhZMWhFdU83Z2hmanRK?=
 =?utf-8?B?eE1aeWpvditsWkswL2JIbDRFcHgwQndUQkJZenpMVk1CS0lnRHdmVUFUcEpK?=
 =?utf-8?B?QSt3eElUOWZwUmJtNzlsaHA1bjV1THZDYUtPRVRrRTRUT0NWTS9rdk50NXEx?=
 =?utf-8?B?eldwNEdOZDdMRG9BR25obkVmQklkY3dLZ29SSWRBeEVROWszSmYwdFlZbDVi?=
 =?utf-8?B?NlU5SUt3UEpWbW1qckpQeGpVdmZDWWV3WVUyeHBCUGhRUjZlMkxHY0lPaVZT?=
 =?utf-8?B?Z2RjYVMweUxFS2I4bXo4NUpMeFRkSTFtVnE0eHNtTEpjWk5EMjVtTVBzb3BX?=
 =?utf-8?B?SHVYVmkwa2JXeFZNVlF5RnlnQWpRVUVLZHJ3K1NsQ0NyUHB5bTJKcmdwOGxq?=
 =?utf-8?B?ZnRqTFhuSTVlbGVLT3c1QmFJQk5ndzlXdWVpSkRGaktRdWo5aFA1N2N3ZDVp?=
 =?utf-8?B?Y0t3c2tSMnRZbVp0RlBqZ2pCeG80UVQrUndJbnNteURjSnBEYmU0RFpOMlhP?=
 =?utf-8?B?cmp3Zmw2c1NsYWY1MTdVcjNEM2FiWVg3Yjcyb29SdG9QZVhlck9PKzJPdlR0?=
 =?utf-8?B?UHUzZTRaYnJYQUxqVE82c09VekFKMTVtZ2g5bFREYTJpWWpxbVl5ZStUYlV4?=
 =?utf-8?B?cjRBZmE4Y29xMEM5eWpDVXhNN0Rramx3eDRGRURZcTJVS2pCY1ppMGtWT0xm?=
 =?utf-8?B?LzdMQnF5dWZRbU5vd0pKTDd4L2lvclZOTWZkb0VxRTBFN0V3Q3FLV1M5bk1B?=
 =?utf-8?B?MUlEclZ1RUJxYnRSMXdCZ0ZBQlJXWlFHdjArMDlpb09rVDl4TjNOa2NaM3FK?=
 =?utf-8?B?ZnRKcFhEbWxmRjJ5MWdHU28ybEIydkcvN2VTa3RzYjNsZVFSV1ora0RQcmRi?=
 =?utf-8?B?a0JDa3dqSmFtYmVpSThoZlltdXl2dEpmU241UllXM3FVdHFQT3hEQzFLVzZR?=
 =?utf-8?B?WHU0b1NMMEo2alpScHFWa2tZcDkzSFBVRnJIOEtEZWpJQWtkc2VPRHNKcWZo?=
 =?utf-8?B?MVZVSXI5QWo1bVZyNjlvcStFdkhFUU0rZzdEakhPRmhyNk5UcUNhMVlpZUdk?=
 =?utf-8?B?UGVCV25EK0lnTFkyM1VCckZkQzNud2JSRWREL1JxaHBERStiVlI5OGkzbmMz?=
 =?utf-8?B?Wnl5VjJMWTlUaTVwMDRXTjRjSzU1MWlEMzhlUGs2SUE3RTd3YVJUYlRmK0dx?=
 =?utf-8?B?aUk1RXhJcEMyOWQxbE4wTzRMZU9QcS84RDhFZU54V3dNbEVzN09ka0hlMUs2?=
 =?utf-8?B?cG9ZdVBBZ0U1Mk9vVjRtRlBvc3ZuekdPbExBVEkrck14aXo0bkE5VVJLVTJn?=
 =?utf-8?B?WG1iVjYzUnJGS2syZzVrRjVjc0ZmMGRpMXhhSDdiNldVUkVEWkY0MVMwUE1z?=
 =?utf-8?B?TTVaam9sM0FRa1VGcHpjRWdBM08vR2g4WUZ0bm5tc0w1QTVTbm9pRDU0Q2pO?=
 =?utf-8?B?SElyRm95Y0hJT3U5M01DZHpRY0ZFUUp6NWVXTDc5MVRWY21SMVA3UE9JZzV2?=
 =?utf-8?B?V3VPdlNoVjZ6a0lkb0ZyaERET0hHT1p4dTVRMHRKaG11QzFZYmRKMnlvK1Er?=
 =?utf-8?B?bGFCRm5ZMXZaMC81Rmc0MEQ4Mk96QTVSUUw5VC9CWnFPc1kwVVZ3Zk9mWjR1?=
 =?utf-8?B?OUdtWDk3TkRFdFNzbWtORk51YVdmQk00NWwraXAyenRqekthcGdCeGY1SkhW?=
 =?utf-8?B?R05BYVN6dVJFeDBvVDBNTGxMZU93L1E1M0NKQUpuYU1MbDRyUjFWMCtiK1lv?=
 =?utf-8?Q?WK0MAk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHRIYzR1TGdVK0pySmZSVi81WTJWc0E2OFNwcEZrQnRCZ0REbVV5ajBpQm1r?=
 =?utf-8?B?V1VobmUwSytXbHBXTjYzMmoydzAzb0FBS1VsVzk4eTI2U3lzdEZpU3pyakJN?=
 =?utf-8?B?MTBTNUpDczVVa2J6emdXZWFQdnZLRkNSeHQwRkJXbnUzeWJtdTkzdGRRMDJl?=
 =?utf-8?B?TWc0MDlleXlTbGhhWmdDK1d2L0QxVUtDeFpvYldLZ052NDk4eUk1RE9MWDBq?=
 =?utf-8?B?aGxFVGc2dHo3SkFxSXgwZ1JNNzEvK3pIMnVOQ1pHd1JQemVQNDFuYUY3Z2VH?=
 =?utf-8?B?cW9nMW1yOHJxeHF6TGFTYnF0ZVUvekRxOTJHc2FCY3B5eFlJb1BpdnlVSTIx?=
 =?utf-8?B?bzQ0MU1IeklQSUorYS80SGlSNUxBY1FwSS9JSzVrM0lTa3RDMVpZKzU1R2cr?=
 =?utf-8?B?YXErK1BqcHl4bkV6b0l3U0wvejVkMHNqUHQ5eFJwR3hPUnY4bFI1NElYM2Rp?=
 =?utf-8?B?U3pRSGF2RGZNUlJHanRVQnRyUTZTTUZXNE94WnpUWithK1BDZFpjdWtOT3Bj?=
 =?utf-8?B?TUNzZXlMQ3k5a0Vlc3dncFhiM3BNeURzdjcwMzY1YjFNMWNpWnVtYktEaksy?=
 =?utf-8?B?eWpUUCtOcERTWExySjhJZGkvYVRzT1BtMWJqWkhzY0VWUll1L0dvaEdmQW1z?=
 =?utf-8?B?aFNCMWRadUpSczQ0ZWgwWmxyaEt2TGN3UmJSRTdqWlh3aEVkT3VXMTM0OXVB?=
 =?utf-8?B?MzVFNk1oNDlWN1FjMjdBV3BOY0I0THVxSzlCbmN4STl4QmZBOTZNeHNyVEhF?=
 =?utf-8?B?U3RBanRiL1Zvc0M4dUJLMVBhNHJPcG83V1VzV2N6M1l0TEdaNzNhdFdJMHgw?=
 =?utf-8?B?L25NSXVCQzFoLzQ2dFRDSkd3SnNYLzRLK09aUzdydEU4YzF0OUs3QzFNY3B0?=
 =?utf-8?B?aXlZZlJYOHUvSkZ4clNXYmhwdndBQkZOZlhhNWpIRXpYaHl1VUFHVDFyR3lX?=
 =?utf-8?B?VXhGTUhzSkxacDBVMHJFMzMveHg0MjdmbUc4bkVidUhRVzZDK2J6TXd4WENy?=
 =?utf-8?B?eWhLQWsvVUplVUJsOWhUVTFCUFI3aXc4RVNyeVhoU2duYWMvZlYrNUNXVmpl?=
 =?utf-8?B?TWZpclZ2aGVSSGVjMlo0amVGOHM2NXhwYU5oZlNwdlB2amNkOVlaRXR3emFp?=
 =?utf-8?B?Mjg0YkNUajVFdWxuSi90aHhSVkR0TXpBdmJycEhnK25SR0Y0YlcvWXdqQTlu?=
 =?utf-8?B?TCtvZXNjbVQxVmc1Z21kNkdybk5YbmZCb0oxV1JLU2pSbVJ6Qm1oSldJbVpN?=
 =?utf-8?B?TUQyeEZoMHVHTURuVlo1Tm5LNjhnakp5RDlUVlFsTEdObTFkSGhjMVVNa0VV?=
 =?utf-8?B?cE9DaitKa1JyRkg1dnE2b2h0MHZ6elQ2K3dIM3RFSkJrMTFBZks4d2YwNVhR?=
 =?utf-8?B?OTVIWVFDN05CVWZxeVVDT29IVjhDOWlCYldBK0NPdzBTQkpiTi9aU1FrcThN?=
 =?utf-8?B?TGtDZXBzU21TRUFGaUpIUXFEaXEvd3JBQ3h6TnRUWGVXZkN4NTdzWXg3b1Zs?=
 =?utf-8?B?MGo0aWgyc0VRMEVaeGxPcU83TXN3M0loZVdvc3lKWExYd0g2QXhabWVzMWFI?=
 =?utf-8?B?NzdSY1cwQ2h0LysyME9IaktXL2wvVEdsbnkzSUl1OWlJSGVzWlpVNndoeUp6?=
 =?utf-8?B?ZVBPb3NLYi83VjlOeWxpNDEzMXpTb2VtNWk3VlA0NXJ0VTR2NlhkaWp6SGhh?=
 =?utf-8?B?cTkrNzM5VUVsVUFEeVNLY0w3S2kyZkRWUWZuZzMveEIvc0dpWG5nWXdYMkFY?=
 =?utf-8?B?dTBIcTJjREZ1aThwd1p4OTFHU0pweDVSd0h3bklZeEVtY1R1MnQvNkxRV3hR?=
 =?utf-8?B?YnY5SHZCUDh2M1JLOUhMUndsMjhkdTlSbTlHdklJNmVrREIzOGdwQmhRR25V?=
 =?utf-8?B?U05KOE1RK3VWczJJQnlzRUpSQXZhaDE3TUpZM0s5TFJqVmhvN0twMEd4ZUNQ?=
 =?utf-8?B?cU1BcFBQMFU1UG5MWm15QnlaQTB1WXU5TCtMNEViMU0rdGhxd0RkU0NVOW9h?=
 =?utf-8?B?RjRrSHpMZGJCZm1RNnd2dXpZMFNQb3A1RWhwMlhLaERKTmJHWS9xNm9GL1hW?=
 =?utf-8?B?d1Y3bFJIM3BOcDRXSDdubXlMV3M1Tmc2MzlsNXdkWERFbkM1L3dYYUxrVXh0?=
 =?utf-8?Q?upEj5jhIezwnUsuX+l06/nCw/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e5653f-e545-421c-f105-08de30b86d6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:03:00.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdTLUEA2T8jRX6gdgymrCEywCqh1ytkY1wdldhV64oS2A1U79NHyozLrJtUvLmBLQzqec7yhBX3E/aMSvtrtHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

PiBTdWJqZWN0OiBbdjcgMDQvMTVdIGRybS9pOTE1L2NvbG9yOiBDcmVhdGUgYSB0cmFuc2ZlciBm
dW5jdGlvbiBjb2xvciBwaXBlbGluZQ0KPiANCj4gRnJvbTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFo
IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiANCj4gQWRkIGEgY29sb3IgcGlw
ZWxpbmUgd2l0aCB0aHJlZSBjb2xvcm9wcyBpbiB0aGUgc2VxdWVuY2UNCj4gDQo+ICAgICAgICAg
MUQgTFVUIC0gM3g0IENUTSAtIDFEIExVVA0KPiANCj4gVGhpcyBwaXBlbGluZSBjYW4gYmUgdXNl
ZCB0byBkbyBhbnkgY29sb3Igc3BhY2UgY29udmVyc2lvbiBvciBIRFIgdG9uZQ0KPiBtYXBwaW5n
DQo+IA0KPiB2MjogQ2hhbmdlIG5hbWVzcGFjZSB0byBkcm1fcGxhbmVfY29sb3JvcCoNCj4gdjM6
IFVzZSBzaW1wbGVyL3ByZS1leGlzdGluZyBjb2xvcm9wcyBmb3IgZmlyc3QgaXRlcmF0aW9uDQo+
IHY0Og0KPiAgLSBzLypfdGZfKi8qX2NvbG9yXyogKEphbmkpDQo+ICAtIFJlZmFjdG9yIHRvIHNl
cGFyYXRlIGZpbGVzIChKYW5pKQ0KPiAgLSBBZGQgbWlzc2luZyBzcGFjZSBpbiBjb21tZW50IChT
dXJhaikNCj4gIC0gQ29uc29saWRhdGUgcGF0Y2ggdGhhdCBhZGRzL2F0dGFjaGVzIHBpcGVsaW5l
IHByb3BlcnR5DQo+IHY1Og0KPiAgLSBMaW1pdCBNQVhfQ09MT1JfUElQRUxJTkVTIHRvIDIuKFN1
cmFqKQ0KPiAJSW5jcmVhc2UgaXQgYXMgYW5kIHdoZW4gd2UgYWRkIG1vcmUgcGlwZWxpbmVzLg0K
PiAgLSBSZW1vdmUgcmVkdW5kYW50IGluaXRpYWxpemF0aW9uIGNvZGUgKFN1cmFqKQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlICAgICAg
ICAgICAgICAgICB8ICAxICsNCj4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3Bp
cGVsaW5lLmMgICB8IDk3ICsrKysrKysrKysrKysrKysrKysNCj4gIC4uLi9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmggICB8IDEzICsrKw0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxMTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuaA0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gaW5kZXggN2MxOWQ1MzQ1ZDg4Li5jYTVjNjlkMWNi
MDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+IEBAIC0yNDEsNiArMjQxLDcgQEAgaTkx
NS15ICs9IFwNCj4gIAlkaXNwbGF5L2ludGVsX2NtdGcubyBcDQo+ICAJZGlzcGxheS9pbnRlbF9j
b2xvci5vIFwNCj4gIAlkaXNwbGF5L2ludGVsX2NvbG9yb3AubyBcDQo+ICsJZGlzcGxheS9pbnRl
bF9jb2xvcl9waXBlbGluZS5vIFwNCj4gIAlkaXNwbGF5L2ludGVsX2NvbWJvX3BoeS5vIFwNCj4g
IAlkaXNwbGF5L2ludGVsX2Nvbm5lY3Rvci5vIFwNCj4gIAlkaXNwbGF5L2ludGVsX2NydGMubyBc
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9y
X3BpcGVsaW5lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9y
X3BpcGVsaW5lLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4xNDE1Zjk0ZGQzZTMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmMNCj4gQEAgLTAsMCArMSw5NyBAQA0K
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdo
dCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKyNpbmNsdWRlICJpbnRlbF9j
b2xvcm9wLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfY29sb3JfcGlwZWxpbmUuaCINCj4gKyNpbmNs
dWRlICJpbnRlbF9kZS5oIg0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4g
KyNpbmNsdWRlICJza2xfdW5pdmVyc2FsX3BsYW5lLmgiDQo+ICsNCj4gKyNkZWZpbmUgTUFYX0NP
TE9SX1BJUEVMSU5FUyAyDQo+ICsjZGVmaW5lIFBMQU5FX0RFR0FNTUFfU0laRSAxMjgNCj4gKyNk
ZWZpbmUgUExBTkVfR0FNTUFfU0laRSAzMg0KPiArDQo+ICtzdGF0aWMNCj4gK2ludCBfaW50ZWxf
Y29sb3JfcGlwZWxpbmVfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgc3RydWN0
DQo+ICtkcm1fcHJvcF9lbnVtX2xpc3QgKmxpc3QpIHsNCj4gKwlzdHJ1Y3QgaW50ZWxfY29sb3Jv
cCAqY29sb3JvcDsNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGxhbmUtPmRldjsNCj4g
KwlpbnQgcmV0Ow0KPiArCXN0cnVjdCBkcm1fY29sb3JvcCAqcHJldl9vcDsNCj4gKw0KPiArCWNv
bG9yb3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0ZShJTlRFTF9QTEFORV9DQl9QUkVfQ1NDX0xVVCk7
DQo+ICsNCj4gKwlyZXQgPSBkcm1fcGxhbmVfY29sb3JvcF9jdXJ2ZV8xZF9sdXRfaW5pdChkZXYs
ICZjb2xvcm9wLT5iYXNlLA0KPiBwbGFuZSwNCj4gKwkJCQkJCSAgUExBTkVfREVHQU1NQV9TSVpF
LA0KPiArDQo+IERSTV9DT0xPUk9QX0xVVDFEX0lOVEVSUE9MQVRJT05fTElORUFSLA0KPiArDQo+
IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCj4gKw0KPiArCWlmIChyZXQpDQo+ICsJ
CXJldHVybiByZXQ7DQo+ICsNCj4gKwlsaXN0LT50eXBlID0gY29sb3JvcC0+YmFzZS5iYXNlLmlk
Ow0KPiArCWxpc3QtPm5hbWUgPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgIkNvbG9yIFBpcGVsaW5l
ICVkIiwNCj4gK2NvbG9yb3AtPmJhc2UuYmFzZS5pZCk7DQo+ICsNCj4gKwkvKiBUT0RPOiBoYW5k
bGUgZmFpbHVyZXMgYW5kIGNsZWFuIHVwICovDQo+ICsJcHJldl9vcCA9ICZjb2xvcm9wLT5iYXNl
Ow0KPiArDQo+ICsJY29sb3JvcCA9IGludGVsX2NvbG9yb3BfY3JlYXRlKElOVEVMX1BMQU5FX0NC
X0NTQyk7DQo+ICsJcmV0ID0gZHJtX3BsYW5lX2NvbG9yb3BfY3RtXzN4NF9pbml0KGRldiwgJmNv
bG9yb3AtPmJhc2UsIHBsYW5lLA0KPiArDQo+IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNT
KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZHJtX2NvbG9yb3Bf
c2V0X25leHRfcHJvcGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiArCXByZXZfb3Ag
PSAmY29sb3JvcC0+YmFzZTsNCj4gKw0KPiArCWNvbG9yb3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0
ZShJTlRFTF9QTEFORV9DQl9QT1NUX0NTQ19MVVQpOw0KPiArCXJldCA9IGRybV9wbGFuZV9jb2xv
cm9wX2N1cnZlXzFkX2x1dF9pbml0KGRldiwgJmNvbG9yb3AtPmJhc2UsDQo+IHBsYW5lLA0KPiAr
CQkJCQkJICBQTEFORV9HQU1NQV9TSVpFLA0KPiArDQo+IERSTV9DT0xPUk9QX0xVVDFEX0lOVEVS
UE9MQVRJT05fTElORUFSLA0KPiArDQo+IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZHJtX2NvbG9yb3Bfc2V0
X25leHRfcHJvcGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiArDQo+ICsJcmV0dXJu
IDA7DQo+ICt9DQo+ICsNCj4gK2ludCBpbnRlbF9jb2xvcl9waXBlbGluZV9wbGFuZV9pbml0KHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lKSB7DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBs
YW5lLT5kZXY7DQo+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9k
aXNwbGF5KGRldik7DQo+ICsJc3RydWN0IGRybV9wcm9wZXJ0eSAqcHJvcDsNCj4gKwlzdHJ1Y3Qg
ZHJtX3Byb3BfZW51bV9saXN0IHBpcGVsaW5lc1tNQVhfQ09MT1JfUElQRUxJTkVTXTsNCj4gKwlp
bnQgbGVuID0gMDsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJLyogQ3VycmVudGx5IGV4cG9zZSBw
aXBlbGluZSBvbmx5IGZvciBIRFIgcGxhbmVzICovDQo+ICsJaWYgKCFpY2xfaXNfaGRyX3BsYW5l
KGRpc3BsYXksIHRvX2ludGVsX3BsYW5lKHBsYW5lKS0+aWQpKQ0KPiArCQlyZXR1cm4gMDsNCj4g
Kw0KPiArCS8qIEFkZCAiQnlwYXNzIiAoaS5lLiBOVUxMKSBwaXBlbGluZSAqLw0KDQpJIHRoaW5r
IHdlIGNhbiBkbyBhd2F5IHdpdGggdGggIihpLmUgTlVMTCkiIHBhcnQgc2luY2UgdGhlIGRvY3Vt
ZW50YXRpb24gYXQgZHJtIGNvcmUgZG9lcyBhIGdvb2Qgam9iIGV4cGxhaW5pbmcgd2hhdCBCWVBB
U1MgcGlwZWxpbmUgaXMNCldpdGggdGhhdCBmaXhlZCBMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFq
IEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+ICsJcGlwZWxpbmVzW2xlbl0u
dHlwZSA9IDA7DQo+ICsJcGlwZWxpbmVzW2xlbl0ubmFtZSA9ICJCeXBhc3MiOw0KPiArCWxlbisr
Ow0KPiArDQo+ICsJLyogQWRkIHBpcGVsaW5lIGNvbnNpc3Rpbmcgb2YgdHJhbnNmZXIgZnVuY3Rp
b25zICovDQo+ICsJcmV0ID0gX2ludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2luaXQocGxhbmUs
ICZwaXBlbGluZXNbbGVuXSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwls
ZW4rKzsNCj4gKw0KPiArCS8qIENyZWF0ZSBDT0xPUl9QSVBFTElORSBwcm9wZXJ0eSBhbmQgYXR0
YWNoICovDQo+ICsJcHJvcCA9IGRybV9wcm9wZXJ0eV9jcmVhdGVfZW51bShkZXYsIERSTV9NT0RF
X1BST1BfQVRPTUlDLA0KPiArCQkJCQkiQ09MT1JfUElQRUxJTkUiLA0KPiArCQkJCQlwaXBlbGlu
ZXMsIGxlbik7DQo+ICsJaWYgKCFwcm9wKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiAr
CXBsYW5lLT5jb2xvcl9waXBlbGluZV9wcm9wZXJ0eSA9IHByb3A7DQo+ICsNCj4gKwlkcm1fb2Jq
ZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIHByb3AsIDApOw0KPiArDQo+ICsJcmV0
dXJuIDA7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yX3BpcGVsaW5lLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NvbG9yX3BpcGVsaW5lLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi43ZjFkMzJiYzkyMDINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmgNCj4gQEAgLTAs
MCArMSwxMyBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyoN
Cj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0K
PiArI2lmbmRlZiBfX0lOVEVMX0NPTE9SX1BJUEVMSU5FX0hfXw0KPiArI2RlZmluZSBfX0lOVEVM
X0NPTE9SX1BJUEVMSU5FX0hfXw0KPiArDQo+ICtzdHJ1Y3QgZHJtX3BsYW5lOw0KPiArDQo+ICtp
bnQgaW50ZWxfY29sb3JfcGlwZWxpbmVfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSk7DQo+ICsNCj4gKyNlbmRpZiAvKiBfX0lOVEVMX0NPTE9SX1BJUEVMSU5FX0hfXyAqLw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJt
L3hlL01ha2VmaWxlIGluZGV4DQo+IDM0MjA3MjVjNGJhOC4uODlmOTIyZDc0NWJhIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL01ha2VmaWxlDQo+IEBAIC0yMzUsNiArMjM1LDcgQEAgeGUtJChDT05GSUdfRFJNX1hF
X0RJU1BMQVkpICs9IFwNCj4gIAlpOTE1LWRpc3BsYXkvaW50ZWxfY210Zy5vIFwNCj4gIAlpOTE1
LWRpc3BsYXkvaW50ZWxfY29sb3IubyBcDQo+ICAJaTkxNS1kaXNwbGF5L2ludGVsX2NvbG9yb3Au
byBcDQo+ICsJaTkxNS1kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLm8gXA0KPiAgCWk5MTUt
ZGlzcGxheS9pbnRlbF9jb21ib19waHkubyBcDQo+ICAJaTkxNS1kaXNwbGF5L2ludGVsX2Nvbm5l
Y3Rvci5vIFwNCj4gIAlpOTE1LWRpc3BsYXkvaW50ZWxfY3J0Yy5vIFwNCj4gLS0NCj4gMi41MC4x
DQoNCg==
