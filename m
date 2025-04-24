Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57EA9A016
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 06:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6591B10E721;
	Thu, 24 Apr 2025 04:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8HhOZV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92010E2D8;
 Thu, 24 Apr 2025 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745468891; x=1777004891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pR/Q4xk6VAXOlfP6ZMwFFiEV7mqs6h3R9YhU/d0M1gk=;
 b=D8HhOZV3IeHQGBFAJvS5kWup9kU+Sb0rzgs8Dz3mbPyZJbZyvMwf42Yv
 U4tSf6O7siaiqkuGMs7oJkoDGdTRpD85AcPrmI7CLSah92aPcvZHD23Xg
 5dMdj26x2o1x6tiknjKCHnQjyAop9sWXnIK2PW0w3dLDNm5jEqZGzG+WF
 02epDz16LcX40/jQqagYOO92TaPNAoF4tXdjcVAiOvbbEfZ8Gyp3XyaWg
 GUAT6Xu94OWcGprIzHm2MZgy55abakgv98jpCoMdunE36zFUA/i6oUxdV
 R610IDu6bWs3ugdtPoSCwinTwuv0HmaH3wEdr90Oq785HjJNZmHaG0kCz Q==;
X-CSE-ConnectionGUID: 3lKZza87R6yWsdtQmzQhWQ==
X-CSE-MsgGUID: TzZoo3GDRe2wUCV8gIUtfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58457159"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="58457159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:28:11 -0700
X-CSE-ConnectionGUID: PgvzpdSMSPGdLxQcjGtfEA==
X-CSE-MsgGUID: 9ApkcUw1Q2yFPcef0Qpgfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132479741"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 21:28:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 21:28:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 21:28:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 21:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4sqLti3V1yijpAeYCIdF/TUFfxXBnb5M/+oD5Wj2A0xUGtdHbicAQOcL/sXwBOPxsT2YQIKqZxRzR+l7KEaJAVboKEljD7kutY6udYwxQ/Jgkwbp9lss5UQioyiITomc7dn/u42r4BOvfqIHAMBM5qW9jrZoLz/f/fsNN9I7SRZNvfuJ47uZNFGjiJhNAjt7z3Pq7smTsmUruAGSDvRDZDylcL51J4jVRK6Ih+OTo4MFt3qiMCHUyrVUGYOsMhTdzeaR8Qm7Bh6XTanw9azDG5lndzQlnPPMF8BhOqhKx3EDuYx6TskuzI+aIFNrnXJGyKGEWUcrwlH8DQicXpTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR/Q4xk6VAXOlfP6ZMwFFiEV7mqs6h3R9YhU/d0M1gk=;
 b=v5O+28VZwnwq274GyLzZ/kDZ5ftWWe0B8qG4AJmNahhwZ9BjVjPwXHer7L8tux7QqeWaQBlCPUf2ZkJqGV2S5YNeEYAf7xBfDZr4+SZBOze0BXbTSXWvb4yMw+9CclBGRRR6kYWgvA7f1I2Mhgzoi5LSzM7WEBbgG4PXCRFNSXi5LDDIDk2RAY9zfSo67QYva6hEd4PkSBNzwyg8zUnhBQ+80+j7d/eI+ll1O6/HW22NRLQiSdW5AKEDF3jp8Q+b6x6kPb3dip6wJqlB2L8kSQtcIihJcd3orw76f7fRG4/UUZI6ZPXhY6uNNqsPaCIdbqawmu6sF7NXukyWcdDa7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 04:28:08 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 04:28:08 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v21 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v21 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbtIz6UmF3j+jmv0GkSxIWe/uh7rOyC3pQgAAI1YCAACP/gA==
Date: Thu, 24 Apr 2025 04:28:07 +0000
Message-ID: <DM4PR11MB54568B23CB14A798E3E12FF7EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-4-jonathan.cavitt@intel.com>
 <DM4PR11MB5456D03B7FB2738D23D73103EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aAmerz9SDyUOs6Po@lstrano-desk.jf.intel.com>
