Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FAD033F7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CE410E740;
	Thu,  8 Jan 2026 14:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSzmPn2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5240C10E73F;
 Thu,  8 Jan 2026 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767881638; x=1799417638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2AQl2FVN2EKJ4B6/xkr5OU4aUArEZOue13ZWweLBotY=;
 b=aSzmPn2/73v15n77ZZkGWRtNx7BAOi6KykIx9ypR+gWoqxC18f+ecJ5C
 lRpKwAQHhcigZ4m87mMqnZrZTOrLANrpXHAWSXx+UTZp1HrlyrDKL0xOS
 B5ic7SDczH33Ecb2/5Tff0NFrQq8xDo1iTucji5X9DhLo1NXqK1Xl4P/+
 6ify7kh4F1BBKeJE391+PyEliv1H7arhtIFuSekeUzr4D2LH+KW80m8UM
 pSf4dfCT4gY9sjP/KuRX7CT4s4wGJPRlnQfB99AX6sd7/g9yyH+TkPRaH
 vAfkSWLkPYSC4ufKYgOHGV53Mmz00nmMLEC9avvIlGBTAUTT5O/DxzVUy Q==;
X-CSE-ConnectionGUID: qTZZ90otQXqrkfiFUu8uqw==
X-CSE-MsgGUID: nPo8SA2+Qzqmma/O9otbMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68453819"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="68453819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:13:58 -0800
X-CSE-ConnectionGUID: ylABEfjmQZGSOy1//A72xg==
X-CSE-MsgGUID: 9TiFQcAPSF+5+BZ/FKomzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="240700012"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:13:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:13:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 06:13:57 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeoAHUgoP+FahJpA1dvfzRv/Icz86yGZvFH6A7aRwCgp76f4VnVbe2WPAQw30yvmkRd+ZqZoR8iq3xo4nPLV0gwKB05blEcCty1/lETvnvdvVxtAI7WrWKGCYT5j3EebFQHM5X/zoFpHERVW/auAwPHQi0yMEhgt4v/A74eN1lSOtLgWBZI9lBBi4eWiYrPXAowZZSvM2KHm9s0oz46haYyEu5/VHHUL04hnGVmADYpbIgqbDG6U5lZmZhDXVS64NWkOr3GuGvyqXsGYNGZG9fQ+h9u3v6+mkzDpBNjK9R9jIa5smeGcRUmHixzLL6qJXZJdoAmJn4zoXZaU5ObEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AQl2FVN2EKJ4B6/xkr5OU4aUArEZOue13ZWweLBotY=;
 b=tUXfxts3pErXteyfI8/cOmrDWfD///S4WsMbZqAhmz0+QqGtJwyKIuoITqtqq6E7nYzwY8nQbgVTXgrrzk8ZWkQuCMHHDulypHZTx9S1Uq0C6zWEXu4ViAb85rSRMdAgfCjQ2WHUiYmnTFXL3NzYuWK2aosDZbFjGldEz9+arSf+AqNhBbO9VJQsxn2krQp6a09yCCigIlQQPnzG30EXFo4ffbUXPIqZkZO9qJ2T1OHFVIB3leXQyqoHdVFjWZMBfxZjPvYQnimgBxZgCFwTqnBDZhJovNsD2rq2EYf+jiQWaj68fkpOnKJ+QBwzDhu2stxwnEEvd6DyTCp1fx/nIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 14:13:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:13:49 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "marco.crivellari@suse.com" <marco.crivellari@suse.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "tj@kernel.org" <tj@kernel.org>,
 "mhocko@suse.com" <mhocko@suse.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "frederic@kernel.org" <frederic@kernel.org>, "jiangshanlai@gmail.com"
 <jiangshanlai@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "bigeasy@linutronix.de"
 <bigeasy@linutronix.de>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Thread-Topic: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Thread-Index: AQHcTOQzs+I7GoXvTU+REq/ekOb0s7VIq6oAgAAEioCAAAgGAA==
