Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39354C1E288
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7710E884;
	Thu, 30 Oct 2025 02:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qf0lI7J8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F6B10E881;
 Thu, 30 Oct 2025 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761792411; x=1793328411;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IJMqkaAz7SdL2O00/U0N+zQdE5OQVIJhWZs0tSjYtrE=;
 b=Qf0lI7J8g034Nmjyvi9H+Xom5je2gqzQ0A/scWfdXQKgOZmLCsv8Y2FE
 3EO5ARPQCir7jJHC4IrS7ZYdIOtSeDgA1Abrv7/II7bsLw6I19JlxCJbE
 /ceoYZ5WqyMJGnb1ykj8WG2wNHaQmwfFuuyhlazOoRJmolFrRk/XMJ/+D
 iRwPocHNCGVz9n4YnGd7NQu36DoxGmE2FvN1rI1wSxETT0qg4f363Yqlv
 EZtxp052Ar6qoO08UBnNW4Ni+LBJEeamdbP9Rzp7RIDrjf/F/bQ6Lx61O
 0Od6csjNx86ARmqFTago++KjeqxvA0Gs5dRiTOWC5ZK6JG12ujIC3gqPj A==;
X-CSE-ConnectionGUID: TKlv5GCWReqOZbeGEby/Kw==
X-CSE-MsgGUID: Q+Hr+D90QPmzx+rAx31SOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63836266"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="63836266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 19:46:49 -0700
X-CSE-ConnectionGUID: uV3WiQVHTB2wwg689vhWOg==
X-CSE-MsgGUID: uCa22gNdQlmMHaT/y/DUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185712492"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 19:46:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 19:46:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 19:46:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 19:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRX9M0h22VyTiNurNU7lHK1i13AKgN8v3jL+HpLXBFfqWfDMLUoq55pFw7PRrzcYkZq1OT0wJBI90j5sfNLQ5mjr+RQjI/DfC6t8VtdlBbbogwveJoSbDT5G6Gil+GQRXuUVFmDJd+5Kfu7wpnhyQJ72keuR/DFHVLrZ13aGqorAdGMIe8KlLeQo0gH8hX7UVrMZC1bdskyJWhlQQHlfb2v+kDYQQbfaYLtST7sSzb5eRoOT2VEqNH69r2lhOVtMHCOaJTVbA+pQ1APzyBVw1TO/wJZIA6ykcI7F4tQaFky3zio3yytxMZTtScrptuEJ86ToooLfjtBM8giYCMPqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P17e/tQkqSKkklkYRbIl7/UtRklHFvSvs/eqIrrZKBg=;
 b=EDDw2/8v1wHtLkfOx6v+Pc50+gLvcWL3g2zhy5XlCmnwWNgiVQR4449mrlTjKNtQqW6EcA9GZ3NCM5UiNkh36KqTmQgK8P2RJI8XzrIR3QhJglovmBBzHCGxNQb9PDnzocqjGaFSztGHGzMk35U/8cJkfFiMD1zhJpAYziNnbpG95CWx6n/VV1X98PHzg9BvtNGf6QK/x1GmNMfVZsF8xvMoe6XVOGy9NLpX+OfOOrcmcpSTUA30lLN5kFEJ6yKgVEVeEEIbikV4LYrxtiZ2IppvbA1CCzwi3KIlPF5MhXnixxYPbPGqe/VgWRGJ+GXP3CoHP+Fca94YEzWMH1aKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 02:46:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 02:46:40 +0000
Date: Wed, 29 Oct 2025 19:46:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 03/15] drm/pagemap, drm/xe: Manage drm_pagemap provider
 lifetimes
