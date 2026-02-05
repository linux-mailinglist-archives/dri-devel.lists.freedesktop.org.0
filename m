Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJOFAHithGk14QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:47:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB89F4381
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7010E8F2;
	Thu,  5 Feb 2026 14:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyLbnwjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBD210E8F0;
 Thu,  5 Feb 2026 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770302835; x=1801838835;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=P654Ap3vAcra+3xMZjm33EN4Dm/GUjHY4KWFVCD/6p8=;
 b=IyLbnwjOGEEEqUk5mV99HuP6Y90W5kpnLUh9MQtfKb6NsTrDjGQFSP8s
 UXahAK50Z80rzy/4sEroeNBuYmZv0vhgKQds62NJogrpLReWOhRjd7j9Q
 KS3KLik071yswXVHyCiwCgFClgxzlGQzYU5ib547ZEI7BRwDlxirXM63Y
 7GQR0BMMYzD+4Msapqre1+jjk/aHnJASR4Xc52USIz1/2RFgNv6TVTOQY
 CPez2GI4+0johxlD3V+QqwQltrIzkevbBJpp1WuAqCusF0ivCVnhu2flX
 t7+i2nWsEFFYyVAZwO0FZK9wO7VBMwkfJ646M6xHnFCxNuT1RK14vifWU w==;
X-CSE-ConnectionGUID: ZMn3aXZkQgCkqxgNLcIrWg==
X-CSE-MsgGUID: CKRwvNreToiiadetUOEt+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71395390"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71395390"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:47:14 -0800
X-CSE-ConnectionGUID: 2IYxOIR+SiOoDuN/4iwShw==
X-CSE-MsgGUID: QmAv3i+4RZ6rieFbplM27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210353666"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:47:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 06:47:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 06:47:13 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 06:47:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkFeF7tmDZegDDpTQRyYFA3B80XN8YCfUSlBboCEQAzAlQmLK27KWuzaZun9OpqUw3Ar9CSVBA1pOKSPuL37mcOAY8BSRrtYGtlG4BP1bs6eWIF22epF7tsgl5i9q5XaaVOlLtwl4usqsmFy3s1zwfuXnYETvD1LBBYk95xEwe9Y3H0bBjOEpI5AL0r5SlCtY26+VFqB8qnyZr3t31wkkTaYRe/WNH5kmOVrRj4eZ0P3WKxuEA2ZNTBpSrwdnGDk3Zrr1uGKoUCxwVKPJi0oL3Y8cVYxAogRmfjMgtv9u7LUAuSVNG2opVWFdOqfuOi15EGltLLxtSo8tU+CNTVStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv7xUmZZvIbwg6pg5XWHLnOECwUa6D819bvmBpdkwrc=;
 b=BJEU/tLU88lLwD8ukV64UeAFO9OWiPhJZA5u8GEodqW4OiBHkj2UpLH5+8lqR2pQLM9CmQAC3eayEU1W8c04DFY2dWBntbdSqOlw1MRf/R+Fql4HodDPhb8kyAP5g6bRmakh1x8iAl0eHbLbJAcmH1i9vTKBzozJKQ4Xk5rF0r2V2VyTmdyI4oTXpJiccpQ4vqe+w7FffGtImEkFNobFpuWga7ENDLeVSvZqEHQ9hVH5KQFZRgWr0SuqqVfdoCkhOCOqDd/Nr5cd3aCJ468BBX8B8vVfFwBvoTn1Rr7tiojSOCE6UUDQ326YTnV2+ms2GVot8C0Y5J6jnhRSH1W+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 14:47:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:47:10 +0000