Date: Thu, 8 Jan 2026 14:13:49 +0000
Message-ID: <d17704763f2abbb546574f2ae951e439bc7af48b.camel@intel.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
 <20251103170604.310895-2-marco.crivellari@suse.com>
 <aV-xEjo5ejSM73DN@intel.com>
 <CAAofZF4_uV+78JWq2FLaezv4qaVK7BiyVLXmXNtaPXB_jhvDYQ@mail.gmail.com>
In-Reply-To: <CAAofZF4_uV+78JWq2FLaezv4qaVK7BiyVLXmXNtaPXB_jhvDYQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|LV3PR11MB8577:EE_
x-ms-office365-filtering-correlation-id: 57d40f0b-a0b7-415d-6cbd-08de4ec02532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M3BiQ3JmSk5xNDdTVDlzZHVJQ2puU3FDYTV4Zm05aysrNzlhdHhPby9xTjAr?=
 =?utf-8?B?VkZxRVJaeDUvSUdmaEpSd3craE10SGV3R0lveTA5blE2UmRicWlJYnNyTS9T?=
 =?utf-8?B?T0tOcXh0SVRrTXdYQUhTamZXMldsQVZQejJhYmR4OUJuL0lmd0I4OGJZN0NT?=
 =?utf-8?B?ME5IckwxMGhOM09QaGUxdWQ1WWZSRVdTVzFHL2luRUlzenYrZ1BSV0dlank4?=
 =?utf-8?B?Mmtxd1Zhc3V4QXJ2d3VRZFQrRVhMWHJLdXdhY0k4QSt1bTZQOU1Rc1IvOVUy?=
 =?utf-8?B?anhFQnptVVhhK2kxYktQMjRVYW5YVDZ4dUYwT2pMWEY2cEhESzhVUHhCcEYw?=
 =?utf-8?B?VEdYSFpZa2JqOWxPRUZ6UTJPREV6dnNqRnpYYmY2cEVQK3BRa3kxRzlNMWhu?=
 =?utf-8?B?RjhvSXllZWF6VWpoYUZSU2ovdHlScjZpMkFLR09zZSt0M0c5M0ROL0FlK29x?=
 =?utf-8?B?aE1KNU9sRStqSS9NdUh6Y29nVzNkMUFmejRGTEhUUjdCTytCeTB4Sm5WOThW?=
 =?utf-8?B?dTgwOHpNVkJjMW9oMjNJTThHNHBVWXprV1UxSGw5L3hrSG03NkkzN3d1ODJR?=
 =?utf-8?B?OXo0MjFhV0tVaGY1OHVkWWtHTGJsbWkrWXVuNTVrY2xIWTZieFloOWlSRy80?=
 =?utf-8?B?djFGQ0ZDRVE5VFd3LzY3anErMnNuOTNOd3pqUWwzSkR1Tm9YVDdPMHp4Mi9F?=
 =?utf-8?B?UUt1eHdaQ0tINUtJZm1zdkJlZTUwWDZzeHJEYmVtcmpCSk12UVFxVkdSVlVy?=
 =?utf-8?B?aDVaRm5xQUhlem9VLzZHTnp2c29mU3pmUGNBM1VGUUZNcThpblpkZURRVmJI?=
 =?utf-8?B?N3BVYUVGZTM2blUvaXpZVWJVQ1hvTjVHM21HajNTaFdVVkk0VVh2bDJjTzJ3?=
 =?utf-8?B?VzBjK2V0dGRpaWRIUDdhQklicTM2WFhqZzVDekdrSkM0bWR0V3I1WVAxbUpK?=
 =?utf-8?B?YnZ0N3ZnMlVjYWFReldtVWs2OUFzZVZjMDZGNmp4S2RtZzdYalUwT2lIYldV?=
 =?utf-8?B?alBHS0hYeitueFQydTFWd3ROT254TTFSWEZpSTFvUlRHU3Z4d25EQ2Z4MkEx?=
 =?utf-8?B?STRUOXhmTDUyTXZKV2Q0MGJvaWozdXhuWXFIM0NxeDQ5ZzhiRnBxbERpaWhi?=
 =?utf-8?B?d1gwVDRSYzJrT3ZqekVNYzJOS1RuYU5QaGU5TjVxMnJmdkZxMjZlRzd6cUgx?=
 =?utf-8?B?ZTZoL2VJaGYzZmhJbkF5Qm5QODhpNks4Y01SYzY1RGxhKzdEWk1Xcjl3QXVY?=
 =?utf-8?B?Zi9vMUFaTlNyeFg0KzA2NFEveGsvRWJkUXJ1OFpnWXdXQ0RkN1ZJZm1DVGtz?=
 =?utf-8?B?amIyUWcxSll6clBkNkNEKzc5UWFXd3NlU21CaU5KZlhaaGx0L1ppSVo2YUk0?=
 =?utf-8?B?SklkNDFZMUpkajBWS0JUZmNiTE5zV2lraXFSMDRwNG5kQ2JaT0pNa3k4dHVa?=
 =?utf-8?B?cjdYRTV3TWlRTnNLSDZtTU5Kb3VQNm1DdUt0MTk0cWxIRHZxd0t5eGo1dXNY?=
 =?utf-8?B?RW9hYXpWa01VSXpPUElZR1kyblhvd0p2THZSTnZaRVdoc25VbHkzK0JoakNu?=
 =?utf-8?B?cE1vWGpBcDJqUEpXbjNRVGsvUWtvYWxJT0FONFd4cjRzTjBZOWFkdGN4OHlu?=
 =?utf-8?B?dHh4eEtQRHgyTEpCNVF5R2tZNlNDSTNDZzhya2I5L3BNSFg5R2x5VEtqaFRK?=
 =?utf-8?B?VEQ0SHNFcUExSENsYnNlelFBSTFEOVoycHdjU2JLbXM2NGdWWmJnc0VZeng0?=
 =?utf-8?B?Y2lxWG8yREdVa3cxQTF1VUR6V2QveUoycVZNY3hWSlpZaFh2MDBORnZLNFd1?=
 =?utf-8?B?R2haTS9kdVUvcmJkUyt1UmVhbWdFUm03Ujl4RUl5MXZ6YWtzbmZtOTBqdUtT?=
 =?utf-8?B?TldQdktmWDlLaEpueld4YnBZSnBvUlRFdnNjK3ZVeXRlRUJjNGR5aW51aTFU?=
 =?utf-8?B?bGdlbitha055RFJld1VWbVdMTGRUNEQxL09CWmVsbmxJZVFNS0N4TmVKSXAy?=
 =?utf-8?B?TEptaHN6YXNjbkJ1TzBXZVh5ZWlhWmJ6K0xTeEpYbkorL2dHeCtSZ000alFB?=
 =?utf-8?Q?C/U790?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXFMdTBvK2lHekhvdktzbzRYdG4xVUh3UzZVZURuZXVvMTBCL1dCR0E1aTd2?=
 =?utf-8?B?WTlhOEcrK3NaaDkyNlR2dG1Pc1c3UW5UdVRIY1BKYWJoaStqNXNuRGhKK3ow?=
 =?utf-8?B?bTZLRmd6bDdFYit1eEJ0TFhDREZRU1QwK056cnBVeGVVYnRGYVJYdTRqMGd2?=
 =?utf-8?B?RXFtWnNDN0NKUjZKVlJacm15K0l4LzNwUXhpS0FqSzhxMDVEQXUxZ2gwWmZo?=
 =?utf-8?B?b21pZXRaRUtNMHV1RUQzUkI0aWRjYmhRTU1SdDNzSHA4WmR3TUJQQi9SdGtO?=
 =?utf-8?B?ZTBxcVZRMkdxdzNFRE9TSUVSSVJTNzdFK05pRUQvSmltVkU2c0J1UDNxLzQy?=
 =?utf-8?B?YmVXUnJLclNHQVVJVk5sSkp3MUcvN2o1VnNyNVNuQnpURkpkOUhVME44MW12?=
 =?utf-8?B?Y240OXZPRVMxTVZ6Z3M5SWVWcml4cTd3OGh1a3NiWExRd3pmVXdJclIrQldT?=
 =?utf-8?B?blNqYlRlSmFhS2NERCtZcnYycmRwYU8yTEMyN2dhbDF4bFArZnZDT3pxeVJp?=
 =?utf-8?B?MEtQOHlHUUhaRldUeFZva3k1T2pWZjA5WE1wU2xYOGEvZ3NrMjBwdUhPSmZx?=
 =?utf-8?B?ZWU4S2tscEFoVk50a2REQk1lZnRZMUg0RVMzZ2oxU05QMEhUL2xYMlhscXNB?=
 =?utf-8?B?VTQ5c21KK01reFBleTNnL1RVZC9jTnZlSDhBNE9MVzBMSHFWLzJvOFlOQzlD?=
 =?utf-8?B?aUNpdWN3elhERFhFdUgrRlorLzV2UUx6ZDdRL0Z3NFdkYkxhUUNtSXlVU3dK?=
 =?utf-8?B?cVVKUWoxN0hSUGg2dlgrNHdWbjdjQU43UHVaOUEwREZhY1B5dnprZjFFOGVE?=
 =?utf-8?B?ekNYbW9QVDV3L0FzYUdnN21XaUxlbXE3aytWWkNrVjRsY25qOHo2R1VmSFlT?=
 =?utf-8?B?K2tsWGM2VmZPRHRwMlIwQ2VLak9iQ0MrcjVYenpXdkRjRUg4cWRHLy9mS29h?=
 =?utf-8?B?dnJWK0MyYnY4TVhueGJHMVlIVC9hU1Jac0JSc0FVQnhCajJ5dkVCem9IcDZF?=
 =?utf-8?B?THRsWGhnV0xoNkZ1VWZqa2ZieGJXRlA3WmRsR1o4bEZaV2hjdFRFazhIZVUv?=
 =?utf-8?B?Q2JTZUVVT2xSYUdXdExybmxLU1R2bXZlSFFQdm9IQXc0dkU5ZHUyWVJuZEgv?=
 =?utf-8?B?bVlGZDBOOU5lT2RpVjJtbitWa2twaTlhT2lodFMyV1hZMVZDMkplQTBlMEtF?=
 =?utf-8?B?OE00SXB5aDlHaFlYZEZpYzRzQU9IajZXZTYyZDRkMUMrTWxNdEx1RHpiUVFK?=
 =?utf-8?B?NVRDTklOdmVleE01UHJ3SlNGWkN0VEJTaC9MSWN2WTk0ekljaC9VZXo4WDFa?=
 =?utf-8?B?MkloZ3NsQTNqbjVzYWNwd3V4ZkIyejUzSHYrQ3RrcnVoZzFCeUEwWkhEdEgx?=
 =?utf-8?B?SlhMN0tUaExDSnVYbnVQVXpHTm12QVRmcGhRa0FmOGw4NHJHaW9SRk1sMWZo?=
 =?utf-8?B?N0t4SWlaZWhZdGVpTVJ5cDFvcWVQT29nSm15enFjbFdZeTBvemFKaGVuYUhR?=
 =?utf-8?B?MEJybVhJU3pPNjF0RXUwR2VPZUh3RndZNi9kWkVBN3BOUTU3eUR5WFpZOHF5?=
 =?utf-8?B?QWF3RG5qaW9sR0VPSUV5cVljUjd3YXFMeklOU0t5SWV4NTRwU2piT0M2YS96?=
 =?utf-8?B?QzQ2bGJiaThmRGZ3RkdwZ21YVjBjUTVqS3Y0Vm5ZYk5sVnFJRzZvcCtSYzJJ?=
 =?utf-8?B?byt3bnBXdWZ4SFkwUTFFWTRZSUxld1gwM3F1Z2RWdXRFMTFBbzFodnJaWU4v?=
 =?utf-8?B?R0s5cWdGaHBhc2JlWmJoc0l5MUZ3NXNIcnRyVnRwdmVYVXZyMTg3NTNqaEpp?=
 =?utf-8?B?em5SSnFwdS9NNUpOcVRuZmJzYnhhYlJuazUxS1pPTWFNdkxKRmJWUGQvZnBU?=
 =?utf-8?B?b1lrb1JvRGRGRmNtaWJPSmQzTnBCcE5VV0UzTkZpOFVYMDFLK1NVSEhycnBa?=
 =?utf-8?B?YnZob3BnOEN3MDU2RGR3ZHhhUXRMU0R0TVNKR3dzVjZYTnhYMlRxdFVQcGpC?=
 =?utf-8?B?SDRCaEpyWlp4aVpRbnB4T05ZTWYwWXQ5U2tnWEJiMmwveWptN0VQUmxUNGZj?=
 =?utf-8?B?WEZnYjd5UUFMZ25JSG8xOVRhdHdZenlOSzJwL3dzNXJ5bEoyaVpkeC9hNDBv?=
 =?utf-8?B?WjNXZEhnOTVmMmZ0SHJjNlJYK2hYdVZVVTFtUWpzY08zbWZxUm9tcXY2MmF6?=
 =?utf-8?B?bzIvN01hT2Vkckc5S0hVaU9LMVZ5Q3BDU1h3Q2RiYTlYWXdyTThaZUJ1aStS?=
 =?utf-8?B?S01zVTEvaHFQQnFXN2JlZFRWT0NvNmdPemNMMGZqQ1crWm5VTFBmUHBHb0FF?=
 =?utf-8?B?UGNtUHdwcEhrZW1HUXlMTm5OdityOHNqSm1LSXo3TThKczhuc1N6bG13dG1t?=
 =?utf-8?Q?Q8l47XkFUkh0cNq0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64C9EAF1C08C124BAC26C6A2CE3320D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d40f0b-a0b7-415d-6cbd-08de4ec02532
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 14:13:49.7303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwU3xPPHiWML/mwQst+OZFdi8KlobGCWFGSYhO13GdlBHztMEW7P099Aq4i8EwNm+ac++cxQEKCJA0Qha2uo4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

