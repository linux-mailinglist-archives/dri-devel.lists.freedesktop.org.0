Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966578BA7CE
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CBF11286D;
	Fri,  3 May 2024 07:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h47v7EaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9D112873;
 Fri,  3 May 2024 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714721500; x=1746257500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=N00u09PmVdeRViIy1T2D/lNOXKY2USpzq2tfUGSBi7U=;
 b=h47v7EaPs+pDTfkEo3isjKsv3xy7/AGhm+e3egIuCPIbZ++UaUGwc8Na
 3xeydg6U1BaR7vpHN+nyLsAvRck7+A16dBgjV58W3fXAy46RwfRdOL1o7
 puipd7TuPjMp1kwfnJhJ2TnE3gSC+L7DW0Yqb4hA2yvJtnaSzAtptv2MA
 zh0n2pmaryGT33Zj4RP64PVNcLSbRnmCP6TbobEQhLhqnmPSJcCWfqyyv
 Uf0woN9fWWY1FSJG+coM06oFPU24tP7eg9kc+YpcPsLm1YemMFqUQ2R1m
 XQr+qlF9gQhliChQch8a2PikZgSHvClqS/nSMn65CwbwWqviDKoc4F6yx A==;
X-CSE-ConnectionGUID: jbmE4TgyTwCdG1qF1sTxjw==
X-CSE-MsgGUID: F4GIFf/TSsS9UatkipyHIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21211645"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21211645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 00:31:37 -0700
X-CSE-ConnectionGUID: +dM9SF6RShSU12uuBqcoeA==
X-CSE-MsgGUID: f5UXrraMR6OnbotzO+2FxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58280176"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 00:31:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 00:31:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 00:31:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 00:31:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 00:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naTX3PZPsqPF6mQsqaRNzqJxHbdPifoDFpdzasK1P9afeyLMtzJVwx9FF0PUDngVfMh15CgW2rgzAwRvC70eWfipNB6uCgjRyU8xtvo1wu3ItZK4auaWXYRdEWJpXPYeeEDFwHrAwCe50j35HIVRvouRcMde3Tl+M0jUK1vHsSYVQQCZoB/uHNqYi/azUqaM/sRTcSnl3Q3fiQHb4rJ9u0Gp0dui7feIsZZO8vAn9i0WJlN+34y84KRN18XXqvlxrwkdPmQfRk0soM4Bxygb1PdcUcAJSS5nvsc6jdGB5hN5uHtKazSKb1UqsY5MgUHPMBFDdbEp3yk8otIatBkYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N00u09PmVdeRViIy1T2D/lNOXKY2USpzq2tfUGSBi7U=;
 b=If0lSDueoXoipPX06zb8RuwxRuh8fDQGwFiazQhxS84AIw2HN6BEBxpyhA2rCYNoi+ovDYslwB+SChdUEAuyejROWfpU+JODyOPlwKB+pa8ml7EokpH6LLYoXSu49FPfWMrPPKT7AlijzZ3qBuworQLhQSrJVkOnCkCs3coHZ40sRG+U0Rn/fZSb9+I9JsorLVTXT8uGtr/vieRKtonWOcgE9beZJRJS43tP14MUj3zE5CUQFVQCwsqIiVyPgrZwh6r9cLJUGc2zz8aIyPr+45zfcx3+ESoNYkP79nX9f3V8SHFlG0CkIteidDymsUr2lWvHo5VjAISs1SOvVHw3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.30; Fri, 3 May 2024 07:31:31 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 07:31:31 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHalnjW5wqLgyDVSUmrRldnLozWBrGFKuIA