Date: Thu, 5 Feb 2026 09:47:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aYStaLZVJWwKCDZt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4fff83-6d82-468c-b665-08de64c570fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?raJ6P1O2o91sWwuekx5feA/D3wsGvPbDVzrx1hbyp/7lfXqq02pJGRHTEEVm?=
 =?us-ascii?Q?hgPvt289kxxSwbe07iO7lZhI2uoX+2jCspKjdtX7lP5c+jYRktJnCoG2F4bh?=
 =?us-ascii?Q?RHm8XdN/rdjSNDpqst1IyX6clA6q8abrSZF3V8PqGBG4kLAUsDEr38PFI9Gh?=
 =?us-ascii?Q?0dGoe0uDuR7xJYoaREtw6vvhbvtOLZwIGZhBylescPwypRBqlSm5oxhbx7EW?=
 =?us-ascii?Q?SK4kqs//cmsUTcvyNGnfA7szilxw+vZ0bDLDoYZurkvRPZujMg0nGH1Vxxuq?=
 =?us-ascii?Q?+jpM/ypW6Q/v+IcHP/fvt2KGROFac5rHfM83TqZL1HpyGHe1XkoK2xZFwggj?=
 =?us-ascii?Q?3diOm/+k3tiHvP53+SOCLUejvUz9AUDdYWvBXVIY1eZHSYrzgootbsAKeWkQ?=
 =?us-ascii?Q?QYp2wg1gipEiuSRwWGGFOGEyUyes1pOM2UjeJkckZm9gjMBwEiTZ2At/kT72?=
 =?us-ascii?Q?7106J1bn3A9WkoH3iIPaeIiyLczbGaO00gCe8FWG/SuvXBp7U+iOA8a8UzyY?=
 =?us-ascii?Q?tmgDf+oWvznsvrJNRCdYojnLVuKBqOZxZtN9SM8dvnky+EHxBjP3NVBYUbsc?=
 =?us-ascii?Q?MaM9ceK68s9Ei4PmpDTs4LmtLvC+OdUo9jJBTjPT5Ryik1E1JCUvoJEdNNSo?=
 =?us-ascii?Q?HTD68+W5s3PCrI+kpmUYex5rQ1UULZAFv3iVWOibzEsAJuKQUFyBdEdmlcrh?=
 =?us-ascii?Q?+Tq4+RieH/1tBs0bWMIPbnCCQNYHq6WGOIpeBgzyUFipZAApo5rGPDXs9/XH?=
 =?us-ascii?Q?GSjitLTkkCk2432646BM8nOFPtJeV8Vsa1ncbkFbFsrYhKD7Lz1wAqZgp98t?=
 =?us-ascii?Q?8nfcZxVmcYY6Mq/7ZEMl3evXDXCjd+mTObMFZ/wN15lvRiGQuOsxfLJyV182?=
 =?us-ascii?Q?iFTrdRY5xuSwjm0PEDFiwWkIyCY+v45U79gwuTVPxGOeXxWDs3gF4Z0RFK6w?=
 =?us-ascii?Q?UWLzieD6IxhgKeIDzcK8CKdlaUypYpbA8SoUBIW26h9AeRpCU7oq1X4a/dWM?=
 =?us-ascii?Q?BkwmHIpG9Po9V+84syHOYTsJ8u8M5jCK8Ff8LrLNG0ncXwxuJ/q8k1DciPKa?=
 =?us-ascii?Q?giYTCasLZ6cjMNsEC+gPxdnsn8DVCuM8WK8B4K4MeQxvbtPF9YZ48eDURIuu?=
 =?us-ascii?Q?Lp3jFc5ffrcawCIqRG9hr0+MFQdGie3Stp3RwM6cB/KVJLknLClO4Zq0NCHL?=
 =?us-ascii?Q?Oe+mE/2oqLHQIGAyt80x2RLNYxECcB202vki6hUvKAdrkfauI/3JT9vXgAH7?=
 =?us-ascii?Q?MH9+5H5RT3kjPa7V/XQAQqHr/c8Y+OokjN7zGn8IXzUAYL8Lmd4QqFgdU+ys?=
 =?us-ascii?Q?DXypqzyCD5FfgqqlRxpMwXDL9aXOLUUmS1CM03lOYQMVn6d2pPNvv8XZqjhS?=
 =?us-ascii?Q?mcWKSoLszWmjPjE0xlcKJFArKQ9HQQfLT+QZpJKAugV6ZmF8fjuLIUA9Ed+2?=
 =?us-ascii?Q?dW9npXAvZFvAi4rxCCswZtKSHT20Z27SolXEZ6X4HJU/LnmvWzLMPkg+xRur?=
 =?us-ascii?Q?862O0sajw7qp+rbeQXoRTB8JXAyBD8nWp8C8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?48fFDdy//IIpXg6Balyh73CpD50sAjID+OSUExENJ5zsUtplM6m9RDFhYz3l?=
 =?us-ascii?Q?7ncV6QVdfy87yHYQMd0nddNIi25s2omLAGd/grmYCEipRlpD1MZzKiOFwmIv?=
 =?us-ascii?Q?9DSJzTGIamw7escHU44YFllKZt4mgHoZUrs4LK6/fETAz5IjJgsFGwZUmhsS?=
 =?us-ascii?Q?dWmzUXAEv/FtPkU4UB7+jzv99Tv5QamQeiglFauWf3XjLUivUf2IC+4yaJVB?=
 =?us-ascii?Q?beX4NyjNBHqwIIEdsiChlHO4sWwpU86EPalshEZluefhuv2ymojPexMPIr/V?=
 =?us-ascii?Q?VjaZ9TXnkgTtA4oI9KiMwKXcIAqgrJqEGfsi+wHEnGrMLtFSlVN/kfYikoPf?=
 =?us-ascii?Q?r3Twra9QPzcvn1Eig5LsFEMPFBRVKQXm0faacbY2W0nr4NJxMzOskNK2N1dS?=
 =?us-ascii?Q?gou7k0RYz9eqvalx9rS1JC7WW26Kzwg0l0roOzyWeaDfD0sKKnpO7RGQ2aB7?=
 =?us-ascii?Q?6xbea/KYzOfIUjvmjE51x5vAiAVyXuZLS84vFFLdU4o0Ru3h/geo+HvlfvDo?=
 =?us-ascii?Q?qOfupNFUO/b3OnDY/gmYco7Wzae/DuEDTbhnHo2i4bCaDpfX8BCamCE/x4bI?=
 =?us-ascii?Q?hc/LPG1yk+V0E9CA+25jrKYbG3rAELC8kSsTreppZi8qrsiYl26GvEqZqrRX?=
 =?us-ascii?Q?Pgfcy20GswS7+wRyFpedVu4NRSv4K72qXSyg/HkGIo4NTFZ18toHR9pappVd?=
 =?us-ascii?Q?hO8GOOz+q63bsfrlEFligPa63QlZ0TGutVHJq0idP9HcOzQXyge4M37TGGBD?=
 =?us-ascii?Q?BkK5PZED8lHzEbpS/qKUamlcGPltz1TJQcRyq1XlXcYnDExHS5xwllE1qF8s?=
 =?us-ascii?Q?pkGtHeqCdwaU1+zsvTcqvaLqBJ5YfBAAxdlseH/smZbx+071rohkjAq9+4o2?=
 =?us-ascii?Q?uGaqvivDH8tltQvd0tmou5bjvojSRyNI7IRgOysdTw7gpEkyvlBX8/AA1OZw?=
 =?us-ascii?Q?XshON0InQ5AxSAL+eLIA3uYPadD8QRPDveTe7DiYeWKlUmbJ//EjvbROIqi4?=
 =?us-ascii?Q?OgRW9d0rHKmDQU2DDbD0dW+M8bm2Vm3+u26h/ubz68wmIT46IMkWCNE4Zwxn?=
 =?us-ascii?Q?daBGb6ZGxv1WTvzBQA1H9Sr+eutjnhQM9n0RIR5b2F/bRen+GAVqtuT+Q+jj?=
 =?us-ascii?Q?hgCBQty6cy9PLd53+Fgwk+b4JE55fTyL6kh2YkXxkhSqU9DTVD7Fa0bl+7Pz?=
 =?us-ascii?Q?l2Nr/rsGYAmp4Enw3U1ZoesYQR6nNZ7a0pqQbZrGjbF3aiUaAVvuvUGDCZA3?=
 =?us-ascii?Q?tDb+bVAHB/HO9C8q3c+5Dzc1ZdpVqSlvX3+4pNaoZh1s2JxARN/UsIo9lHGG?=
 =?us-ascii?Q?oohS9OpuaoEq0pYBYtMUOImy9WJnNB/jWlEtVJvK85RyvUf8ZrxBDRMrCzQU?=
 =?us-ascii?Q?JnpXJw6bgqCVQScsgwO2klxMBOQM1NXTJlaaC7pcnJuzP1Uia20Aa3+k8fR3?=
 =?us-ascii?Q?qRlfc/jT7w4eS4b24pFpnkk3TmupAvtbub0Um4GSybFIsD3dqfJKNAsKIFeE?=
 =?us-ascii?Q?ivvLl7zHrGZpEq5QLHTaPGJ4dl6mGITrDpZGzDGrUy0dlCA4q924fHHNRODO?=
 =?us-ascii?Q?6/8pbaCiKH8iLEsFdaCRj6eLnlOFbfWe+mBDEMVoC/sh2puE6O6/HrF1GEjo?=
 =?us-ascii?Q?cirsjWKicb//nkK9p+EMW8yojrxmOeFrWJPKdPrzsxU6O6fJwaEErtVN3Wli?=
 =?us-ascii?Q?qYIPcBrbHSJLU2QoqM5DOm7DVT2UqJrwl8S+LUYHNE48CZcXiKCZuB9X0ybu?=
 =?us-ascii?Q?MtL9JTs54g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4fff83-6d82-468c-b665-08de64c570fb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:47:10.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UJXXRVaslldOUqRp3vqmCWD5xLK3voietzqnUR/WBQ73IFi14xdKbFuukfDmc/g7JS0KVI4RqlRWTj9tXfYgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8EB89F4381
