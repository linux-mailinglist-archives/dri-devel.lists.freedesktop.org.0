Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA0A4A704
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728810E094;
	Sat,  1 Mar 2025 00:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enbj7JYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C6510E094;
 Sat,  1 Mar 2025 00:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740789309; x=1772325309;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N41ObMY5jhEF3ULdV/M+/XJ3Y0ctSllSi3eSMSYs898=;
 b=enbj7JYy/ghUlWnsurr1Eef+JecKIdj8a+ZFNOAIh96if7m8YyqpwOKN
 18J+KbtHOmxbGvpjPiS4+kKU5E3b50rBfWH+TWiBk8Oafg2mBDoJJGcje
 yIaM9Kqmr3JXt89fU8N4FR/KZF6R3OMRQQMqTAaEaVdf2NXEXlMsH/9Y2
 U2NG4i7SDWr9sFHPfUyWpUObdZ9bRnw/hLLBn3SCQIMqBSbkf9SiYmdDs
 nzkMbc0H6dvrg4GFq424avOq//ZTk1r8yVqhr2muvf+xVOWpznakYy4qo
 NpKUOuZZ1N8hWTPHT2JyBcHxv2OBcMHxC+xNUA7fWt7MrxwpcRxQp94n+ Q==;
X-CSE-ConnectionGUID: vxoqE5FYRd2iYdskn+WbcQ==
X-CSE-MsgGUID: I4cadSS7TuyU3MfdtWhpQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="44548624"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="44548624"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 16:35:08 -0800
X-CSE-ConnectionGUID: dgJ2rQ2uTDGoNQsUs9If6Q==
X-CSE-MsgGUID: SXBikqbBRDmQAFJv1CiSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="117668185"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 16:35:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 16:35:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 16:35:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 16:35:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m19/0So5XrJQofU6UF1gulq0B+i1ixZRsBgvsvcq1R5qj4n3cpmvsKyKI1INylqysEyMzjlijSUj/wgXtxaNPkq+OAB7iEyqHF19RsOnvAJcJUTBBM4t1XN+ItAubR+sPpzYfHV6hQUm67wW+C0eENdN/naBJ9Z1PNBwuZolGOiMs/TVHp5gcJQVlZMnolbHZtdOKj3XyjVwl8JI/L++40QijRBibVFdobSiPKLRm4Mb+WnS5sue+i38/kaMEhWFb3DtNqH/Mgs9d5DkMp4okK2kdjlDTD7WC6JpXwEiLKh4xond4YjEsRyScjfJTtCoj0T8m28vbLC4vvlMIAOQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuPezqVFWA3T0u7gp3To04ub6WubhuUjBXu/rFGA31w=;
 b=X5TKLG5c769Iylj17C3mPz0Ok1ztELcppUkF9uEF4xwTuHgG68gWYKcXy/sqNkdVo+16u+T8Uk/97tIaOow+ADtzX/dwlWhQnyRgZG+tu8ITck+YJhLAEpfr2de4YhvR0prToopdkH1h/GChq2Nlsn6apTqs5KZx+QzWdtcDJH1O2qNYkjqCeoVTMLtULxFkjy5IJEjqJwUxVWp6Ui9TI4j+iI+WNuRAnVWX78UX3552xbEWmWBDfZ7QJ6MQ+sICaxucRF7/ttSM4IWmq7GUdnuxCZ4jhanbyLC5Fq9rpugnfst1rqFqPhGU0iI/IvDazUlNDRTscJPmy8cdcUoevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Sat, 1 Mar
 2025 00:34:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 00:34:38 +0000