In-Reply-To: <aAmerz9SDyUOs6Po@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB7270:EE_
x-ms-office365-filtering-correlation-id: 561f6301-c0b6-4399-b892-08dd82e86a1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZDQvMDBZSnZOdzBuV3FPMm5vNGtoTUJ2QTRQN3h4ZjVhYUhiK0o3dms3T2Fm?=
 =?utf-8?B?QkxBYTdSa0NlYi9KNHNjL09TL1haT2FaRFRucVJKZkFISjhiTVRaaVpKdFcw?=
 =?utf-8?B?U01zYjJuU09sajd4eGo5QkptT1k0azVaemFjWjdYQTc3Y3V1OXlNNTM2Y2Rr?=
 =?utf-8?B?M2hvbjJ1VmNZVGVkdkw1WENnWWw2WHlLMkJ5d1lMZUo5L3Z6UzVPdGUwQ1Q0?=
 =?utf-8?B?SkUxM29hc3VwVHBkY3EwalRlZ0VKZlFEZUlxbEc2WkRVT0dZdTlYaW8vZXFm?=
 =?utf-8?B?K3hBenhrVCtvYVU1SG1JQTVMVGJGajdjVXlHVkJBeU5FKzN3RmYwNmZ2ZDJO?=
 =?utf-8?B?dkpZUjRKbUlBaXZIdnowa1dvMmZPcGZJWEtDVmxhMGh4bFEyTlZ2UnV0THJR?=
 =?utf-8?B?dDVubWZlbnpBR0JHa3pvQlZyVXc4Ni96Q1I1Yk05blVaV3gxRk12R1Q4emZ6?=
 =?utf-8?B?Tk9TSk9yQkpaTG5JUG1qTmJtQzJaSGRZZTNSMVh2d3QwQ0NJSmFzNzV1akZr?=
 =?utf-8?B?elk2V1JqTkRGUHA3eGNZVjZheEM1b09iVjFiNmltTTVTc2hQRmo1MllWRDZp?=
 =?utf-8?B?Y0hDcG9FVEtMMTV2dUZ5Sml2Y3dpa2FwY1BFcnVLVUVBaFhGSFpDZ2dGR2di?=
 =?utf-8?B?Vko3a3hKTjhWNWw0MDl2c0paVk5TaU5IQi84R1RDUngwVTNJT0lhQjRWYWdo?=
 =?utf-8?B?TTd4V3MrdFFLRjdBS0RlMXBYZEkwV0ZqbW1oazZacS9Hc2UwNGlNWG9nTllC?=
 =?utf-8?B?UUtpTGJubFVyWmdKbE1Nb1VLQllGdzhDWVhqTFI4NiszOXBNYnNEUm1rdVdM?=
 =?utf-8?B?ZWM1ZTRBRDF1R1JGQXo2c1VVeDk5bzNENFB5VExpWTNKeUFCTksvdTV3WjlF?=
 =?utf-8?B?RE1kNWg2YnRVVEtJWG1XMCs2S3BsWWVRVDUvM3EycWVQUDA5cjRlN3RKZDFH?=
 =?utf-8?B?aFR3SSthT2xiN0swQUw3b0FPc2lLUUsxYy83bCs4MTh6cWEvUFkzVU1YYkU1?=
 =?utf-8?B?R2xZS2FVWWNpYXJFWkZUS1pGQU9JRU1pMElOMTN5OVJzS2xTN2N5Tzlhazkx?=
 =?utf-8?B?Z3JCVFV0MWl6WTdnL0hXOVl1bXdlNjBEbzlzaDJtZ0lWOXBGZ0ljTzV3bTJk?=
 =?utf-8?B?SzVVK1ZBcEFRRjk5SXhxejNZMFNxZnpxb1FsUjRDRWJ0Qm5XelU3ZzhsQ3B1?=
 =?utf-8?B?dzloYkpEVnhSSDAwbGQ1RmRkeGtrdGR4bFRvYnFhcWpRa2QvUjQvb05XMmIv?=
 =?utf-8?B?MWxwd3lLanNac0g0NWkwckdwVnlGNUViNmJlemo2LzVyWU8xT3JYcmJxaTFq?=
 =?utf-8?B?Vk9ubXpxdDk0VS94MlZFWkVQTmc3bHBIb0IwRFBJR1crOHJiNkl4NWVhZHFy?=
 =?utf-8?B?ckdMVGVIaXRETjhqYnpxbUMzRnp5OUFJdnU0NVhyVmFublRXbTBxNDdyTnBP?=
 =?utf-8?B?bUJVaitaUWxZRUxuU242SHA3Um1DOU5hWUpGMUNiSHRUK2JZc2t2UVFUeWU4?=
 =?utf-8?B?UWNrdFJJYm9nMTFtZEYrdjBRL2sraGViZmVEVktXd3JYZTJZaFhIRGVKZHdJ?=
 =?utf-8?B?MWJoVm1Jb2d3SzNmdjhrdm9rMlEva29WS0o3TUlObUVYcWtGMzZQWmZPSlF5?=
 =?utf-8?B?b09veldaYUw0anIrR1JaRDg5QnN3RHFIZEo1K3RRZE5kUjVLQndKRTE2YkhF?=
 =?utf-8?B?Y2U0bjgySlNVdjgreE94dXRnOTBDL2h1ckZHU09DRkFLT2RkVFNQekJjVDZP?=
 =?utf-8?B?bFMyN3ZpeU1MM004Sk5SSTlZa1hTS2EwMkY3OFVYbm81YjA5Tk0wWjdMaDVV?=
 =?utf-8?B?Uy9iUHlsYVlpd0VRMXp2SWJyNDFlNERpUkkvMVQ4TnhpZHFWL0plbkJUUnRi?=
 =?utf-8?B?RFg5ais1azcvbGNaUUxiQ0JSMmFCSUVSQzRZTTdzWUF6Qm9SUGhsWDJscEZY?=
 =?utf-8?B?UW1sOU1yb2E0ZHFDazhKdGc1eUd1ejM2MWVnQ2ovV2V1OFlBNHltbWkxa3Rl?=
 =?utf-8?Q?+6Pr8fe8s0MZOkycf/0TJyS/lTrZNc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TytaMmh5QjgrOGFSNUNTd3BLZXlzcjBWT01zN3EraFYyK0dxVEtnOHEyK25h?=
 =?utf-8?B?by9jTWpkdFZQRmhmOC9VK0x6UXQ4RXZuQU1jd21WdWtIWEZORjZCUDhUc1Uv?=
 =?utf-8?B?TDgzdi9EMXIyMGllekIvaWJ2b2x6djloTjVDdFhHQ3dyZnVwUTdrb0h1TFBz?=
 =?utf-8?B?UUlHMmFMcnYyZEVSdFpJQTlSUTN3MlhpMW1rNzBSdUR1NmpSM1d5QWJpdENm?=
 =?utf-8?B?a1pGUDlyaUxuajlQeTdXS0U0L1RCZXA4cWhvVy80VFlqcFA0b0VvOWNOTDVY?=
 =?utf-8?B?WnZaY21vTWN2WEd0Qkp1dUNINHMvNHB4NGhxRmhoV3FDVGUwTG10ZTZmd1FF?=
 =?utf-8?B?alNVcmJDZk96VUszN1ZRQ0dyT1I3cGNVM1U5amp4UGdGLy9aeU1PRWJoSXdH?=
 =?utf-8?B?Umllak1SV3dhWVBmUWhzUnZTNVhiVk5KZkp3YnMxVUs4ck9oeVdsOS9zRGJy?=
 =?utf-8?B?TE4wMnZiNGJ2bUQ5RDlLSFYyb3B3T3BjR3JMNVBwWEZreGhJd01SYnFKVitD?=
 =?utf-8?B?aHdpUC92QjArU25ScHZxVVpLdEI0em10K3JGWXI1YU56WFowc0ZOcHM0L3li?=
 =?utf-8?B?endZYU5TaU5SbTZsSldvNUpKVzZuRXNVQXZxUnFSOUtoc1lLT2p5MXo0TWNu?=
 =?utf-8?B?SitYRnJrK2hyTzMzSGFSZXdkSmNySXZPVlRlYzVncXU4QmQra084b2xVRE5r?=
 =?utf-8?B?ZXZERVpueXJoVmpkWU51TWFuS0xjaWIyMGtvQlZ4OEtCTStiUnp4MVdLNm9s?=
 =?utf-8?B?V3QrNWF1M2dkV04rWjBLL2RVT051QXc2RnhPUTMrRzV6RlR3TDcvNHJQL0J5?=
 =?utf-8?B?NVB5cjFMVU9TU1phYlVOeHE5aHpBYzZhNk53MGliNEQxTXFkQUdyenFISGtJ?=
 =?utf-8?B?aWJVckdzZlV3UFlDdEd1emNoSWVIUkxNOVBrMGUxMWo2ZnI3WFZ6Zm5WQlEz?=
 =?utf-8?B?anVXVDVZbW0wWVNjd1M4RDYzdnRrY3l6M0daMFhRWjFqYzRhNDRueER3TzV5?=
 =?utf-8?B?bzBwUC9OVlBDT3AweGJKRUxYb2ZNaUNRcFZtYmpkN1hSOTlIdmtXa28zV2FV?=
 =?utf-8?B?ZnJSeEMxV2J2K2o5YWVuN214TzRtbUViUHdILy9DWlRjaE40eWlpWVVBYytM?=
 =?utf-8?B?a0ZSZDV5VWRjT05HNzYrRHZiNmZVbWw5TWwyZXJqUUREZ2pPMjR4S2t5SVpT?=
 =?utf-8?B?bEF2WkdBQngxNWIveldwOE9TWE5UUXhndm45VzExVjBSYUM2Z1VwcjBqWDV5?=
 =?utf-8?B?THFhbzBxSkgybHRlcWd5dmNPYWxWYXZlNVdjZzZ6WGtDZ1VFNU5WR0R5NWFE?=
 =?utf-8?B?bmRERTdtR29Ldm5sQlR1Z20rbVNnOXlxQ3dmMTB6bUxsVTNNcm9TRU9lOWdj?=
 =?utf-8?B?bnN6RG9Ga0NYUjZjUHVZTVRxcC9JVUpCVVdYNmRDSHExZHlVbm03ZHlIelc1?=
 =?utf-8?B?NlFGVHVSSXovdUo1bmJxNVZvT1hzcURtUDJGK2RFOWRKd09oY1FTNUxkTlFN?=
 =?utf-8?B?aU5EM1ZGajMzS0hnYUFQRXhhK0JqTlRVb3ZNQ3duMUM5dWhxZ3lIQzYvdmJq?=
 =?utf-8?B?UkxreEpCMTZKUWVRZUx4WEVnWkxubUltNlBGNkpQdU5EQVZCb0dEeU9XY0c5?=
 =?utf-8?B?dUNMMytTL0ppWGlxZVpITnFZbkkvSmhPd2k0dmpWZDNGOGpodFZWa1dDUHVM?=
 =?utf-8?B?N09VNjBOM0hYWlZsK2VXQTdTWUJuMHJBQ2JnYm40SFlEblJQa2xGbkFLM1NW?=
 =?utf-8?B?MCs3c2pFdEdHZWM4SzVkL2NqR2NMVHR2L1RuREs0V0VoL0FscXN6OVZqZEc4?=
 =?utf-8?B?bDZSRWZkNWgxNzNMZkV5djNGeS9WSHUyeVo4V25uQlQrRTg4UVVTUFZlaURK?=
 =?utf-8?B?Y0d3WjdTcHh4aGpvZTBxZ1ZHa3ppL0Y4b2lmQlcrVnU0Umo4UUdNaVF3YlZ6?=
 =?utf-8?B?MHVQRDNGU2JTNVR1ck8wM3NpcDNSdmpmbTNzMVJYbjhpNC9hdVNPdCtMb3BR?=
 =?utf-8?B?dGtvamxhM0x0azNNOFVWQnUzOU1EWnNvdjZoazVONUU1aWVZZ2lRUWVnZVVx?=
 =?utf-8?B?SkxhRTdhbEFlc1JJWkVFOGl3Y0VYSmdpZXlEMVBaOG1JVlNKa3ljeDdGa1Bz?=
 =?utf-8?Q?fKRWCXbjBqHpaV/lEIHer7Q18?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561f6301-c0b6-4399-b892-08dd82e86a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 04:28:08.0087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4qZ8u0UhIpauNpXBdyxf6BhkJMDyDnlR+/Awi4/W6QaSOZJ4W9s+cjl5W7MEr02bsjciowrcU9GAS590pcOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
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

