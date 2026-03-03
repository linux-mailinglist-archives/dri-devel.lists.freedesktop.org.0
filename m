Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKWbBxb/pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:32:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF01F2AFF
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E2010E830;
	Tue,  3 Mar 2026 15:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iy0iLDTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7B10E830;
 Tue,  3 Mar 2026 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551949; x=1804087949;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AoT0R0xCsN6lYC1M8ljVj6AHJ1kNK0UeRK8AtaIonKQ=;
 b=iy0iLDTrkFCHrTh+X5aMUYE62EP3FuPJbsG2q2/Jf7yPCD9GF4KJ7wD6
 GRZ6PYhBT8fxqc12gYwpV5AauxGlehaRrCMiAmq/WnKWqkSRrv83dL5cW
 cQ7yTdHETqgBxJXldZl3/ahzdb+XftGNZGCX16WrwGRs+R8nxB5X5+ZIC
 AtyzSj/uSL+ozZUhL0rieoMX1Ku73y5E8VNTR3SNSC2YTINIcjIdxsiI1
 maJK3aiQNDKftdWEcrjoOookZl3ByVG9ycCE5eHUqMVCOm0LJaZEdtzT7
 0JpggsSmrPUiaCzPh1+cugc3OAMppyjca5qpMctxNQ8HhCyyy273Hvg6/ Q==;
X-CSE-ConnectionGUID: xjRF+YASTnOAjjM7vZYNWg==
X-CSE-MsgGUID: fu3b6/pqTMKzLOQ+oY5cmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84684442"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84684442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:32:27 -0800
X-CSE-ConnectionGUID: CVZDlgsNQAGb3oQDpL+lVw==
X-CSE-MsgGUID: Um8gQxO6Q2WhLFtKPZSh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="216404013"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:32:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:32:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 07:32:26 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.31)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:32:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcMlUP2Lua9sY0x1vwwMUpQhhVCeyHYrAG2sOti32bIQ1aj4xT+OF6jOpREQF6DPDs8/r/KmfgvQu5nFLI6sa8qN4DcIxX29/f9E4vqwBh1i/Uc3YUHE/O1xeHfi79azfFbQnk59IcJxBCLnJlLlh1wcOwuKtsoo65H2NK4h7GpFD70dVTQxRN+WNpoyOMnsMOHhPwuyaTymwyiMhfUacteEgK7dfZE10M6FHiJnaizirSZHJir6GawINSesIehNfuWN3VXWUEWCjz+F91zqWdhS1KGDZOEyHmAcJs8wg/EnEAvxDBELcuFYIhRj+ZP2LAjh6aEUPnZUnTdyJI9Txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IXpX8ctq/3vdgK/P/1IdH1oI3fZrr1gvlaxQrL7W50=;
 b=WK9uo0vrNjI/mNmV9kFZ7+2qQceqbJpWMqXkQH30riDnIzCibMgwC69+SIMUGsSIzAE9iOG0IhtZ0mFLF1BsB/rIHRDUbiJh0dDlVEK7SWOb3H/Tdt90yoyxXwlN89+RNANBuMmcKfiedyTsjoRrgkoY8aNfU6jtFxXuqAuC8vjlHH3qKw9bu/5ulWxCbVxmTdTQZChVxT+tRyT129fUBWgAUUcXHGyijHbqAA0wah0hBlHro8xZgx3HN9zwlIl/j+ahjb9jYGKFxdGiCXrZq/2gSbaLqucSoF10CeaQrJSLd6sxHSlnkCh3vTP8U873nfx4bBMdrshhyJaKgA8Bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:32:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:32:22 +0000
Date: Tue, 3 Mar 2026 10:32:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <mripard@kernel.org>,
 <matthew.brost@intel.com>, <riana.tauro@intel.com>,
 <christian.koenig@amd.com>, <andrealmeid@igalia.com>
Subject: Re: [PATCH v1 1/3] drm/doc: Update documentation for 'none' recovery
 method