Date: Fri, 28 Feb 2025 16:35:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v6 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <Z8JWXk9GRlGciaDk@lstrano-desk.jf.intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-33-matthew.brost@intel.com>
 <cnt7o3wvgv37cfxsdothxv6agwi7nkqfqn37mafsyhl64h4lnv@rw7rbaha3au4>
 <Z8E9U7u8uV8rOlTO@lstrano-desk.jf.intel.com>
 <7vzwp4ouidxfoyu2qehkezy56tt52e4vjbthr6cc4ezr5iaw7b@plxyy7hf46dm>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7vzwp4ouidxfoyu2qehkezy56tt52e4vjbthr6cc4ezr5iaw7b@plxyy7hf46dm>
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: faca5437-9090-40d2-e6d4-08dd5858d923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlBjN3JKaGR5RlZrNjZyclhOU1c0dEJHdjdmejdOOEc3Wk1GWmZlYkw3RTM5?=
 =?utf-8?B?aHh6MEsrNjIydWgyWmJ3bXZCckhXNXRsNmd6VEZZM3ZXYW5waC9CSVAyaFVm?=
 =?utf-8?B?eEVvUHJUTXVIT1lnckliS2lpRUVDbEcxY3hMNHBOeHBDWm1RNDVHT3dMeEpL?=
 =?utf-8?B?clFsaHI3VW5oTXN5L1lRY25tWHJHRE1GQUNpWUFQelJwclNHbFAzVjBEc1Ry?=
 =?utf-8?B?aW9QQ0I3RFhiV2hKd0Vmc3lpaHNEVThlUmJtT2poc1I5UWlKc3lmVklSWHlX?=
 =?utf-8?B?VXJGZ3U1STd5UHI4Ym5vL2dRMHNkaGptYkJZRksrWm5oUVhudFlYalkrUmNN?=
 =?utf-8?B?dWRUVTVPTWh4YVY0ekQxNmJNSUl5eHROQmp2cUpmT3MyUmtRa014ZlV2dHZ1?=
 =?utf-8?B?ZmtJZ0laOUpBN1VaZzhOWkZUZG9zTWxGNWN0Vit2bGlBczlxYVE1YUtUWGxD?=
 =?utf-8?B?UXpNaVNzNW1hQkM3Q0pMRHk2YmR4Sm5BeVlOT0d3Y3cwYjNTME9vVFd6ZndX?=
 =?utf-8?B?M3NlUHpyWHl1RytzQ0lQaUNpYmdneGwxWGhtbkVhUHlUTG5NbjQ2c0RlTGRn?=
 =?utf-8?B?MTYzZm1LYTd5ZTU1bm44TTZOYlJvRVcxQ3cyL2JoNDBOZXpwVERDWFhoczVP?=
 =?utf-8?B?WEtJSVJQTzIvWVhVUHdoN3o3dUVxRmNKbERDWWo4YldVcnh6T1RzbElSWFJM?=
 =?utf-8?B?ZkE0K09BelpBaXJaL3VWdkE4QjJZcXlTSHZ4Wml5TFVUekVtcEN0Q25acVh0?=
 =?utf-8?B?QTNmZjdWRmRFWW1qd1lZTDBsZXl4dWZaSEsrTS9HYm1GK0EwVFNhNFZQZlNT?=
 =?utf-8?B?OEJ2eS9ZMzhWU21YWStPbHp2OXRiR0N5SGJrUEc4M1k4SGVoVUdUc250N2hC?=
 =?utf-8?B?OWVlTmJXQ1ZOOWZ3Y1ZPc2FiREJzUUd0YkVrbU95UGhPbDU1TXluQnFyQzdF?=
 =?utf-8?B?dlNES1J2VWVkeWp4UGVZVUc1Z2o3aURRMkdEcWtUR1pjMkdwcytYRnU0bGR6?=
 =?utf-8?B?WVNyQjYyWE9BSDJGMStNT3MvR2U0djJBdnBFR1YvQ0RiZzYxcGhvYXlnUVRk?=
 =?utf-8?B?d3hmV205RG8rcXY0cG9UUVYyc0tkZ0pZTDZlL0JTdGkzaDB1QkFwYjQxejhm?=
 =?utf-8?B?Wm54d1o4aW9jc210cXdvZDZ6U2pLdTlQODBYMlJXK2hINDRRUGpzWnZDblFK?=
 =?utf-8?B?QlM5KzJMS09mRXNycmhBSmZ4VXNVNm5uNVhxOVgyNjJqQ1Y2MjBUQisrZkxZ?=
 =?utf-8?B?WU5jd1Fyam9LbVBoeDZvS1RBRklBZkdrdC9ab0VNQzUvRTNGRDk1VHhINHhE?=
 =?utf-8?B?U0ZORW4vMHZjZ3R5dEt4VkF0QUgwQTVveTk4cmQyNWhIaXo2bENQcjNvOWJj?=
 =?utf-8?B?RC9ITG5qWk01bjh5bnhvZ3RuTG9HNStjMXB5RWpXZEorRTRUeG1TYTBUcENp?=
 =?utf-8?B?T01XelpJbEZMMnU1cjZoZmlTTWZsWDZ6eTNnTzhKSVN0eS9ybWtFTXB0VlBH?=
 =?utf-8?B?VzZ4aE5WZDVxQUMxY2Y5VVYyVENlVVA5TGF2MjFyekdPSzJBVW1OYldDb2xV?=
 =?utf-8?B?RXkxZFd3UjBYOE5md3lPbDMwYm45RWR6TVNqOHE3cWEyNy9aZUo5WGRpM3RR?=
 =?utf-8?B?ZTdlaTBWWklWRGY2dDN6aE1iN1cva3hZV3RsUjJRY3JJRnJoSGF3cG9CZ0t0?=
 =?utf-8?B?Qy8yNFBPVVdqOUVvL2hVOHpoZ0lRSWllYUE5ZGovM1N2NjBFMjdraEMrWHFG?=
 =?utf-8?B?REdCQ3g5QitMSUVtVDJ3M1BqZXJFSEthbUhrZ25OVFpjZTB0NHV5V0tDbnp0?=
 =?utf-8?B?dmRqRWw2MHM0OFFZblMxWHlCRUc2L1EvNWtZMWoxS1o5b0pkQXpQYk90NXRo?=
 =?utf-8?Q?2tl8NXh1kSVrH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZzcG5rcEtkRDNPbGxyR1F3ek04WjRBK3FaNlNkaFNFOXBMMmhLc2RuMVkv?=
 =?utf-8?B?WUpGNmxFRUhrK1UrcGFNWmttUHZua0JOa3pPVWhYN2E3UENsZC9oSDZ4NEFN?=
 =?utf-8?B?V2hyNkVXdXNscTB4VE5DakQ0cTV1WU5yVk1MdUk4L0ljcWNoTTBBUUdIS0l0?=
 =?utf-8?B?RGdnMlFobmh5MXJobjNwUVUwblVIaEI4bHBnRVhrUHVaTERrcUlkdWxzbFE3?=
 =?utf-8?B?dHJpSVg3ZUJJbjVrQXVnN0YzVDR4SVczdnV2NlhVbU00Uk5zaUhVWEdyVk5I?=
 =?utf-8?B?WUtCbmhkbXNwdDE2VVBmeWFWeWM3YittcWF1cmtuVFlRa2E1Mm5FeUo0OGhy?=
 =?utf-8?B?QmJsQk9HcFhnUFBJMkRUT3JTU3FhRXlXVld2YmUwbHBJSzNyU09ERjhwVkRC?=
 =?utf-8?B?dm04L2wrUEFpNjVuQnhWTXpqOWJ4eW5yL05IdTFiemNTRWI5UHJ1MTNqVVNk?=
 =?utf-8?B?ZGZ4RUR1NEFZMitNZ3hFekFNNEFJNXdyS05jdGhqd3lYNHoyU3lOakhlMU1C?=
 =?utf-8?B?eHloODA4dDY4bnY1ZlQrd1dwSlRFeEdhWVVrWE5Cb1BQbjJJVkFzSTZZZ0xC?=
 =?utf-8?B?Vm56VWFTVEJuNmk5eW1mS2JSZyt4SmFhTmNNSGwxdGdXQ0dobnpHTi9RSGtD?=
 =?utf-8?B?dC9aL2d1bStwVXRRSDkxdXpORUxKaWIxRXh1bkExY0lMcU1xRFdMS1Q2YjBj?=
 =?utf-8?B?UHk4OVAzZmhDTENvWWJScnMvRjZxZ0FldmVFYUQzd1NoamI4NkxWZE9CM0tU?=
 =?utf-8?B?S1pwKzBRVjJUTTA0QWNuTDluNWdXeW1WQUxaVitycFlYMndrSCtZNzc0bjRI?=
 =?utf-8?B?VWl5UmZIdWNVN2kwdGVESk45bDFWNVp1TVdJYmRFUk1sbXB4VE5UUWk2Wjda?=
 =?utf-8?B?UGtLM2RqQVFhZFNNUVA2SStkWFIzczJ6cXVnTHpIa2MrZlNzL3BQM2NiZS9l?=
 =?utf-8?B?QW9PditzKzZ4SisraFZzT2MzdzZjKzkrS3pJVjYvY3hzVUg1TjYyVUg4aUdY?=
 =?utf-8?B?bmhtT3pUVThUaTZGbDhxcmVzcVdheVpuNy80STRBUHB2cCtIbWlyTW9nVno3?=
 =?utf-8?B?L1k1eXVONXRNamt2ZXduYlI5VzV0YkE2ZjRISk8vSTZwenhqbHI5bGhSWmlo?=
 =?utf-8?B?Q0JjTEZTeitHWFRmZ1MyeCtYOU80QXo0bndaUTFrL2xlUnJUbzIzc1NQVXRr?=
 =?utf-8?B?Q0VsUEM5UjJ6L0p4L1dtcmVGWU1IUGIxYTc0UXpCSWJRL1U5anNoY3BtNE1W?=
 =?utf-8?B?SFIwMHBnNDNuWlNMclM1MGE5aUJWTzZNM0NWNmNGRXpnUlhsNnRieXJvR0M0?=
 =?utf-8?B?bEdzcUQ5WTE4Y2JrUU5oR25SZmkwSCsxVFQ1aWs2Q1lnL0Nid2llSmEvSXBZ?=
 =?utf-8?B?RGtHYi9WOFoxdXVsWlE3RHE1OHJGcGMxeVQyT0ZsSHpldnFKR3lsWXVIUTlO?=
 =?utf-8?B?cFMwWjZJalpHbWM3TzltYXBqa0lVQUJ5dE1XbUZWRm1va01WdWJSK0VwSWhn?=
 =?utf-8?B?R2xsaTdac0Nkamt3dGNZYUs0OUlacnNxS3JFMnI3MzdkeEJrQWltZGFUL25h?=
 =?utf-8?B?b1pmaHk5MjZleHFIZUI5VXFTUlF4QU1pQzhid0h6OWQ0bFhKYi9DbGZJZWEz?=
 =?utf-8?B?SmloQWJkR0hpS1pVdEdhNFY1NFdDQTYyS0RzS1MwMnd6VjdyQnRCVjZKMWlz?=
 =?utf-8?B?cmZ4N1psaEVxMTM3U0ZwekcyR0ZiZUJmbitlaHhCNTBDTG5iMUlhK3k0OUF4?=
 =?utf-8?B?dkZDRThwQnk0emVkc1RWWjhZSnhtZHdCSWRONmRlOHIwaHEycDlWc01XTkxR?=
 =?utf-8?B?blpTR3d3U21zQ2VGb3BoYkxDZVc1UFlrOE8rRk5JcmtzNldtUXJYeEE5TU9K?=
 =?utf-8?B?Yno4NkczVDNDYzBXN0pqa3ZjbXI0bng3dkhkRFNaeXppU0NGV0FuUlY5TmJk?=
 =?utf-8?B?QnJNVlBFQStMSjUzdjU0c1FsNGRkT2RwSzJoeVBOZnpBSkJOMDZrdGFiWllx?=
 =?utf-8?B?elZHQjNKVkZtTG0vRGVxTHZlQVVVTHJ6VXhRbzNmWE5xbVJEaXEzS0Z0VHFU?=
 =?utf-8?B?eWtvM2VIVS90OEt5NGJmVkVQK3ppU2VvcnppZzVUeGNGMmZIRTlTalEvZ1Ez?=
 =?utf-8?B?cTZ4QlpldkJsenBRdklPSHc5bUJ1anVvVE1jbVh6ZUVPSTZGcGl6Z1AxK3RL?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faca5437-9090-40d2-e6d4-08dd5858d923
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 00:34:38.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vx2UPhTLpesCFgLonFOH3ue05EkMp9atWg820fuizvKSF5/WyrLR53IvHmDTK4kGCeV74j7qJuqJsH7WxQOUrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
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