T24gV2VkLCBBcHJpbCAyMywgMjAyNSA3OjE1IFBNIEJyb3N0LCBNYXR0aGV3IHdyb3RlOg0KPiBP
biBXZWQsIEFwciAyMywgMjAyNSBhdCAwNzo1NzoxMFBNIC0wNjAwLCBMaW4sIFNodWljaGVuZyB3
cm90ZToNCj4gPiBPbiBXZWQsIEFwcmlsIDIzLCAyMDI1IDE6MTkgUE0gQ2F2aXR0LCBKb25hdGhh
biB3cm90ZToNCj4gPiA+IEFkZCBpbml0aWFsIGRlY2xhcmF0aW9ucyBmb3IgdGhlIGRybV94ZV92
bV9nZXRfcHJvcGVydHkgaW9jdGwuDQo+ID4gPg0KPiA+ID4gdjI6DQo+ID4gPiAtIEV4cGFuZCBr
ZXJuZWwgZG9jcyBmb3IgZHJtX3hlX3ZtX2dldF9wcm9wZXJ0eSAoSmlhbnh1bikNCj4gPiA+DQo+
ID4gPiB2MzoNCj4gPiA+IC0gUmVtb3ZlIGFkZHJlc3MgdHlwZSBleHRlcm5hbCBkZWZpbml0aW9u
cyAoSmlhbnh1bikNCj4gPiA+IC0gQWRkIGZhdWx0IHR5cGUgdG8geGVfZHJtX2ZhdWx0IHN0cnVj
dCAoSmlhbnh1bikNCj4gPiA+DQo+ID4gPiB2NDoNCj4gPiA+IC0gUmVtb3ZlIGVuZ2luZSBjbGFz
cyBhbmQgaW5zdGFuY2UgKEl2YW4pDQo+ID4gPg0KPiA+ID4gdjU6DQo+ID4gPiAtIEFkZCBkZWNs
YXJlcyBmb3IgZmF1bHQgdHlwZSwgYWNjZXNzIHR5cGUsIGFuZCBmYXVsdCBsZXZlbCAoTWF0dCBC
cm9zdCwNCj4gPiA+ICAgSXZhbikNCj4gPiA+DQo+ID4gPiB2NjoNCj4gPiA+IC0gRml4IGluY29u
c2lzdGVudCB1c2Ugb2Ygd2hpdGVzcGFjZSBpbiBkZWZpbmVzDQo+ID4gPg0KPiA+ID4gU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+
ID4gQ2M6IFpoYW5nIEppYW54dW4gPGppYW54dW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gQ2M6
IEl2YW4gQnJpYW5vIDxpdmFuLmJyaWFub0BpbnRlbC5jb20+DQo+ID4gPiBDYzogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCg0KTEdUTS4NClJldmll
d2VkLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCg0KPiA+ID4g
IGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggfCA4Ng0KPiA+ID4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDg2IGluc2VydGlv
bnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0u
aCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IGluZGV4DQo+ID4gPiA5YzA4NzM4
YzNiOTEuLjU1NmZjMzYwYTA3NiAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IEBA
IC04MSw2ICs4MSw3IEBAIGV4dGVybiAiQyIgew0KPiA+ID4gICAqICAtICZEUk1fSU9DVExfWEVf
RVhFQw0KPiA+ID4gICAqICAtICZEUk1fSU9DVExfWEVfV0FJVF9VU0VSX0ZFTkNFDQo+ID4gPiAg
ICogIC0gJkRSTV9JT0NUTF9YRV9PQlNFUlZBVElPTg0KPiA+ID4gKyAqICAtICZEUk1fSU9DVExf
WEVfVk1fR0VUX1BST1BFUlRZDQo+ID4gPiAgICovDQo+ID4gPg0KPiA+ID4gIC8qDQo+ID4gPiBA
QCAtMTAyLDYgKzEwMyw3IEBAIGV4dGVybiAiQyIgew0KPiA+ID4gICNkZWZpbmUgRFJNX1hFX0VY
RUMJCQkweDA5DQo+ID4gPiAgI2RlZmluZSBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFCQkweDBhDQo+
ID4gPiAgI2RlZmluZSBEUk1fWEVfT0JTRVJWQVRJT04JCTB4MGINCj4gPiA+ICsjZGVmaW5lIERS
TV9YRV9WTV9HRVRfUFJPUEVSVFkJCTB4MGMNCj4gPiA+DQo+ID4gPiAgLyogTXVzdCBiZSBrZXB0
IGNvbXBhY3QgLS0gbm8gaG9sZXMgKi8NCj4gPiA+DQo+ID4gPiBAQCAtMTE3LDYgKzExOSw3IEBA
IGV4dGVybiAiQyIgew0KPiA+ID4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VYRUMNCj4gPiA+IAlE
Uk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQywgc3RydWN0DQo+ID4gPiBkcm1f
eGVfZXhlYykNCj4gPiA+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UNCj4g
PiA+IAlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRSwN
Cj4gc3RydWN0DQo+ID4gPiBkcm1feGVfd2FpdF91c2VyX2ZlbmNlKSAgI2RlZmluZSBEUk1fSU9D
VExfWEVfT0JTRVJWQVRJT04NCj4gPiA+IAlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1f
WEVfT0JTRVJWQVRJT04sIHN0cnVjdA0KPiA+ID4gZHJtX3hlX29ic2VydmF0aW9uX3BhcmFtKQ0K
PiA+ID4gKyNkZWZpbmUgRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9QRVJUWQ0KPiA+ID4gCURSTV9J
T1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfVk1fR0VUX1BST1BFUlRZLA0KPiBzdHJ1Y3QN
Cj4gPiA+IGRybV94ZV92bV9nZXRfcHJvcGVydHkpDQo+ID4gPg0KPiA+ID4gIC8qKg0KPiA+ID4g
ICAqIERPQzogWGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiA+ID4gQEAgLTExOTMsNiArMTE5Niw4OSBA
QCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmQgew0KPiA+ID4gIAlfX3U2NCByZXNlcnZlZFsyXTsNCj4g
PiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICsvKiogc3RydWN0IHhlX3ZtX2ZhdWx0IC0gRGVzY3JpYmVz
IGZhdWx0cyBmb3INCj4gPiA+ICslRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV9GQVVMVFMgKi8gc3Ry
dWN0IHhlX3ZtX2ZhdWx0IHsNCj4gPiA+ICsJLyoqIEBhZGRyZXNzOiBBZGRyZXNzIG9mIHRoZSBm
YXVsdCAqLw0KPiA+ID4gKwlfX3U2NCBhZGRyZXNzOw0KPiA+ID4gKwkvKiogQGFkZHJlc3NfcHJl
Y2lzaW9uOiBQcmVjaXNpb24gb2YgZmF1bHRlZCBhZGRyZXNzICovDQo+ID4gPiArCV9fdTMyIGFk
ZHJlc3NfcHJlY2lzaW9uOw0KPiA+ID4gKwkvKiogQGFjY2Vzc190eXBlOiBUeXBlIG9mIGFkZHJl
c3MgYWNjZXNzIHRoYXQgcmVzdWx0ZWQgaW4gZmF1bHQgKi8NCj4gPiA+ICsjZGVmaW5lIEZBVUxU
X0FDQ0VTU19UWVBFX1JFQUQJCTANCj4gPiA+ICsjZGVmaW5lIEZBVUxUX0FDQ0VTU19UWVBFX1dS
SVRFCQkxDQo+ID4gPiArI2RlZmluZSBGQVVMVF9BQ0NFU1NfVFlQRV9BVE9NSUMJMg0KPiA+DQo+
ID4gVGhlcmUgaXMgdGhlIHNhbWUgZGVmaW5pdGlvbiBvZiAiRkxUX0FDQ0VTU19UWVBFX1JFQUQi
IGluIHRoZQ0KPiAicmVncy94ZV9wYWdlZmF1bHRfZGVzYy5oIg0KPiA+IENvdWxkIHdlIHJlbW92
ZSB0aGUgZGVmaW5pdGlvbiBpbiB4ZV9wYWdlZmF1bHRfZGVzYy5oLCBhbmQgY2hhbmdlIHRvIHRo
aXMNCj4gZGVmaW5pdGlvbj8NCj4gPiBBbHNvIGZvciB0aGUgYWNjZXNzX3R5cGUgaW4gYmVsb3cu
DQo+ID4NCj4gDQo+IE5vIOKAlCBJJ20gZ2V0dGluZyBhIGxpdHRsZSBmcnVzdHJhdGVkIGhlcmUu
DQo+IA0KPiBJJ3ZlIGV4cGxhaW5lZCB0aGlzIG11bHRpcGxlIHRpbWVzLCBib3RoIGluIHRoZSBj
b21tZW50cyBvbiB0aGUgbGlzdCBhbmQgaW4gb3VyDQo+IGludGVybmFsIFRlYW1zIGNoYXQuIFRo
ZSB1QVBJIGlzIGFuIGFic3RyYWN0aW9uIG9mIHRoZSBoYXJkd2FyZSDigJQgaXQgaXMgbm90IGEN
Cj4gZGlyZWN0IGludGVyZmFjZSB0byBoYXJkd2FyZS1yZXBvcnRlZCB2YWx1ZXMgaW4gdXNlciBz
cGFjZS4NCj4gDQo+IFRoZSByZWFzb24gZm9yIHRoaXMgaXMgc2ltcGxlOiBpZiB0aGUgdW5kZXJs
eWluZyBoYXJkd2FyZSBjaGFuZ2VzLCBhIGRpcmVjdA0KPiBpbnRlcmZhY2Ugd291bGQgYnJlYWsg
dGhlIHVBUEkuIFJpZ2h0IG5vdywgdGhlIHZhbHVlcyBtYXkgaGFwcGVuIHRvIG1hdGNoLA0KPiBi
dXQgdGhlcmXigJlzIG5vIGd1YXJhbnRlZSB0aGV5IHdpbGwgY29udGludWUgdG8gZG8gc28gaW4g
dGhlIGZ1dHVyZS4NCj4gDQo+IFBsZWFzZSwgZXZlcnlvbmUsIHN0b3AgYnJpbmdpbmcgdGhpcyB1
cC4NCj4gDQo+IE1hdHQNCg0KT0suIEdldCBpdC4gVGhhbmtzLg0KDQpTaHVpY2hlbmcNCj4gDQo+
ID4gU2h1aWNoZW5nDQo+ID4NCj4gPiA+ICsJX191OCBhY2Nlc3NfdHlwZTsNCj4gPiA+ICsJLyoq
IEBmYXVsdF90eXBlOiBUeXBlIG9mIGZhdWx0IHJlcG9ydGVkICovDQo+ID4gPiArI2RlZmluZSBG
QVVMVF9UWVBFX05PVF9QUkVTRU5UCQkwDQo+ID4gPiArI2RlZmluZSBGQVVMVF9UWVBFX1dSSVRF
X0FDQ0VTUwkJMQ0KPiA+ID4gKyNkZWZpbmUgRkFVTFRfVFlQRV9BVE9NSUNfQUNDRVNTCTINCj4g
PiA+ICsJX191OCBmYXVsdF90eXBlOw0KPiA+ID4gKwkvKiogQGZhdWx0X2xldmVsOiBmYXVsdCBs
ZXZlbCBvZiB0aGUgZmF1bHQgKi8NCj4gPiA+ICsjZGVmaW5lIEZBVUxUX0xFVkVMX1BURQkJMA0K
PiA+ID4gKyNkZWZpbmUgRkFVTFRfTEVWRUxfUERFCQkxDQo+ID4gPiArI2RlZmluZSBGQVVMVF9M
RVZFTF9QRFAJCTINCj4gPiA+ICsjZGVmaW5lIEZBVUxUX0xFVkVMX1BNTDQJMw0KPiA+ID4gKyNk
ZWZpbmUgRkFVTFRfTEVWRUxfUE1MNQk0DQo+ID4gPiArCV9fdTggZmF1bHRfbGV2ZWw7DQo+ID4g
PiArCS8qKiBAcGFkOiBNQlogKi8NCj4gPiA+ICsJX191OCBwYWQ7DQo+ID4gPiArCS8qKiBAcmVz
ZXJ2ZWQ6IE1CWiAqLw0KPiA+ID4gKwlfX3U2NCByZXNlcnZlZFs0XTsNCj4gPiA+ICt9Ow0KPiA+
ID4gKw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIHN0cnVjdCBkcm1feGVfdm1fZ2V0X3Byb3BlcnR5
IC0gSW5wdXQgb2YNCj4gPiA+ICsmRFJNX0lPQ1RMX1hFX1ZNX0dFVF9QUk9QRVJUWQ0KPiA+ID4g
KyAqDQo+ID4gPiArICogVGhlIHVzZXIgcHJvdmlkZXMgYSBWTSBhbmQgYSBwcm9wZXJ0eSB0byBx
dWVyeSBhbW9uZw0KPiA+ID4gK0RSTV9YRV9WTV9HRVRfUFJPUEVSVFlfKiwNCj4gPiA+ICsgKiBh
bmQgc2V0cyB0aGUgdmFsdWVzIGluIHRoZSB2bV9pZCBhbmQgcHJvcGVydHkgbWVtYmVycywgcmVz
cGVjdGl2ZWx5Lg0KPiA+ID4gK1RoaXMNCj4gPiA+ICsgKiBkZXRlcm1pbmVzIGJvdGggdGhlIFZN
IHRvIGdldCB0aGUgcHJvcGVydHkgb2YsIGFzIHdlbGwgYXMgdGhlDQo+ID4gPiArcHJvcGVydHkg
dG8NCj4gPiA+ICsgKiByZXBvcnQuDQo+ID4gPiArICoNCj4gPiA+ICsgKiBJZiBzaXplIGlzIHNl
dCB0byAwLCB0aGUgZHJpdmVyIGZpbGxzIGl0IHdpdGggdGhlIHJlcXVpcmVkIHNpemUNCj4gPiA+
ICtmb3IgdGhlDQo+ID4gPiArICogcmVxdWVzdGVkIHByb3BlcnR5LiAgVGhlIHVzZXIgaXMgZXhw
ZWN0ZWQgaGVyZSB0byBhbGxvY2F0ZQ0KPiA+ID4gK21lbW9yeSBmb3IgdGhlDQo+ID4gPiArICog
cHJvcGVydHkgc3RydWN0dXJlIGFuZCB0byBwcm92aWRlIGEgcG9pbnRlciB0byB0aGUgYWxsb2Nh
dGVkDQo+ID4gPiArbWVtb3J5IHVzaW5nIHRoZQ0KPiA+ID4gKyAqIGRhdGEgbWVtYmVyLiAgRm9y
IHNvbWUgcHJvcGVydGllcywgdGhpcyBtYXkgYmUgemVybywgaW4gd2hpY2gNCj4gPiA+ICtjYXNl
LCB0aGUNCj4gPiA+ICsgKiB2YWx1ZSBvZiB0aGUgcHJvcGVydHkgd2lsbCBiZSBzYXZlZCB0byB0
aGUgdmFsdWUgbWVtYmVyIGFuZCBzaXplDQo+ID4gPiArd2lsbCByZW1haW4NCj4gPiA+ICsgKiB6
ZXJvIG9uIHJldHVybi4NCj4gPiA+ICsgKg0KPiA+ID4gKyAqIElmIHNpemUgaXMgbm90IHplcm8s
IHRoZW4gdGhlIElPQ1RMIHdpbGwgYXR0ZW1wdCB0byBjb3B5IHRoZQ0KPiA+ID4gK3JlcXVlc3Rl
ZA0KPiA+ID4gKyAqIHByb3BlcnR5IGludG8gdGhlIGRhdGEgbWVtYmVyLg0KPiA+ID4gKyAqDQo+
ID4gPiArICogVGhlIElPQ1RMIHdpbGwgcmV0dXJuIC1FTk9FTlQgaWYgdGhlIFZNIGNvdWxkIG5v
dCBiZSBpZGVudGlmaWVkDQo+ID4gPiArZnJvbSB0aGUNCj4gPiA+ICsgKiBwcm92aWRlZCBWTSBJ
RCwgb3IgLUVJTlZBTCBpZiB0aGUgSU9DVEwgZmFpbHMgZm9yIGFueSBvdGhlcg0KPiA+ID4gK3Jl
YXNvbiwgc3VjaCBhcw0KPiA+ID4gKyAqIHByb3ZpZGluZyBhbiBpbnZhbGlkIHNpemUgZm9yIHRo
ZSBnaXZlbiBwcm9wZXJ0eSBvciBpZiB0aGUNCj4gPiA+ICtwcm9wZXJ0eSBkYXRhDQo+ID4gPiAr
ICogY291bGQgbm90IGJlIGNvcGllZCB0byB0aGUgbWVtb3J5IGFsbG9jYXRlZCB0byB0aGUgZGF0
YSBtZW1iZXIuDQo+ID4gPiArICoNCj4gPiA+ICsgKiBUaGUgcHJvcGVydHkgbWVtYmVyIGNhbiBi
ZToNCj4gPiA+ICsgKiAgLSAlRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV9GQVVMVFMgICovIHN0cnVj
dA0KPiA+ID4gK2RybV94ZV92bV9nZXRfcHJvcGVydHkgew0KPiA+ID4gKwkvKiogQGV4dGVuc2lv
bnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmIGFueSAqLw0KPiA+
ID4gKwlfX3U2NCBleHRlbnNpb25zOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiogQHZtX2lkOiBUaGUg
SUQgb2YgdGhlIFZNIHRvIHF1ZXJ5IHRoZSBwcm9wZXJ0aWVzIG9mICovDQo+ID4gPiArCV9fdTMy
IHZtX2lkOw0KPiA+ID4gKw0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNX0dFVF9QUk9QRVJUWV9G
QVVMVFMJCTANCj4gPiA+ICsJLyoqIEBwcm9wZXJ0eTogcHJvcGVydHkgdG8gZ2V0ICovDQo+ID4g
PiArCV9fdTMyIHByb3BlcnR5Ow0KPiA+ID4gKw0KPiA+ID4gKwkvKiogQHNpemU6IFNpemUgdG8g
YWxsb2NhdGUgZm9yIEBkYXRhICovDQo+ID4gPiArCV9fdTMyIHNpemU7DQo+ID4gPiArDQo+ID4g
PiArCS8qKiBAcGFkOiBNQlogKi8NCj4gPiA+ICsJX191MzIgcGFkOw0KPiA+ID4gKw0KPiA+ID4g
Kwl1bmlvbiB7DQo+ID4gPiArCQkvKiogQGRhdGE6IFBvaW50ZXIgdG8gdXNlci1kZWZpbmVkIGFy
cmF5IG9mIGZsZXhpYmxlIHNpemUgYW5kDQo+ID4gPiB0eXBlICovDQo+ID4gPiArCQlfX3U2NCBk
YXRhOw0KPiA+ID4gKwkJLyoqIEB2YWx1ZTogUmV0dXJuIHZhbHVlIGZvciBzY2FsYXIgcXVlcmll
cyAqLw0KPiA+ID4gKwkJX191NjQgdmFsdWU7DQo+ID4gPiArCX07DQo+ID4gPiArDQo+ID4gPiAr
CS8qKiBAcmVzZXJ2ZWQ6IE1CWiAqLw0KPiA+ID4gKwlfX3U2NCByZXNlcnZlZFszXTsNCj4gPiA+
ICt9Ow0KPiA+ID4gKw0KPiA+ID4gIC8qKg0KPiA+ID4gICAqIHN0cnVjdCBkcm1feGVfZXhlY19x
dWV1ZV9jcmVhdGUgLSBJbnB1dCBvZg0KPiA+ID4gJkRSTV9JT0NUTF9YRV9FWEVDX1FVRVVFX0NS
RUFURQ0KPiA+ID4gICAqDQo+ID4gPiAtLQ0KPiA+ID4gMi40My4wDQo+ID4NCg==