Message-ID: <aab_AevtalGw0fdO@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
 <20260303110556.3577612-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303110556.3577612-2-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baaa7d2-13fd-4804-5d11-08de793a106b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: DY7ygC7wQyIJ7L2RiralGAWJSal+6kEI3Y1FB7S7KRwO9JzeJZp5aF5DipL0NWFTeJ8nKEx3g8pXsGr8S0nOaqOG3QwfadrrGYnmcAg1/MM//Q7od181zs562/oWfxgphla47FvZbpP5cjEeiOhnHNESR8q+6hpomFGvGMR+JmA9R8Y0CVIqpD4SqJEu7CQwT9JaYbopexAP1LttVlHmfF2vvBuNu8mqSVkkBLvauwOXNbGpfEmBeRtdqrIVnC0vXrS4zULisTFT7BXigpmcjHShxiSKudBsFnr3C/TbEqiU7UcquJKuk8gi4E9xlcaKIBQZjEXpb5+Mv6MH+WlfL6oMab027JRQ5B28lgAMooeopXb08EyaTokdybNkbsxzOAzDz9JRTot6MMLbjjwMZL1LCLV7jOLkFH6zUILt5Oy0uTaHUfBB449n/QH0rGvCT6fZuoYNIYjyj+NipzRu44jzfeX0eFoyKWrbrn51ZMJaQgTFhflncrLjfbu1RGQY+a+be5u1rH9UBtGmTKDKxYpyGBStChYE1LM93uRPFUhfkmQasK7EL8d2IgbhcDTXebN9z6CDajGHqO7FOHwEmdC/sPB0URO+s+dp8SUPjouYHTsl1jwARIJ/+yOiS8YPVp1l47xlWeX540Fsru16LCV/iW0pM1m7eEmmfBlpntgQoKlumlRo+W8luSlxM0oMePmA/RM1xmf8JiAM4J6V5kOWNVqNq+tHOlb/lvVcI8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkhaMzdlUmVrYlp5aDZ0TUx2d0lVV2N2bmtDYmpQM1FQemx5a2RXeFhnUm9P?=
 =?utf-8?B?WS9jN3dlQU1OMGcwVTVwOG1wM1VkNEhwNVJUV3JhcXRGTmFUSTlwN0pmdHB0?=
 =?utf-8?B?UVJLQ2xpaEdxbDk4WHRBdjhQbDFYVHZrK2h0aHJVSGlxWjFobDdpTStPRytP?=
 =?utf-8?B?eXlhb3pETmxIUk1PdGdMY1dWRVp3ZE5lYm93V0hsd2NHZE8wbzdudHVTdDBL?=
 =?utf-8?B?c0VkT1pEei9RejM1TzVXTFg4eEx4NUZPd1M4SDJNRUhvM09Fcmw4aE92b1Js?=
 =?utf-8?B?Rk9mOWNoWDQ5TTJFMlhCSGl1T0xKckZDUk1jQ283VFVMUmRVdDFXUzU5dzZC?=
 =?utf-8?B?Tlp3YVJpc2ZoOWxsZDR3QmtCK1BiUGVEaGx6QklwQ3doMjZncUVOdUx2QmFD?=
 =?utf-8?B?VFE5RXFvZWJFdW9ialdrOVNDODg2TXNSMUpTU2V6cUhmU2JteWNkZ3cyaWMz?=
 =?utf-8?B?YThHQUxURkRHY2FZVTM5Q0U5ZHVkcVZabDI1a0JpbjhBOHdOL0JHcFNlLzdJ?=
 =?utf-8?B?NnVsMEpKbmpHYWxLdU5HTHYyRTEvbkdIamFnVjNreUFpRGRvWG5NWEN2dnhK?=
 =?utf-8?B?c3hWU2xWTVh2cVJiTWowNkdyQm55SU5ta2hRRTZ0ZlpQQmw5RlBjdVYwL0Fr?=
 =?utf-8?B?eHQ2c25rUkJaWjRDaHRFdUpndG9IWi9LZm1JdklEdWJCR1VSTWxvakNtM3BX?=
 =?utf-8?B?M3czam9TaTIxa040K3FHUUVJUG51dGZmUDFvOG5ieXdicFpZdDlscnhLUndL?=
 =?utf-8?B?TklrUVIwb1lnNzlENlFicjloc1pnK2ZHR0luYnB3OW1nNm9pRm9Ca3o1N2Ny?=
 =?utf-8?B?b21jZFRaQ2ZSUHRNRDZHbHBuVDh6by9Md1hWTFp2b2Q1REE1aUp4STRkNnhU?=
 =?utf-8?B?eWErOUZEV1NlYjJVSmE0ODFUNGJaQ0diSk42RkVHK1ZaR0tvQlczOGJCdWls?=
 =?utf-8?B?Y21ZaXRmTDNXWFRDbU9SVFk5STJKb0hGZGpNS1NUWW1GQVU3MHZYUkdWaklU?=
 =?utf-8?B?NjZyV0wzQWNucmdqa3lJT0p5SXl0djhoVlgwbHpYa01CVmFWcEZ6TlorNUJU?=
 =?utf-8?B?N2ZMZHVzeWJsLzNTR29CNjZ4RmFUK1FybVBlZGtoMElxcG9lanF4YzNGbXZm?=
 =?utf-8?B?OFFkR0p3V21adE5UQWJRMENickg0TUQrTzE0UE5XdWRYdFdML0gxbzVNT3Fj?=
 =?utf-8?B?V1pqcldFcG9RNWNGUy81ajJjdFJNOXg3Q3NpUHlPOXVHNmZtZWFQaTBvL3Zx?=
 =?utf-8?B?MlJlZXFnY3V1Q0JJTnRhRmhlc2QyRlJCaXErZHBZY2k4MEJ2cHRDVnlHbVFP?=
 =?utf-8?B?Rnc1Vk10YVZPbHlkclh6N3dBeHVENWorSER0NGVDL1dPWDNCYjdUY2VZMXd5?=
 =?utf-8?B?MzMvTytkaHNscFFCZ0VYRCtFUjJpcVc3bjUxQWVnY0FHRUNEclFURmNZTVpL?=
 =?utf-8?B?VnlFdmxjR3hZY2k4UFNacnQ3cDU3cWl3SmlNR0wyS2dyL2lVNEMrZG90WXRi?=
 =?utf-8?B?SHRUeFhsL1dudHYzbmVyd3RlVklzempxOEFmS2EzcDNWQ2tKL0JqZkRHT0Nl?=
 =?utf-8?B?L09oS0t4Mi9aSkJMZk5mTnNUUTJ2NGFHS1d3eWJaZHRmOG5ZY0xlOFNXbXlU?=
 =?utf-8?B?d0Jsd1FYWU1neUFOQ0k1alJCRFRxeTJoWERRNUxmd1F2UWl0cDhSUkt2V285?=
 =?utf-8?B?VHNkaFhNc1A3anJyOURGRDNRdmJoWjFpWUJzOFdBcmdwUlJzTEREOGdvSWp2?=
 =?utf-8?B?Y2JGamExTWtYRW9BWGJQeGFiNWU3elRMTmJQN0t2R0kyQUNxSzV3dTV3Yjdj?=
 =?utf-8?B?aCtiNGpzMzdzR3g5eVhzd3BRS0RNSkRUcllhY3YxVlRwNUtUYVgvSmVYSFVj?=
 =?utf-8?B?WWpLQUtDL0NuUllON0dNNTdESVZDeFAvWFVMZXVoTjluZFZEQko4U1c5ckFO?=
 =?utf-8?B?VElCNCtZZzlFQUdXc0NyRTJWODRBaVkrai9Mbjk0TnYrN3JGMkJTaU1FWVox?=
 =?utf-8?B?dDROalRNcHlhZ0VBNjZlTmRISllFOXFwNk1jdGV5eDN3ZmVtYWZKUTNEOEVG?=
 =?utf-8?B?Q2RNK1o1VnJLYk9YQ3RjYllLZXRwNGQ2UzJPd1U2QVk1eDBrU0h5YXZ5cFNv?=
 =?utf-8?B?OGQwYmRUVXJCeDg5clNNQUFCZkNPUHpZdGlranRGdVNoVXMvWk5LT091Qlo2?=
 =?utf-8?B?My85aG9HMm1FdWFROUUwNHd2Qi9WRWl4c0hXS0UwUnVqdUsxRUcwUkYrY0lC?=
 =?utf-8?B?Sms1MzNrMWVxaHplQW8wdVFFUHJMQmlEVmo4b29RM1ZQS29kbmtqeFJxZStU?=
 =?utf-8?B?RWpZUEpBanBvMUhhc2VGTW1QZWZ5SWxHRmhJMVU3Szh6M1pnNEtMQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baaa7d2-13fd-4804-5d11-08de793a106b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:32:22.5606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZdwAnJFQ4D85KvEXmGlLDgnUUgjdrJIvyI7Is4Sc1WernKoEMESOSZMlXoDR+c3HBJ60y288j76S+1sAJ3GvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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