Message-ID: <aQLRjf89j5uuw2JS@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-4-thomas.hellstrom@linux.intel.com>
 <aQFjzTpZwYaytZqB@lstrano-desk.jf.intel.com>
 <4e6b06069f77aee5cf7153e0ac0cf1a30c1327a0.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e6b06069f77aee5cf7153e0ac0cf1a30c1327a0.camel@linux.intel.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cd1b8f-51d5-4650-85a6-08de175e8dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTdVVTN3MWlycEw1QkZ6a2MxT3piSWhoeUJJNUVpc3NtOFZOektHblIzb3pU?=
 =?utf-8?B?d1F5T2RpOW5vMmE0RERnQ0t4QTNOZUEvd3JwbkJEcnl3M3NnamxxRWx5V3N6?=
 =?utf-8?B?ZGtjOFc1K2hBL1F4OHpxeEpEMzJzcmhBb1JuYUhCd0MreEdlTko0YU40MzVK?=
 =?utf-8?B?YVczVzdpdzc0UVFkNnRSdkxtT040RUVZQitSM0pRa2JvK0JxZm1Obk15TEd5?=
 =?utf-8?B?RnFTNGhBZlVRekx1N3JybEVuZnBNbkhORnlHdmZYazVTeG5LV0tZVzBldHZH?=
 =?utf-8?B?WW5TeGlWSGd2K0ordHJ0RlFLSGlBc3FCSDJvaWtRdEd2dWFHZG53VDJqZk1C?=
 =?utf-8?B?bkxLbEF2RlFIM3JyYWZOd1A0UGtrT0pseUFwL29RR00zNlFIdGkzY2xBQ1Fk?=
 =?utf-8?B?UkJ1UXJWU203WW9yU1NRRHpXNFlpTjczNDM5eEozanJoSDdha2hqUXBRMzlH?=
 =?utf-8?B?WjB3VnliNDBBZ204R2RoUy84eGV3em03bjVkWnRMQUc2UEVPWCtaSVlWSWJQ?=
 =?utf-8?B?Ykl5b296MlI0ZkhDYnJhUEdvQndwVitwRFNDZ0hHOWJibytyR3RwQ3hLNlc3?=
 =?utf-8?B?SEROQ1YyVlFzVW9WbUp0dEFOZjVpaWovdGRxRGNVWVlhL3BwMk1CY0dhYUox?=
 =?utf-8?B?blQwaVc4UnBkS3VmMVJEdE5kbnhYaHlhYnArQVhhN2dBWGtRYnA2TDExQ09j?=
 =?utf-8?B?WXh4bjFjSVdNNXdpUVBKNE1CVmFHNjN5TGpDaDhab28vWlBFL0ZNSEk3eVYz?=
 =?utf-8?B?N3ZJZFRhbEpzeW1MeExPMWxMZFF0aEQrS1Fqb1J1YVB4WFBCbEx2dHhpT2FD?=
 =?utf-8?B?NGwyQ0xBa0tQbkIzcHFCV0hIVTNXdmZoUUZmQ3hqbDV1aHZNL0VLUURLNnU3?=
 =?utf-8?B?UDZTbGNCem5iblpmQ08zVE5zMUNWZHZ6dDF1QzQxUkxQcTMzZUxOWjY0NURJ?=
 =?utf-8?B?U0krd3hmZHkwa0cvVitldERnZUd1ZkxLWWZSSnlrSEtYNEErYUZnSlpybUl0?=
 =?utf-8?B?L2VCdTNXRi9QczNKaG9WVUU0MTZmYlZ4SGxrYkNNT2d4TFA1Mk1rTW9mS1pU?=
 =?utf-8?B?OFVyUk9ONUxkL3ordk85MVNPTWVZdE5JN3d4WlR0Wkp3KzdiZ2I0bGN5aTFs?=
 =?utf-8?B?RHlKY2NXVzJyRlBKQmJZVFRkeFBHalJMTkR0K2tsZjkyRHRqSkVJRHpKZVBs?=
 =?utf-8?B?bjFmOWNpSGJ2bGFydlBNUTdzZTRsU2lZdXljeGFURVVlTkFRR3l1S3hsQnhv?=
 =?utf-8?B?R0VFTVdKM21XSC9kQTRSQzY4VzB3R1M3MkVFb0xrcW90OWg1VlkxZzJabzFy?=
 =?utf-8?B?dVBVdEoyUE00TGhDVWdsTXJ0QVNQRmpQWWxwNFNUUlN5YnU3M05Xem9Celox?=
 =?utf-8?B?Yi9pU2hqREx5OGtySnFRSG5PS2ZIamQ3enBjVFNwQUVMM3ZGN1JUOEk4Y0lr?=
 =?utf-8?B?ZW9kQlUyTTZlZzRMSmhZYzFGbHVkdVRsQlBZS2l6dERJbFNqNHgvZFpWeUhT?=
 =?utf-8?B?ZDk5NHNGcDJoNWFJbm5ybDJPZmY5VFRsdkxQVHdCZmEzTjc4Z0xPc0xGT2p2?=
 =?utf-8?B?cktjUk9ELzJCMjV1V1BWQ2VaK0ZWK2MwdklFZVplM1FSUEZaRS9JUGhEUER2?=
 =?utf-8?B?L2VlOWxDVzdjZXdVcUJVUWhLMFNHU253NkJyWFdnS2hNbHMwTnNKNzh5R1BY?=
 =?utf-8?B?eWFDQW1EaEdIZ00wSWRXbklNaHV3YUthdWw0S1VodUZZZjhna2hWSFV4cUx5?=
 =?utf-8?B?OE9zMnQ4blhGRDUzdXNuT216VXVyVE1RcVhHajhKSkdPbVNGMGNsL1ZSeUdL?=
 =?utf-8?B?L25RbjlTT0dITU1YRHdQR2JpcFI3NEhSdUhicUJnaDgzdzVHSnB6MWREZExu?=
 =?utf-8?B?d1VrTklaTnIxRThkcVhUaVJDZ2pnYzlvMWF6S1lLdkJqVWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhoUk1SUjJYa2o1SnVreGlkRFlHc3VxNHJ5NW5CT0lsODc2bUp4ZW0ySmdR?=
 =?utf-8?B?Z09Mb0tuU2N3bDNNZ3U3M2xSUlR6N1NPTzVuTWM1MU5HMlVUYW4xRVZtY0VI?=
 =?utf-8?B?RW0zTFd6dStiTS8wTVdWdkVGa29IUFJsUVlrb0NXK1pVbU5XMytDeUlqSHJy?=
 =?utf-8?B?Tm9pZUk4VUxUMklTL25NVVErN2U5UVpoTXlsbzlZTE9yelZMZkZyY05sVzBL?=
 =?utf-8?B?cFNEcjA2d0g2aG5HeFhYMXRiR2trTHc1WDArU1Q4RC9Id0tlbU5OUFRWbmhi?=
 =?utf-8?B?bVZ4UGRlelVZaGJlOEhFTzdDZGRQSDFmNHpFVysyLzBLT2hMdUM0NWMyL2pp?=
 =?utf-8?B?cUhQU2ZibFRrMGtTU0RGbllCcUMrdkxHekh4a3I3M0FBN1Z1L0czajE3Vmth?=
 =?utf-8?B?a3pydjFsbmlhRWlWOUpzTE5xbFF2UmVNL01NOFlneVpTWDV4U2hHWjVFUWt5?=
 =?utf-8?B?cDlYS3Ura0lRTE1iak9RZEtCaFZnNWdRYURMdVJiUkdKenBQTTN1SU9GOFNj?=
 =?utf-8?B?UWp6a3duc29iM1pQVVhqcFB3L2tUVFNRVW9CK0czTmlnVUl5aHk0RGZ5N0FJ?=
 =?utf-8?B?U1IrVkZuR2Z6eFpSTXFZWi9pU0NDeFVRMkFGMm53Mm96c3QyRzBVMDlyWmVw?=
 =?utf-8?B?TEVTRGcvdHNjVTh0MDhUZGRoekxqajBwMW43a0lEVHh5MEhwMEMyMFVXZGZv?=
 =?utf-8?B?MWR4N3h4UGpONmd5YXVkelhHK2hkTmNyNWQ5ejBDWTAzWUpTSXVmakdJb0RR?=
 =?utf-8?B?RmpLSTA2TXZhbldxWmFqZCtwdW5ZaDdJTEJhRUlCaTB1WW5ZZE4vOWlIUlhs?=
 =?utf-8?B?STJaNUcyc3pTbTlpMTBXdmEyTkdHb3pZdEViOUhvOTlGUjJvSGUzekFycEVG?=
 =?utf-8?B?RW5MaWhvcjlxSThBM0VYKzlOUVRMc091b054Q1dkSFg5SkVidHpyVEtTckds?=
 =?utf-8?B?SlFldFl4VmpMR2QzbzlScWpKaVZFLytzTHQwRUs5aU9XRzNUQ3hFbGpTQVBk?=
 =?utf-8?B?bXVNNmNrb3FtZnJ6a0dzYUt0dk9MWXVrbUtVQmFUQ21QeVQ4UDNhT1JJWkVQ?=
 =?utf-8?B?T1JFWW9DQXAxc3o2TkdHaFl4a2V3Yi9VazVEZHNpVk5iTlJyaU1NLzVkNHRC?=
 =?utf-8?B?VWkva2p1OTVFUzExVjhVWXpIWlprdzhJbTc0TVphRFJ6MFQ0NTRqQWZNOWpT?=
 =?utf-8?B?V1BYRElTbWdGbGg1WWJZNm5DaXViMDFIRjRuamUrdDRpSWltMjFNSUxRTlBy?=
 =?utf-8?B?eHRTRXhXVFU3VTNneEMvYzV1dnBEY1dYVG1MWm83bHJhMXdxbENGcXBPUHM2?=
 =?utf-8?B?bDF2L0tweE9CcTVpOFJMcjRINUlMK3M5MGVUZTlMM2taQlNoeDAzNk5EOEsr?=
 =?utf-8?B?QUs0ZjRTZzdKeklMWVFybkwwQmlCYWZuZ3RINmVrdktTTHh3cXVTRDlmdmtH?=
 =?utf-8?B?dlVWRG9mZkMxSlZHMDJGNWtaVUc4QmgwL2lZVE9WdHk0MFJFRENnNk5QWGVU?=
 =?utf-8?B?Q29OSEFFRTJPbnprTFNwOFY3WnI3cDhibjB1cUVYcytnWFdvTm9FSTdQbVBw?=
 =?utf-8?B?SUZrWXBnWGUvanhvZGF4RTA2RmlPM1paeG12ZGVoTFk5aGxCWHBWWXRMeWk0?=
 =?utf-8?B?K3NNdWY1ZGdQUmM5Qi9aOEhzNW1xRzBiL2ZPUGdJTitidUYzcm00eUtVQm5H?=
 =?utf-8?B?aW5ZQ3lwWVdwbVJrRUFPL3gyRVRpZ0hFMktnNkJTRUFhdEQ5MGt5eThGQmxk?=
 =?utf-8?B?NVl5ZjY2bU50OEFpMjZIeXpNTEpSKzBuRHZ4VU5CVTVRRjBESWJmOElIZXFu?=
 =?utf-8?B?MDU0czZuZHJFMVlNaGYza1lDRFYxNzRnTDQrVVFObDBKNkJsam96c1AyNDNn?=
 =?utf-8?B?ZjlMRmlVQTgxcDhCMUpqRE10V0FBNXRDMk5NQzQ1YzN4dXo4NDZDQjFncXkz?=
 =?utf-8?B?KzQ1MlRLdW1pNERweG1za3A2dEYzdlh1ODkyRDd0QjJyenhVMVk3Y1F6VzZt?=
 =?utf-8?B?SWthVGFiOFJvV0xqU2tDMS9MUVhKbWRFWWlmUmlrNDlFVktjU0ZvcUF2blR1?=
 =?utf-8?B?ekFnU0ptZldjaThJYXhKYWk4d2Z5dEV5T05BN2FkTjVqYjRJRUJvcHhOQ2Yx?=
 =?utf-8?B?NENsTXJ1WVZJWWtEMmM1VXdCWXk5ZHQrL21yMDVXOWh6cG1tY0J0WENUSWVK?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cd1b8f-51d5-4650-85a6-08de175e8dd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 02:46:40.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztkUSCguBA1RWj6yefZXQZ8EYhBgcVMrPgkfj4hjhlSbt1SqYcg3boDpwn2WkHuDjJsN5dBOq42jmiWTOEZ3ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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