On Fri, Feb 28, 2025 at 04:53:11PM +1100, Alistair Popple wrote:
> On Thu, Feb 27, 2025 at 08:36:35PM -0800, Matthew Brost wrote:
> > On Fri, Feb 28, 2025 at 01:34:42PM +1100, Alistair Popple wrote:
> > > On Mon, Feb 24, 2025 at 08:43:11PM -0800, Matthew Brost wrote:
> > > > Add documentation for agree upon GPU SVM design principles, current
> > > > status, and future plans.
> > > 
> > > Thanks for writing this up. In general I didn't see anything too controversial
> > > but added a couple of comments below.
> > > 
> > > > 
> > > > v4:
> > > >  - Address Thomas's feedback
> > > > v5:
> > > >  - s/Current/Basline (Thomas)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  Documentation/gpu/rfc/gpusvm.rst | 84 ++++++++++++++++++++++++++++++++
> > > >  Documentation/gpu/rfc/index.rst  |  4 ++
> > > >  2 files changed, 88 insertions(+)
> > > >  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> > > > 
> > > > diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> > > > new file mode 100644
> > > > index 000000000000..063412160685
> > > > --- /dev/null
> > > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > > @@ -0,0 +1,84 @@
> > > > +===============
> > > > +GPU SVM Section
> > > > +===============
> > > > +
> > > > +Agreed upon design principles
> > > > +=============================
> > > 
> > > As a general comment I think it would be nice if we could add some rational/
> > > reasons for these design principals. Things inevitably change and if/when
> > > we need to violate or update these principals it would be good to have some
> > > documented rational for why we decided on them in the first place because the
> > > reasoning may have become invalid by then.
> > > 
> > 
> > Let me try to add somethings to the various cases.
> 
> Thanks!
> 
> > > > +* migrate_to_ram path
> > > > +	* Rely only on core MM concepts (migration PTEs, page references, and
> > > > +	  page locking).
> > > > +	* No driver specific locks other than locks for hardware interaction in
> > > > +	  this path. These are not required and generally a bad idea to
> > > > +	  invent driver defined locks to seal core MM races.
> > > 
> > > In principal I agree. The problem I think you will run into is the analogue of
> > > what adding a trylock_page() to do_swap_page() fixes. Which is that a concurrent
> > > GPU fault (which is higly likely after handling a CPU fault due to the GPU PTEs
> > > becoming invalid) may, depending on your design, kick off a migration of the
> > > page to the GPU via migrate_vma_setup().
> > > 
> > > The problem with that is migrate_vma_setup() will temprarily raise the folio
> > > refcount, which can cause the migrate_to_ram() callback to fail but the elevated
> > > refcount from migrate_to_ram() can also cause the GPU migration to fail thus
> > > leading to a live-lock when both CPU and GPU fault handlers just keep retrying.
> > > 
> > > This was particularly problematic for us on multi-GPU setups, and our solution
> > > was to introduce a migration critical section in the form of a mutex to ensure
> > > only one thread was calling migrate_vma_setup() at a time.
> > > 
> > > And now that I've looked at UVM development history, and remembered more
> > > context, this is why I had a vague recollection that adding a migration entry
> > > in do_swap_page() would be better than taking a page lock. Doing so fixes the
> > > issue with concurrent GPU faults blocking migrate_to_ram() because it makes
> > > migrate_vma_setup() ignore the page.
> > > 
> > 
> > Ok, this is something to keep an eye on. In the current Xe code, we try
> > to migrate a chunk of memory from the CPU to the GPU in our GPU fault
> > handler once per fault. If it fails due to racing CPU access, we simply
> > leave it in CPU memory and move on. We don't have any real migration
> > policies in Xe yet—that is being worked on as a follow-up to my series.
> > However, if we had a policy requiring a memory region to 'must be in
> > GPU,' this could conceivably lead to a livelock with concurrent CPU and
> > GPU access. I'm still not fully convinced that a driver-side lock is the
> > solution here, but without encountering the issue on our side, I can't
> > be completely certain what the solution is.
> 
> Right - we have migration policies that can cause us to try harder to migrate.
> Also I agree with you that a driver-side lock might not be the best solution
> here. It's what we did due to various limiations we have, but they are
> unimportant for this discussion.
> 
> I agree the ideal solution wouldn't involve locks and would instead be to fix
> the migration interfaces up such that one thread attempting to migrate doesn't
> cause another thread which has started a migration to fail. The solution to that
> isn't obvious, but I don't think it would be impossible either.
> 