X-Rspamd-Queue-Id: 95EF01F2AFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DMARC_DNSFAIL(0.00)[intel.com : query timed out];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 04:35:17PM +0530, Raag Jadav wrote:
> Expand 'none' recovery method for wedged event to include debug cases
> where driver wants to hint "no recovery" without resetting the device
> from driver context.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index d98428a592f1..af20136108b7 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -439,13 +439,11 @@ following expectations.
>      =============== ========================================
>  
>  The only exception to this is ``WEDGED=none``, which signifies that the device

I don't believe it is an 'exception'. The recovery method is none. It means 'do nothing
to recover'.

> -was temporarily 'wedged' at some point but was recovered from driver context
> -using device specific methods like reset. No explicit recovery is expected from
> -the consumer in this case, but it can still take additional steps like gathering
> -telemetry information (devcoredump, syslog). This is useful because the first
> -hang is usually the most critical one which can result in consequential hangs or
> -complete wedging.
> -
> +was temporarily 'wedged' at some point but no explicit recovery is expected

temporarily or definitive it doesn't matter. none still means 'do nothing to recover'.

> +from the consumer in this case. The consumer can still try to gather telemetry
> +information (devcoredump, syslog) for debug purpose in order to root cause the
> +hang. This is useful because the first hang is usually the most critical one
> +which can result in consequential hangs or complete wedging.

What about replacing this entire sentence to something like:

WEDGED=none indicates that no recovery action is expected from userspace—regardless of whether the driver already handled the condition—and consumers may optionally collect telemetry (e.g., devcoredump, syslog) for debugging.

(AI assisted text)

>  
>  Vendor Specific Recovery
>  ------------------------
> -- 
> 2.43.0
> 