On Wed, Oct 29, 2025 at 03:49:47PM +0100, Thomas Hellström wrote:
> On Tue, 2025-10-28 at 17:46 -0700, Matthew Brost wrote:
> > On Sat, Oct 25, 2025 at 02:04:00PM +0200, Thomas Hellström wrote:
> > > Even if the drm_pagemap provider has released its reference on
> > > the drm_pagemap, references may be held by still active pages.
> > > Ensure that we hold a reference on the provider drm device and
> > > modules for as long as we might need to use the drm_pagemap ops.
> > > 
> > 
> > Just to make sure I’m understanding this correctly — this is intended
> > to
> > guard against the devm action [1] running while a device is still
> > holding references to another device’s pages, right?
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v6.17.5/source/kernel/resource.c#L1993
> 
> Actually removing the dev_pagemap and its region is allowed while
> another device holds a reference on the *drm_pagemap*. For example if
> you have two devices. Device 0 executes from the memory of device 1.
> Suddenly you feel like offlining / unbinding device 1. When you execute
> unbind, the driver evicts all SVM bos and thereby frees all device-
> private pages. But device 0 still has a reference to the drm_pagemap,
> even if it's unusable: Any VRAM migration trying to use the drm_pagemap
> will error with -ENODEV, so depending on how the driver handles that,
> it will continue executing out of another memory region. At this point
> it would've been possible without this code to rmmod the drm_pagemap
> provider device module, and its drm device would've been freed without
> this code, and when drm_pagemap_put() eventually is called, things go
> boom. So the commit message is a bit misleading.
> 
> In the case where we only have pages left, the last page should be
> freed from the device remove callback where bos are evicted. At that
> point, the provider drm device is still alive as the devm callbacks
> haven't executed yet. Also a rmmod wold typically cause the devm
> callbacks to execute so that should also be safe without this patch. At
> least if the page freeing doesn't trigger any async callbacks that
> aren't waited on before removal.
> 