T24gVGh1LCAyMDI2LTAxLTA4IGF0IDE0OjQ1ICswMTAwLCBNYXJjbyBDcml2ZWxsYXJpIHdyb3Rl
Og0KPiBPbiBUaHUsIEphbiA4LCAyMDI2IGF0IDI6MjnigK9QTSBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+IEknbSBzb3JyeSBmb3IgdGhlIGRlbGF5
IGhlcmUsIGJ1dCBjb3VsZCB5b3UgcGxlYXNlIHJlZmFjdG9yIHRoaXMNCj4gPiBjb21taXQNCj4g
PiBtZXNzYWdlPw0KPiA+IA0KPiA+IFRoZSBmaXJzdCBwYXJ0IG9mIHRoaXMgY29tbWl0IG1lc3Nh
Z2UgaXMgdGhlIHRydWUganVzdGlmaWNhdGlvbiBmb3INCj4gPiB5b3VyDQo+ID4gb3JpZ2luYWwg
d29yaywgbm90IGZvciB0aGlzIHBhdGNoIGhlcmUuDQo+IA0KPiBIaSBSb2RyaWdvLA0KPiANCj4g
U3VyZSwgSSBhbHJlYWR5IGhhdmUgYSBuZXcgdmVyc2lvbiBvZiBpdDoNCj4gDQo+IC0tLQ0KPiAN
Cj4gVGhpcyBwYXRjaCBjb250aW51ZXMgdGhlIGVmZm9ydCB0byByZWZhY3RvciB3b3JrcXVldWUg
QVBJcywgd2hpY2ggaGFzDQo+IGJlZ3VuDQo+IHdpdGggdGhlIGNoYW5nZXMgaW50cm9kdWNpbmcg
bmV3IHdvcmtxdWV1ZXMgYW5kIGEgbmV3IGFsbG9jX3dvcmtxdWV1ZQ0KPiBmbGFnOg0KPiANCj4g
wqDCoCBjb21taXQgMTI4ZWE5ZjZjY2ZiICgid29ya3F1ZXVlOiBBZGQgc3lzdGVtX3BlcmNwdV93
cSBhbmQNCj4gc3lzdGVtX2RmbF93cSIpDQo+IMKgwqAgY29tbWl0IDkzMGMyZWE1NjZhZiAoIndv
cmtxdWV1ZTogQWRkIG5ldyBXUV9QRVJDUFUgZmxhZyIpDQo+IA0KPiBUaGUgcG9pbnQgb2YgdGhl
IHJlZmFjdG9yaW5nIGlzIHRvIGV2ZW50dWFsbHkgYWx0ZXIgdGhlIGRlZmF1bHQNCj4gYmVoYXZp
b3Igb2YNCj4gd29ya3F1ZXVlcyB0byBiZWNvbWUgdW5ib3VuZCBieSBkZWZhdWx0IHNvIHRoYXQg
dGhlaXIgd29ya2xvYWQNCj4gcGxhY2VtZW50IGlzDQo+IG9wdGltaXplZCBieSB0aGUgc2NoZWR1
bGVyLg0KPiANCj4gQmVmb3JlIHRoYXQgdG8gaGFwcGVuLCB3b3JrcXVldWUgdXNlcnMgbXVzdCBi
ZSBjb252ZXJ0ZWQgdG8gdGhlDQo+IGJldHRlciBuYW1lZA0KPiBuZXcgd29ya3F1ZXVlcyB3aXRo
IG5vIGludGVuZGVkIGJlaGF2aW91ciBjaGFuZ2VzOg0KPiANCj4gwqDCoCBzeXN0ZW1fd3EgLT4g
c3lzdGVtX3BlcmNwdV93cQ0KPiDCoMKgIHN5c3RlbV91bmJvdW5kX3dxIC0+IHN5c3RlbV9kZmxf
d3ENCj4gDQo+IFRoaXMgd2F5IHRoZSBvbGQgb2Jzb2xldGUgd29ya3F1ZXVlcyAoc3lzdGVtX3dx
LCBzeXN0ZW1fdW5ib3VuZF93cSkNCj4gY2FuIGJlDQo+IHJlbW92ZWQgaW4gdGhlIGZ1dHVyZS4N
Cj4gDQo+IA0KPiA+IEV4Y2VwdCBmb3IgeW91ciBsYXN0IHBocmFzZSwgd2hpY2ggaW5kaWNhdGVz
LCBzb21lIHdpc2ggb2YgcmVtb3ZpbmcNCj4gPiB0aGUgdW5ib3VuZF93cSwgaXQgZG9lc24ndCBz
dGF0ZSBjbGVhciBvbiB3aHkgd2Ugc2hvdWxkIGNoYW5nZSB0aGUNCj4gPiB1bmJvdW5kIHBlciB0
aGUgZGZsIChkZWZhdWx0PykuDQo+ID4gDQo+ID4gUGVyaGFwcyB0aGUgYXV0aG9ycyBvZiB0aGVz
ZSBjYXNlcyBiZWxvdyB3YW50ZWQgdG8gYmUgdW5ib3VuZCwNCj4gPiBidXQgY2hvb3NpbmcgdGhl
IGRlZmF1bHQgd2lsbCBtYWtlIHVzIHRvIGJlIHRpZWQgdG8gd2hhdGV2ZXINCj4gPiBkZWZhdWx0
IG1pZ2h0IGJlY29tZSBpbiB0aGUgZnV0dXJlLg0KPiA+IA0KPiA+IFJpZ2h0IG5vdyBib3RoIHVu
Ym91bmQgYW5kIGRmbCBhcmUgaWRlbnRpY2FsLiBJbiB0aGUgZnV0dXJlDQo+ID4geW91IGFyZSBw
bGFubmluZyB0byByZW1vdmUgdGhlIHVuYm91bmQsIGJ1dCB3aGF0IGFib3V0IHRoZSBkZmw/DQo+
ID4gQW55IHBsYW5zIG9yIHBvc3NpYmxlIGNoYW5nZXM/IElmIG5vIGNoYW5nZSBpcyBwbGFubmVk
IHRvIGRmbCwNCj4gPiB3aHkgY3JlYXRlIGRlZmF1bHQgYW5kIHNpbXBseSBub3Qgc3RheSB3aXRo
IHRoZSB1bmJvdW5kIG9uZQ0KPiA+IHRoYXQgaXMgbXVjaCBtb3JlIGNsZWFyIG9uIGl0cyBpbnRl
bnRpb24/DQo+IA0KPiBZZXMsICJkZmwiIGlzICJkZWZhdWx0Ii4NCj4gDQo+IFdpdGggdGhlIG5l
dyB2ZXJzaW9uIGFib3ZlIEkgdGhpbmsgaXQgaXMgY2xlYXIsIGJ1dCBpbiBzaG9ydDogdGhlDQo+
IHJlbmFtZQ0KPiBpcyBuZWVkZWQgYXMgYSBmaXJzdCByZWZhY3RvcmluZyBzdGVwOyB0aGUgcGxh
biBpcyB0byBoYXZlIGFuIHVuYm91bmQNCj4gd29ya3F1ZXVlDQo+IGFzIGRlZmF1bHQuDQo+IA0K
PiBzeXN0ZW1fdW5ib3VuZF93cSB3aWxsIGJlIHJlbW92ZWQgYW5kIGNoYW5nZWQgd2l0aCBzeXN0
ZW1fZGZsX3dxLg0KPiBzeXN0ZW1fZGZsX3dxIGlzIHRoZSBuZXcgdW5ib3VuZCB3b3JrcXVldWUs
IGl0IHdvcmtzIGV4YWN0bHkgdGhlIHNhbWUNCj4gYXMNCj4gc3lzdGVtX3VuYm91bmRfd3EuDQo+
IA0KPiBzeXN0ZW1fd3Egd2lsbCBiZSByZXBsYWNlZCB3aXRoIHN5c3RlbV9wZXJjcHVfd3E7IHNh
bWUgdGhpbmcgYXMNCj4gYWJvdmUsDQo+IG5vIGJlaGF2aW9yYWwgY2hhbmdlcywgc3lzdGVtX3Bl
cmNwdV93cSBpcyB0aGUgbmV3IHBlci1jcHUgd29ya3F1ZXVlLg0KPiANCj4gVGhpcyBpcyB0byBt
YWtlIGNsZWFyIHRoYXQgaWYgYSBwZXItY3B1IHdvcmtxdWV1ZSBpcyBub3QgbmVlZGVkLCB0aGUN
Cj4gY29ycmVjdA0KPiBjaG9pY2UgaXMgc3lzdGVtX2RmbF93cS4NCj4gDQo+IEFsc28sIGR1cmlu
ZyB0aGlzIGNvbnZlcnNpb24gcGhhc2UsIEkgY2FuIHRlbGwgbWFueSBzdWJzeXN0ZW1zIGFza2Vk
DQo+IHRvDQo+IGNoYW5nZSBzeXN0ZW1fd3EgKHRoZSBuYW1lIG9mIHRoZSAib2xkIiBwZXItY3B1
IHdvcmtxdWV1ZSkgd2l0aA0KPiBzeXN0ZW1fZGZsX3dxLCBiZWNhdXNlIHRoZXkganVzdCB3YW50
ZWQgdG8gdXNlIGEgc3lzdGVtIHdvcmtxdWV1ZSBhbmQNCj4gdGhvdWdodCBzeXN0ZW1fd3Egd2Fz
IGFscmVhZHkgdGhlIHVuYm91bmQgb25lLg0KPiANCj4gQWxsIG9mIHRoaXMgd29yayBoYXMgYmVl
biBkaXNjdXNzZWQgaGVyZToNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MDIyMTExMjAwMy4xZFN1b0d5Y0BsaW51dHJvbml4LmRlLw0KPiANCj4gSSB3aWxsIGFkZCB0aGlz
IExpbmsgdG8gdGhlIGFib3ZlIGNvbW1pdCBsb2cuIExldCBtZSBrbm93IGlmIGl0DQo+IHNvdW5k
cyBnb29kLg0KDQpUaGlzIGlzIHBlcmZlY3QsIHRoYW5rIHlvdSENCg0KPiANCj4gVGhhbmtzIQ0K