Date: Fri, 3 May 2024 07:31:31 +0000
Message-ID: <b669fd758ce9087949d877505307dc0a8a0b8c9e.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-7-animesh.manna@intel.com>
In-Reply-To: <20240424183820.3591593-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6539:EE_
x-ms-office365-filtering-correlation-id: 799f969c-d1d8-4c0c-7b33-08dc6b430dca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?eTJFNkRqekl1T2FLQ3BtekFId201WHp0QUhEWUtSWGRkSEN4NStOQjNMM25T?=
 =?utf-8?B?RWVWNVpyWmZyQ2JRbVRadE03V0pjMnVRZzVoMFQ3STJiWDVrRnpkU25CRlVT?=
 =?utf-8?B?WGRIdnhZdHZGVnJzMGp2YmRSRzJHWHBobWgrZm4xQmdSMm1yNE9hMEFwOFl6?=
 =?utf-8?B?Rml0V0tneWJpSzV4dHovaGJqcHNFRUFFTTdET2VxYlJhMkdIaGRqRHBxcjdI?=
 =?utf-8?B?RGlZblM0WUI0WnE1TnlFY012ZlMxN2pDTlVRdUJyTXJvNEJNZzN1Zi9paVN2?=
 =?utf-8?B?clNtY1BHVjBUWUJ5VzFmZDRBNW9USENKZDRLL2JIK1FHUlFmb3lRUC84MVAw?=
 =?utf-8?B?WmJPU0JHaUY4WEh0NTBJU1Rrb2FsTDdxSFNPamtUcElyVXA4WUxSY0lmZWNR?=
 =?utf-8?B?aXAyWnpsTGtBTGliaXhtME4wck5HUWNzTlA2MnBJejJ1MVdYWHJxL3VzNUxT?=
 =?utf-8?B?ME9teWM2SzBQQkMxUit6WFBYOXRrWmFRYmdmREFzVnloc0JpTHFJRnhPeE1I?=
 =?utf-8?B?byswU1UwczI5alBYU085UzVOUStkYTNKM0J6WUEvZTlqbFVtTXhNSWJaRnU4?=
 =?utf-8?B?V1A2VndjVFdoOGxXeCs5cVJPOXo2Y2V0V3RsRkNFbFBBWGs2VUNXRXdscC9u?=
 =?utf-8?B?N28xVkpWSkw1MXZEdWZFeFc1c2ZtOWpJL1JlSXJkWTRqQys1dW1ibWxmOWJE?=
 =?utf-8?B?RUpkWHlzb05OTnpCbTI2TERmMlpybzRaVk9Vblhud2hLUTVUTVdOa20yVzBE?=
 =?utf-8?B?MEJZeHJmb29vTDVnN0NWMzJuSkk1cklPWlpiaDhvZUtoaGVCZXBxUWRBWFBQ?=
 =?utf-8?B?RjZCallJMnJreXBub0NsWURqRExkdmhmUkZaYmtaR0NiODVUbzk0NTJHZzdJ?=
 =?utf-8?B?RWFSdEhTNGROa1NEckRtdVhHVzZDWU1FSlc4RGJZcGNhQ0RndnVsZWZaSGhM?=
 =?utf-8?B?Qy93eXg5T0djR2UvN3NLUkxDSk0xNEtiUUd1Y3ZXL09Kd3dSR2t0M3NkYjhp?=
 =?utf-8?B?ayt0QkRvZ09oQVNpcEZrbFBmKzRxMU9WTDE0bjlCZVRtbG95bElZZXkzSXhq?=
 =?utf-8?B?bXNORE12VkVIU1Q2SlErNWhxaXA1UG4zL0lVSUtKdlg4SmFJanNVSTFxeFFC?=
 =?utf-8?B?TTVZa256TndDbWN0OGRBTTc0MGsxaVJzeVJGejBaRXIyM1pDQ0FIZTlJbnd1?=
 =?utf-8?B?M2gxMFJ3U0hUamxaZk5jczJtdlRLTVgweGJhL2s3ck9oazNDeXRqcEQyNEFD?=
 =?utf-8?B?d0lCYkNpeDdBMlVxbEEyREFzYXBLUzRJUytlT1pzRnVOU1dBemNKdk1ibHpz?=
 =?utf-8?B?M1NqL3hEZjJXclpKNE9PbWJDMHVHV05keFNpL1NWRUtyT0RBZGVoeXY3Ujcy?=
 =?utf-8?B?SGc3UHBxai9NdWxBVnpjMThYNkgwMVRmaHAwWW1wWGdZTEhjVFRQOURTb1Nr?=
 =?utf-8?B?U2JwbkUvak1scVlTRUUrWE9DckZlOWFDbkdMZURvell5UWR4d2V3cXJCdDBT?=
 =?utf-8?B?TURiM2ZNS2ZOTkVwNy92YXBiaW9udndkRDBpK2ZFWlRFTTdIbHRKR0ZPazEr?=
 =?utf-8?B?S096MjVDZlRYeWM1dWdtb29IWmxKaEZaYjl0bkZ5YjlNMWlldUhENWp1OXRW?=
 =?utf-8?B?eUtUVmhtOWE4a01HUzdTelBoZWVHVmcrODJSWHF6UjMzNjN6YW5GWk1kUzNQ?=
 =?utf-8?B?WFVZUEhCTnJXeUhtdC9yNGp0TWlIa0xucnh2SktDbGNka2VyL29tcTZHazFO?=
 =?utf-8?B?ZGVPYURaU1JuSUIxWkdWT2JDTGFleXpXb3JsWVF4Ly90emFtTzFSNUYvZGpH?=
 =?utf-8?B?WjdZelRnek1vcDNlbEo0Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3lOZllXSlJBSXVQY2pXTTZvZXQranRyaE05RHlWTEZyelJub1dHWGZmbDc3?=
 =?utf-8?B?ZTFYZ2xaSWdSM1dFOWVtSzY4ZDZDMVB1QWZsM2pPRHJqaWJ2c0cvQ2gzOWJH?=
 =?utf-8?B?M0ovTTRMdFRZUHRRUDNjQStzeVpxUUVNNDd4Ly9ETDRXdkNVaUtsYW5jd3dZ?=
 =?utf-8?B?cmZjUmQyc1Yya3p0K3hxUTFNZ25yQlozOFRNRkNJQmRsSmFOME5vTEN5UFlS?=
 =?utf-8?B?ak9MeUp1ckh0aWVudGliU1hEMlBXcGJMQ0hZeTZ6WDFlUXFqUkRIam9OS1Jy?=
 =?utf-8?B?dFpGdWNOUU9rVGl2bkNRNHpFVmppNnFrakNyZWdnU29wamliTGdaSHhtK0g0?=
 =?utf-8?B?eTBrYW94cUlRV3U1b3JOcm11VkV5ZjRPTU9TYlRNUlJFRUMxSTEzTWpvK0Nr?=
 =?utf-8?B?REhidmNVSFZYVkRMN3FaMGQrSWNHckN6Q1BwMFNlUUlqUVl5NWs3MTBSemxo?=
 =?utf-8?B?S3BWQndjU3kraXRoVFpGUUpoT1ZBTDlZMy9EUHFiN1hOczhuOFFOTnp2cTU0?=
 =?utf-8?B?R2V0YVprdFJ1RUxqRW1LL2hOOUxqWlN5dFVkSG04TDBUc3oxdnVUMnlBdUZj?=
 =?utf-8?B?WlJESk9nTHdNU29nT2Z4V1VvUkdMYmNkeW4zQy9tNHpkNEc3Rkx4TTBRMjdi?=
 =?utf-8?B?NjhtUmZaTTNaSXdJQllPRFNrWUtaZ3ZXSjNubk9iZkkrMWo3djBrUktiMGFO?=
 =?utf-8?B?aTlkNnFPcHJFYVZhdTJZMUpENitMeUlGZ3pBU01MMHFKUTM5SXRSOXJ5cnAx?=
 =?utf-8?B?Y0RzQmFhUGp1KzF4THpJeisrdWEvM0IvVGlTRFlOQ3ozcmlPZ2wyamJXckh0?=
 =?utf-8?B?dDFmclFLOWRNcW4rTXhRYmlKN2RpZDVmWnFJUWpIREYwREd3aGlRK1lheHRT?=
 =?utf-8?B?OTJBcUNjU204aXpXN0gwK2pVSWFhbGJDaGZUdXlUcUsxZnZreE5IUVJBZ1Ni?=
 =?utf-8?B?amlkYU9mZ1N3cEpMblhTTXlFWmxhUHVnSGxMYjdmSmRKdHRKQ0tPdFkzd21s?=
 =?utf-8?B?K0lZTFdXWHlaRHVabEhML0l3L1h6QzU4M2xSWWRrMGF6QXk0ZndJLytZUnQy?=
 =?utf-8?B?MjNpeW1SVk0wc01nMmVESHRySmJrWnR2UDV0SnlHZU5nYXVzRnZ0cDVrb2dK?=
 =?utf-8?B?LzhOVlVKMFhGNFAyRmtHYUxzd3M4WFpTdWRVRG5tc1Y5RnNDZ3h6K3BKbE90?=
 =?utf-8?B?SHBPSjZDR2ZGckVXRWVQcFJCRVk0c0d5aVA5ZmlOdTVhbVU4UTJGeW9vTmFD?=
 =?utf-8?B?SWsxaUczMTRONzhrRkFwNmVYNDQ2RFByYUFreXI4WGxVRzNRQkxMUkpPaVdM?=
 =?utf-8?B?ZFhHVXhwOXByUTBFQ200bXU3TDZBaUFYZnM4VjRDMHlOUy9yUXJSZ08rNU5z?=
 =?utf-8?B?TjlBRkIzQmJ4K0gvcW9mSHlHQ0dMWnhmQ0ZaNFRrMjN6UDRyUGxrL0tHcHY2?=
 =?utf-8?B?enY2K0ZhcHFjZzhGS290R2Rqd2t6L2FpK2RUZXdqKzh4Yk9rMldXSm9pU01U?=
 =?utf-8?B?RXBqUUJjbURyWmxPY3pnUS8zOEl4SWFIN1FjRWl0elUxdVJaaldkOUJrSjl6?=
 =?utf-8?B?QmExUnp6THJFRmZIbGpPeUl4L3F6YUpwTnY3Y2s3YUpTbjJQYzR2VFlIVVhi?=
 =?utf-8?B?cWxiUjlNNHAwSngzaHVQLzhtcEoxSVByTkVLd2tCUHRQcmJ6bnhndlBZRGMr?=
 =?utf-8?B?SXBKNDFqUm11WEM5MVFXTWVXWHdRQXYzTTY3dmlvVk9VNGJhc1UrLzc2SjJT?=
 =?utf-8?B?WklXZzlGeXZ6K2NvcVpXV29KOVd1azIyU2xuSkdIbU5SNEtuNWI4YTlVTVRK?=
 =?utf-8?B?c3p6MDlvS3hTYzJIUGVSanpaSG9OSS9sVEZwMHZqdWlvUWVjakN5ZlVUOXNG?=
 =?utf-8?B?WlZpMW5YVkdDczhoSzlLMHYxeVJXNkU5QkFPYmZLeFhqMXZHeUFQYVlJbWZY?=
 =?utf-8?B?TTdJL3VZdktMYUFxOSt2dzB0Q2N2M09OWkJoa2E2aklaa0VYT1BBSkN4MnFk?=
 =?utf-8?B?disrcWxUcVZUSEdLYXJ6RGg3OWdtOWdwVUQ2bm92UmhSditLd2hQZURTbS9P?=
 =?utf-8?B?S0FuZU5ISkF2WUY1NVllMWFsRGRtSWVNUjJxSjJHeVUzK2VadzFlZFlnK1Qv?=
 =?utf-8?B?ZEpzcmsvcnJaNUNFK005NGFMMjlZT1J1dDVxWnFwVHVuQ3M3dmhneHpaMHpV?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92C3B9CD56BFAF4B8A38A6EEEF26C4F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799f969c-d1d8-4c0c-7b33-08dc6b430dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 07:31:31.7882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87mtlJAoci3l5a461jJ0vB0qTdDN27CGg6SiZEIZBrGG0ZEpJxfOkN3xDYRzbtC0cW8PuSbAoEq+lMzb0LaZV61On6GRpoXhu0/aUORqVJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDAwOjA4ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBGb3IgdmFsaWRhdGlvbiBwdXJwb3NlIGFkZCBkZWJ1Z2ZzIGZvciBMT0JGLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAg
fCA0OA0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmjCoMKgwqDCoCB8wqAgMiArDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmPCoCB8wqAgMiArDQo+IMKgMyBmaWxlcyBjaGFuZ2Vk
LCA1MiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiBpbmRleCBiMDg3OTk1ODZiNTguLjJkMzAyN2MyZmIwYSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTM0Mywz
ICszNDMsNTEgQEAgdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHANCj4g
KmludGVsX2RwLA0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGxubF9hbHBtX2NvbmZpZ3VyZShp
bnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+IMKgfQ0KPiArDQo+ICtzdGF0aWMgaW50IGk5MTVfZWRw
X2xvYmZfaW5mb19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gK3sNCj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gbS0+cHJp
dmF0ZTsNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2
ID0gdG9faTkxNShjb25uZWN0b3ItDQo+ID5iYXNlLmRldik7DQo+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCBkcm1fY3J0YyAqY3J0YzsNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2NydGNf
c3RhdGUgKmNydGNfc3RhdGU7DQo+ICvCoMKgwqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBjcHVf
dHJhbnNjb2RlcjsNCj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBsb2JmX2VuYWJsZWQ7DQo+ICvCoMKg
wqDCoMKgwqDCoGludCByZXQ7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX21vZGVz
ZXRfbG9ja19zaW5nbGVfaW50ZXJydXB0aWJsZSgmZGV2X3ByaXYtDQo+ID5kcm0ubW9kZV9jb25m
aWcuY29ubmVjdGlvbl9tdXRleCk7DQo+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiArDQo+ICvCoMKgwqDCoMKg
wqDCoGNydGMgPSBjb25uZWN0b3ItPmJhc2Uuc3RhdGUtPmNydGM7DQo+ICvCoMKgwqDCoMKgwqDC
oGlmIChjb25uZWN0b3ItPmJhc2Uuc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
IHx8DQo+ICFjcnRjKSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAt
RU5PREVWOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7DQo+ICvC
oMKgwqDCoMKgwqDCoH0NCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBjcnRjX3N0YXRlID0gdG9faW50
ZWxfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7DQo+ICvCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYo
bSwgIkxPQkYgQ3JpdGVyaWEgbWV0OiAlc1xuIiwNCj4gc3RyX3llc19ubyhjcnRjX3N0YXRlLT5o
YXNfbG9iZikpOw0KDQpJJ20gc3RpbGwgbm90IGNvbnZpbmNlZCBvbiB0aGlzLiBoYXNfbG9iZiB+
PSBBTFBNX0NUTF9MT0JGX0VOQUJMRSBpbg0KQUxQTV9DVEwuIFRvIG15IG9waW5pb24gaXQgaXMg
ZW5vdWdoIHRvIGR1bXAgc2VxX3ByaW50ZihtLCAiTE9CRg0Kc3RhdHVzOiAlc1xuIiwgc3RyX2Vu
YWJsZWRfZGlzYWJsZWQobG9iZl9lbmFibGVkKSkgYmVsb3cuIE1heWJlDQpBVVhfV0FLRSBhbmQg
QVVYX0xFU1NfV0FLRSBjb3VsZCBiZSBkdW1wZWQgaW5zdGVhZD8NCg0KQlIsDQoNCkpvdW5pIEjD
tmdhbmRlcg0KDQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgY3B1X3RyYW5zY29kZXIgPSBjcnRjX3N0
YXRlLT5jcHVfdHJhbnNjb2RlcjsNCj4gK8KgwqDCoMKgwqDCoMKgbG9iZl9lbmFibGVkID0gaW50
ZWxfZGVfcmVhZChkZXZfcHJpdiwNCj4gQUxQTV9DVEwoY3B1X3RyYW5zY29kZXIpKSAmIEFMUE1f
Q1RMX0xPQkZfRU5BQkxFOw0KPiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICJMT0JGIHN0
YXR1czogJXNcbiIsDQo+IHN0cl9lbmFibGVkX2Rpc2FibGVkKGxvYmZfZW5hYmxlZCkpOw0KPiAr
DQo+ICtvdXQ6DQo+ICvCoMKgwqDCoMKgwqDCoGRybV9tb2Rlc2V0X3VubG9jaygmZGV2X3ByaXYt
DQo+ID5kcm0ubW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArREVGSU5FX1NIT1dfQVRUUklCVVRFKGk5
MTVfZWRwX2xvYmZfaW5mbyk7DQo+ICsNCj4gK3ZvaWQgaW50ZWxfYWxwbV9sb2JmX2RlYnVnZnNf
YWRkKHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sNCj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGNvbm5lY3Rvci0+
YmFzZS5kZXYpOw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGVudHJ5ICpyb290ID0gY29ubmVj
dG9yLT5iYXNlLmRlYnVnZnNfZW50cnk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKERJU1BM
QVlfVkVSKGk5MTUpIDwgMjAgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3Rvci0+
YmFzZS5jb25uZWN0b3JfdHlwZSAhPSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGRl
YnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZWRwX2xvYmZfaW5mbyIsIDA0NDQsIHJvb3QsDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5l
Y3RvciwgJmk5MTVfZWRwX2xvYmZfaW5mb19mb3BzKTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gaW5kZXggYTljYTE5MGRhM2U0Li4wMWZk
MDhlYjk2ZjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYWxwbS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5oDQo+IEBAIC0xMSw2ICsxMSw3IEBADQo+IMKgc3RydWN0IGludGVsX2RwOw0KPiDCoHN0cnVj
dCBpbnRlbF9jcnRjX3N0YXRlOw0KPiDCoHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlOw0KPiAr
c3RydWN0IGludGVsX2Nvbm5lY3RvcjsNCj4gwqANCj4gwqBib29sIGludGVsX2FscG1fZ2V0X2F1
eF9sZXNzX3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKTsNCj4gwqBib29sIGludGVs
X2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gQEAgLTIw
LDQgKzIxLDUgQEAgdm9pZCBpbnRlbF9hbHBtX2NvbXB1dGVfbG9iZl9jb25maWcoc3RydWN0IGlu
dGVsX2RwDQo+ICppbnRlbF9kcCwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9zdGF0ZQ0KPiAqY29ubl9zdGF0ZSk7DQo+IMKgdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3VyZShz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0
Y19zdGF0ZSk7DQo+ICt2b2lkIGludGVsX2FscG1fbG9iZl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiDCoCNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gaW5k
ZXggMzVmOWY4NmVmNzBmLi44NmQ5OTAwYzQwYWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiBAQCAtMTMs
NiArMTMsNyBAQA0KPiDCoCNpbmNsdWRlICJpOTE1X2RlYnVnZnMuaCINCj4gwqAjaW5jbHVkZSAi
aTkxNV9pcnEuaCINCj4gwqAjaW5jbHVkZSAiaTkxNV9yZWcuaCINCj4gKyNpbmNsdWRlICJpbnRl
bF9hbHBtLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2NydGMuaCINCj4gwqAjaW5jbHVkZSAiaW50
ZWxfZGUuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfY3J0Y19zdGF0ZV9kdW1wLmgiDQo+IEBAIC0x
NTE1LDYgKzE1MTYsNyBAQCB2b2lkIGludGVsX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QN
Cj4gaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpDQo+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9k
cnJzX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiDCoMKgwqDCoMKgwqDCoMKg
aW50ZWxfcHBzX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiDCoMKgwqDCoMKg
wqDCoMKgaW50ZWxfcHNyX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiArwqDC
oMKgwqDCoMKgwqBpbnRlbF9hbHBtX2xvYmZfZGVidWdmc19hZGQoY29ubmVjdG9yKTsNCj4gwqAN
Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNU
T1JfRGlzcGxheVBvcnQgfHwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uZWN0b3JfdHlw
ZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEgfHwNCg0K