I agree this would be a good possible solution. Will keep this in mind
when we start implementing on the Xe side.

> > > > +	* Partial migration is supported (i.e., a subset of pages attempting to
> > > > +	  migrate can actually migrate, with only the faulting page guaranteed
> > > > +	  to migrate).
> > > > +	* Driver handles mixed migrations via retry loops rather than locking.
> > > >
> > > > +* Eviction
> > > 
> > > This is a term that seems be somewhat overloaded depending on context so a
> > > definition would be nice. Is your view of eviction migrating data from GPU back
> > > to CPU without a virtual address to free up GPU memory? (that's what I think of,
> > > but would be good to make sure we're in sync).
> > > 
> > 
> > Yes. When GPU memory is oversubscribed, we find the physical backing in
> > an LRU list to evict. In Xe, this is a TTM BO.
> 
> Sounds good. So eviction is just migration of physical memory. 
> 
> > > > +	* Only looking at physical memory data structures and locks as opposed to
> > > > +	  looking at virtual memory data structures and locks.
> 
> Except of course whatever virtual memory data structures the core-MM needs to
> touch in order to do the migration right? Agree that the driver shouldn't be
> touching any driver data structures that concern themselves with virtual memory
> addresses though. Except what about any data structures that are required as
> part of GPU PTE/TLB invalidation?
> 

The eviction is triggered via the new function I added in this series
migrate_device_pfns, this triggers the notifier which invalidates the
virtual GPU address page tables. So the eviction code itself is only
looking at the physical memory. I can add something here to make this a
bit clear.

> > > > +	* No looking at mm/vma structs or relying on those being locked.
> > > 
> > > Agree with the above points.
> > > 
> > > > +* GPU fault side
> > > > +	* mmap_read only used around core MM functions which require this lock
> > > > +	  and should strive to take mmap_read lock only in GPU SVM layer.
> > > > +	* Big retry loop to handle all races with the mmu notifier under the gpu
> > > > +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> > > > +          those.
> > > 
> > > Again, one of the issues here (particularly with multi-GPU setups) is that it's
> > > very easy to live-lock with rety loops because even attempting a migration that
> > > fails can cause migration/fault handling in other threads to fail, either by
> > > calling mmu_notifiers or taking a page reference.
> > > 
> > > Those are probably things that we should fix on the MM side, but for now UVM at
> > > least uses a lock to ensure forward progress.
> > >
> > 
> > Again, see above. Right now, migration in Xe is more of a best-case
> > scenario rather than a mandatory process, and perhaps this is masking an
> > issue.
> > 
> > Maybe I should add a comment here stating your possible concerns and that
> > Xe will be implementing real migration policies and multi-GPU support
> > soon. If this issue arises, we can revisit the locking guidelines or
> > perhaps help contribute to the necessary core changes to make this work
> > properly.
> 
> Yeah, that could be good. Something along the lines of core-MM code may need
> fixing in the way I described above (one thread attempting a migration shouldn't
> cause another thread that's already started one to fail).
> 

+1

Matt

> > > > +	* Races (especially against concurrent eviction or migrate_to_ram)
> > > > +	  should not be handled on the fault side by trying to hold locks;
> > > > +	  rather, they should be handled using retry loops. One possible
> > > > +	  exception is holding a BO's dma-resv lock during the initial migration
> > > > +	  to VRAM, as this is a well-defined lock that can be taken underneath
> > > > +	  the mmap_read lock.
> > > 
> > > See my earlier comments. Although note I agree with this in principal, and we do
> > > just retry if taking the lock fails.
> > > 
> > > > +* Physical memory to virtual backpointer
> > > > +	* Does not work, no pointers from physical memory to virtual should
> > > > +	  exist.
> > > 
> > > Agree. And my rational is because core-MM can update the virtual address for a
> > > page without notifying a driver of the new address. For example with mremap().
> > > So it's impossible to keep any backpointer to a virtual address up to date.
> > > 
> > 
> > Yep, this is good example and will include this in my next rev.
> > 
> > > > +	* Physical memory backpointer (page->zone_device_data) should be stable
> > > > +	  from allocation to page free.
> > > 
> > > Agree. And presumably the rational is because it is very difficult to safely
> > > update page->zone_device_data and ensure there aren't concurrent users of it
> > > unless the page is free (ie. has a 0 refcount)?
> > > 
> > 
> > Yes, exactly.
> > 
> > > > +* GPU pagetable locking
> > > > +	* Notifier lock only protects range tree, pages valid state for a range
> > > > +	  (rather than seqno due to wider notifiers), pagetable entries, and
> > > > +	  mmu notifier seqno tracking, it is not a global lock to protect
> > > > +          against races.
> > > > +	* All races handled with big retry as mentioned above.
> > > 
> > > Sounds reasonable.
> > > 
> > > > +Overview of current design
> > > > +==========================
> > > > +
> > > > +Baseline design is simple as possible to get a working basline in which can be
> > > > +built upon.
> > > > +
> > > > +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> > > > +   :doc: Overview
> > > > +   :doc: Locking
> > > > +   :doc: Migrataion
> > > > +   :doc: Partial Unmapping of Ranges
> > > > +   :doc: Examples
> > > > +
> > > > +Possible future design features
> > > > +===============================
> > > > +
> > > > +* Concurrent GPU faults
> > > > +	* CPU faults are concurrent so makes sense to have concurrent GPU
> > > > +	  faults.
> > > > +	* Should be possible with fined grained locking in the driver GPU
> > > > +	  fault handler.
> > > > +	* No expected GPU SVM changes required.
> > > > +* Ranges with mixed system and device pages
> > > > +	* Can be added if required to drm_gpusvm_get_pages fairly easily.
> > > 
> > > I don't see much of a need, but also don't see any barriers on the MM side for
> > > doing that.
> > >
> > 
> > I don't see any barriers either, I think it would work in Xe with slight
> > tweak to our VM bind code.
> > 
> > I'm unsure the use case though too.
> > 
> > > > +* Multi-GPU support
> > > > +	* Work in progress and patches expected after initially landing on GPU
> > > > +	  SVM.
> > > > +	* Ideally can be done with little to no changes to GPU SVM.
> > > 
> > > See above, but I mostly agree.
> > > 
> > > > +* Drop ranges in favor of radix tree
> > > > +	* May be desirable for faster notifiers.
> > > > +* Compound device pages
> > > > +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> > > > +	  migrate device layer are a performance bottleneck, having compound
> > > > +	  device pages should help increase performance by reducing the number
> > > > +	  of these expensive calls.
> > > 
> > > I'm hoping my patch series[1] to allow for compound device pages will land in v6.15
> > 
> > Cool! I was not aware of this ongoing series. Let me look.
> 
> There's probably not much of direct interest to you there at the moment. It's a
> prerequisite in that it allows current (and therefore future) users of compound
> ZONE_DEVICE pages to have them ref-counted normally, instead of the funky scheme
> DAX uses at the moment. Our changes will build on top of that.
> 
> > > as well. The next steps are extending that to DEVICE_PRIVATE pages with
> > > migrate_vma_setup() and migrate_to_ram() and we have been making some good
> > > progress on this internally. I hope to have something posted before LSFMM.
> > > 
> > 
> > Also cool. If you think you have something working, let me know and will
> > pull in changes to test out.
> 
> Will do!
> 
> > > The other thing we have been looking at here is being able to migrate
> > > file-backed pages to GPU memory.
> > 
> > Also can test this one out too.
> 
> Thanks.
> 
>  - Alistair
> 
> > Matt
> > 
> > > 
> > > [1] - https://lore.kernel.org/linux-mm/cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com/
> > > 
> > > > +* Higher order dma mapping for migration
> > > > +	* 4k dma mapping adversely affects migration performance on Intel
> > > > +	  hardware, higher order (2M) dma mapping should help here.
> > > > +* Build common userptr implementation on top of GPU SVM
> > > > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > > > index 476719771eef..396e535377fb 100644
> > > > --- a/Documentation/gpu/rfc/index.rst
> > > > +++ b/Documentation/gpu/rfc/index.rst
> > > > @@ -16,6 +16,10 @@ host such documentation:
> > > >  * Once the code has landed move all the documentation to the right places in
> > > >    the main core, helper or driver sections.
> > > >  
> > > > +.. toctree::
> > > > +
> > > > +    gpusvm.rst
> > > > +
> > > >  .. toctree::
> > > >  
> > > >      i915_gem_lmem.rst
> > > > -- 
> > > > 2.34.1
> > > > 