I believe I get it...

> So yeah, I need to update the commit message a bit. We should also
> craft an IGT that unbinds device 1 while device 0 is executing out of
> its memory and verify that execution completes with correct results
> anyway.
> 

Yes, this is weird corner we certainly should test out.

Matt

> /Thomas
> 
> 
> > 
> > > Note that in theory, the drm_gpusvm_helper module may be unloaded
> > > as soon as the final module_put() of the provider driver module is
> > > executed, so we need to add a module_exit() function that waits
> > > for the work item executing the module_put() has completed.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_pagemap.c | 101
> > > ++++++++++++++++++++++++++++++++--
> > >  drivers/gpu/drm/xe/xe_svm.c   |  15 ++++-
> > >  include/drm/drm_pagemap.h     |  10 +++-
> > >  3 files changed, 117 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > index 173b3ecb07d5..fb18a80d6a1c 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/pagemap.h>
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_pagemap.h>
> > > +#include <drm/drm_print.h>
> > >  
> > >  /**
> > >   * DOC: Overview
> > > @@ -544,16 +545,92 @@ static int
> > > drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > >  	return -ENOMEM;
> > >  }
> > >  
> > > +static void drm_pagemap_dev_unhold_work(struct work_struct *work);
> > > +static LLIST_HEAD(drm_pagemap_unhold_list);
> > > +static DECLARE_WORK(drm_pagemap_work,
> > > drm_pagemap_dev_unhold_work);
> > > +
> > > +/**
> > > + * struct drm_pagemap_dev_hold - Struct to aid in drm_device
> > > release.
> > > + * @link: Link into drm_pagemap_unhold_list for deferred reference
> > > releases.
> > > + * @drm: drm device to put.
> > > + *
> > > + * When a struct drm_pagemap is released, we also need to release
> > > the
> > > + * reference it holds on the drm device. However, typically that
> > > needs
> > > + * to be done separately from a system-wide workqueue.
> > > + * Each time a struct drm_pagemap is initialized
> > > + * (or re-initialized if cached) therefore allocate a separate
> > > + * drm_pagemap_dev_hold item, from which we put the drm device and
> > > + * associated module.
> > > + */
> > > +struct drm_pagemap_dev_hold {
> > > +	struct llist_node link;
> > > +	struct drm_device *drm;
> > > +};
> > > +
> > >  static void drm_pagemap_release(struct kref *ref)
> > >  {
> > >  	struct drm_pagemap *dpagemap = container_of(ref,
> > > typeof(*dpagemap), ref);
> > > -
> > > +	struct drm_pagemap_dev_hold *dev_hold = dpagemap-
> > > >dev_hold;
> > > +
> > > +	/*
> > > +	 * We know the pagemap provider is alive at this point,
> > > since
> > > +	 * the struct drm_pagemap_dev_hold holds a reference to
> > > the
> > > +	 * pagemap provider drm_device and its module.
> > > +	 */
> > > +	dpagemap->dev_hold = NULL;
> > >  	kfree(dpagemap);
> > > +	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> > > +	schedule_work(&drm_pagemap_work);
> > > +	/*
> > > +	 * Here, either the provider device is still alive, since
> > > if called from
> > > +	 * page_free(), the caller is holding a reference on the
> > > dev_pagemap,
> > > +	 * or if called from drm_pagemap_put(), the direct caller
> > > is still alive.
> > > +	 * This ensures we can't race with THIS module unload.
> > > +	 */
> > > +}
> > > +
> > > +static void drm_pagemap_dev_unhold_work(struct work_struct *work)
> > > +{
> > > +	struct llist_node *node =
> > > llist_del_all(&drm_pagemap_unhold_list);
> > > +	struct drm_pagemap_dev_hold *dev_hold, *next;
> > > +
> > > +	/*
> > > +	 * Deferred release of drm_pagemap provider device and
> > > module.
> > > +	 * THIS module is kept alive during the release by the
> > > +	 * flush_work() in the drm_pagemap_exit() function.
> > > +	 */
> > > +	llist_for_each_entry_safe(dev_hold, next, node, link) {
> > > +		struct drm_device *drm = dev_hold->drm;
> > > +		struct module *module = drm->driver->fops->owner;
> > > +
> > > +		drm_dbg(drm, "Releasing reference on provider
> > > device and module.\n");
> > > +		drm_dev_put(drm);
> > > +		module_put(module);
> > > +		kfree(dev_hold);
> > > +	}
> > > +}
> > > +
> > > +static struct drm_pagemap_dev_hold *
> > > +drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
> > > +{
> > > +	struct drm_pagemap_dev_hold *dev_hold;
> > > +	struct drm_device *drm = dpagemap->drm;
> > > +
> > > +	dev_hold = kzalloc(sizeof(*dev_hold), GFP_KERNEL);
> > > +	if (!dev_hold)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	init_llist_node(&dev_hold->link);
> > > +	dev_hold->drm = drm;
> > > +	(void)try_module_get(drm->driver->fops->owner);
> > > +	drm_dev_get(drm);
> > > +
> > > +	return dev_hold;
> > >  }
> > >  
> > >  /**
> > >   * drm_pagemap_create() - Create a struct drm_pagemap.
> > > - * @dev: Pointer to a struct device providing the device-private
> > > memory.
> > > + * @drm: Pointer to a struct drm_device providing the device-
> > > private memory.
> > >   * @pagemap: Pointer to a pre-setup struct dev_pagemap providing
> > > the struct pages.
> > >   * @ops: Pointer to the struct drm_pagemap_ops.
> > >   *
> > > @@ -563,20 +640,28 @@ static void drm_pagemap_release(struct kref
> > > *ref)
> > >   * Error pointer on error.
> > >   */
> > >  struct drm_pagemap *
> > > -drm_pagemap_create(struct device *dev,
> > > +drm_pagemap_create(struct drm_device *drm,
> > >  		   struct dev_pagemap *pagemap,
> > >  		   const struct drm_pagemap_ops *ops)
> > >  {
> > >  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap),
> > > GFP_KERNEL);
> > > +	struct drm_pagemap_dev_hold *dev_hold;
> > >  
> > >  	if (!dpagemap)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > >  	kref_init(&dpagemap->ref);
> > > -	dpagemap->dev = dev;
> > > +	dpagemap->drm = drm;
> > >  	dpagemap->ops = ops;
> > >  	dpagemap->pagemap = pagemap;
> > >  
> > > +	dev_hold = drm_pagemap_dev_hold(dpagemap);
> > > +	if (IS_ERR(dev_hold)) {
> > > +		kfree(dpagemap);
> > > +		return ERR_CAST(dev_hold);
> > > +	}
> > > +	dpagemap->dev_hold = dev_hold;
> > > +
> > >  	return dpagemap;
> > >  }
> > >  EXPORT_SYMBOL(drm_pagemap_create);
> > > @@ -937,3 +1022,11 @@ int drm_pagemap_populate_mm(struct
> > > drm_pagemap *dpagemap,
> > >  	return err;
> > >  }
> > >  EXPORT_SYMBOL(drm_pagemap_populate_mm);
> > > +
> > > +static void drm_pagemap_exit(void)
> > > +{
> > > +	flush_work(&drm_pagemap_work);
> > > +	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
> > > +		disable_work_sync(&drm_pagemap_work);
> > > +}
> > > +module_exit(drm_pagemap_exit);
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 6d2c6c144315..f6ee22da2e95 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -1437,7 +1437,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> > > *dpagemap,
> > >  			  unsigned int order,
> > >  			  enum dma_data_direction dir)
> > >  {
> > > -	struct device *pgmap_dev = dpagemap->dev;
> > > +	struct device *pgmap_dev = dpagemap->drm->dev;
> > >  	enum drm_interconnect_protocol prot;
> > >  	dma_addr_t addr;
> > >  
> > > @@ -1457,6 +1457,14 @@ static const struct drm_pagemap_ops
> > > xe_drm_pagemap_ops = {
> > >  	.populate_mm = xe_drm_pagemap_populate_mm,
> > >  };
> > >  
> > > +static void xe_devm_release(void *data)
> > > +{
> > > +	struct xe_vram_region *vr = data;
> > > +
> > > +	drm_pagemap_put(vr->dpagemap);
> > > +	vr->dpagemap = NULL;
> > > +}
> > > +
> > >  /**
> > >   * xe_devm_add: Remap and provide memmap backing for device memory
> > >   * @tile: tile that the memory region belongs to
> > > @@ -1482,7 +1490,7 @@ int xe_devm_add(struct xe_tile *tile, struct
> > > xe_vram_region *vr)
> > >  		return ret;
> > >  	}
> > >  
> > > -	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> > > +	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
> > >  					  &xe_drm_pagemap_ops);
> > >  	if (IS_ERR(vr->dpagemap)) {
> > >  		drm_err(&xe->drm, "Failed to create drm_pagemap
> > > tile %d memory: %pe\n",
> > > @@ -1490,6 +1498,9 @@ int xe_devm_add(struct xe_tile *tile, struct
> > > xe_vram_region *vr)
> > >  		ret = PTR_ERR(vr->dpagemap);
> > >  		goto out_no_dpagemap;
> > >  	}
> > > +	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
> > > +	if (ret)
> > > +		goto out_no_dpagemap;
> > 
> > I mentioned this in first patch that this was missing, maybe move
> > this
> > part to the first patch even though this will get removed a bit
> > later.
> > 
> > Matt
> > 
> > >  
> > >  	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> > >  	vr->pagemap.range.start = res->start;
> > > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > > index 2c7de928865b..5cfe54331ba7 100644
> > > --- a/include/drm/drm_pagemap.h
> > > +++ b/include/drm/drm_pagemap.h
> > > @@ -9,6 +9,7 @@
> > >  #define NR_PAGES(order) (1U << (order))
> > >  
> > >  struct drm_pagemap;
> > > +struct drm_pagemap_dev_hold;
> > >  struct drm_pagemap_zdd;
> > >  struct device;
> > >  
> > > @@ -130,14 +131,17 @@ struct drm_pagemap_ops {
> > >   * used for device p2p handshaking.
> > >   * @ops: The struct drm_pagemap_ops.
> > >   * @ref: Reference count.
> > > - * @dev: The struct drevice owning the device-private memory.
> > > + * @drm: The struct drm device owning the device-private memory.
> > >   * @pagemap: Pointer to the underlying dev_pagemap.
> > > + * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> > > + * device referencing.
> > >   */
> > >  struct drm_pagemap {
> > >  	const struct drm_pagemap_ops *ops;
> > >  	struct kref ref;
> > > -	struct device *dev;
> > > +	struct drm_device *drm;
> > >  	struct dev_pagemap *pagemap;
> > > +	struct drm_pagemap_dev_hold *dev_hold;
> > >  };
> > >  
> > >  struct drm_pagemap_devmem;
> > > @@ -206,7 +210,7 @@ struct drm_pagemap_devmem_ops {
> > >  			   unsigned long npages);
> > >  };
> > >  
> > > -struct drm_pagemap *drm_pagemap_create(struct device *dev,
> > > +struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
> > >  				       struct dev_pagemap
> > > *pagemap,
> > >  				       const struct
> > > drm_pagemap_ops *ops);
> > >  
> > > -- 
> > > 2.51.0
> > > 
> 