X-Rspamd-Action: no action

Hi Dave and Sima,

Here goes our drm-xe-next-fixes for this round.
Mostly kernel-doc fixes, plus a debugfs, plus
the re-enabling of D3Cold on BMG in general.

Thanks,
Rodrigo.

drm-xe-next-fixes-2026-02-05:
- Fix CFI violation in debugfs access (Daniele)
- Kernel-doc fixes (Chaitanya, Shuicheng)
- Disable D3Cold for BMG only on specific platforms (Karthik)
The following changes since commit 3cc9398a9ea69b77de01b370463b706c354e52fb:

  Merge tag 'exynos-drm-next-for-v6.20' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2026-02-02 11:17:12 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2026-02-05

for you to fetch changes up to 666c654a5ae4090a3402ac14f399283934ea8104:

  drm/xe/pm: Disable D3Cold for BMG only on specific platforms (2026-02-05 08:03:58 -0500)

----------------------------------------------------------------
- Fix CFI violation in debugfs access (Daniele)
- Kernel-doc fixes (Chaitanya, Shuicheng)
- Disable D3Cold for BMG only on specific platforms (Karthik)

----------------------------------------------------------------
Chaitanya Kumar Borah (1):
      drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI header

Daniele Ceraolo Spurio (1):
      drm/xe/guc: Fix CFI violation in debugfs access.

Karthik Poosa (1):
      drm/xe/pm: Disable D3Cold for BMG only on specific platforms

Shuicheng Lin (4):
      drm/xe/query: Fix topology query pointer advance
      drm/xe: Fix kerneldoc for xe_migrate_exec_queue
      drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
      drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                |  6 ++++--
 drivers/gpu/drm/xe/xe_guc.h                |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_query.c              |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c          |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c      |  2 +-
 8 files changed, 20 insertions(+), 11 deletions(-)
