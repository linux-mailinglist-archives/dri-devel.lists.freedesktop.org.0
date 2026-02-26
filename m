Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBoaImyVoGllkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:48:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E61ADFA9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4D410E9BE;
	Thu, 26 Feb 2026 18:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAcPWQ8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC5710E9B9;
 Thu, 26 Feb 2026 18:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772131687; x=1803667687;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K2RDCg6HLL5NQRjdo7Vv8y9q0U5N+EqrC4rW0J8aIYA=;
 b=nAcPWQ8D77cH0+I4fH+tbcKJmfrVVRLCBqbTY2KPDZTZY2sY6DOqZC3v
 f85AvOoarXz8GhYFmvHUEurlo20oRSwvsH2tDGSK5F/ttgOtFrjd0wPHn
 QYDpvygMehKyIVzlziASazEYKHyKl629W48olP/Sl2+WbnN8MTtdbN5dY
 8ITG814bimjXz1dmbpE6V/U2lbZNTcQxRTMEl7Nd1N38bf5GyK0KlT4oi
 j9ecqlMhR+dcMWwkfWaPl3MwS/9s4bUsF7CPx+NIxLo4Q7G448Nw3En6Y
 u6oX0dv/qZNgCkgE+0z7Uf+1RVqtTiZpgdV+9l2lt+bgjI9Aq7g3LrNc8 g==;
X-CSE-ConnectionGUID: 6/uAylzBQYuRPYxT+Vhx5w==
X-CSE-MsgGUID: B5Jtp99rSJuKL6kaIQCfow==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72906262"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72906262"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:48:06 -0800
X-CSE-ConnectionGUID: EV26Z4S1SrO99incZjLnkQ==
X-CSE-MsgGUID: 4aKjag5zTN6igk8y0F6RTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214884701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:48:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:48:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 10:48:05 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:48:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB5j0DF91nwVFTqMq4G5s+gdM7z/WXYoZLz/dZFWxgSVtfiWZnLuzJSh2FVa/ssqCEmu8nmt1AioxmSkeqpXpG+2QiSlMbsi2cGhxiPJUzM31DiCjgm/EtRC7wtmuIds9+RKD1qJf/dvuvRC8RGqKZ3sOO1JUpEU0jmLDMu4fwVAqbt82nhf49GlTvP2kpOZBSXAWV8xkvDNngsgkdiE1Y02mXh02rEn2hcwiBL4bQPcsm6dTjr0YQsUYSSg2Fo5LT5pmd6m5MzR/H4wj+wGqkwmYUHnPWQyDSYKKBCS22lrl3BfEp0f3PlJj1+cxqXuNeW27zByAVwB4umptqEo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFbZDMDFoEKNlNtXuJmxNpYq3H6ExpSqAJHvHlZyUcY=;
 b=qoybF+q83bpf+10YRkVoZnzDtTo/hA5gdE8LHCri14lV2AhGpcOwqafo0DlL202PA4N3ZbH5ar0g/QHxoZ9NGPwLT3vGdJ6pITUqmZRxnKVqh8kDQZEMs3RSG5nYa2bILJ+w4AJuorT71KWkXS8sqIfz3/HLiWgEmZ07DdH4dllt0CRAjHDGR/HwSOSAwpI0cHL4ta2hA8fvHdkRVwiRy8QiS2rbP+HpIricHaTO4GhI1myB1hn2Lqro08xlcYgEXigVn3ZnIxn0ZTsWx87twHL5baPtNJgUcE8NnVYgrIrbfGeTozjwpsMrfB332BXun+psn53FC1dv5S57KgM3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 18:48:02 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 18:48:02 +0000
Date: Thu, 26 Feb 2026 10:47:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Piotr
 =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Dunajski
 Bartosz" <bartosz.dunajski@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC v4 1/1] drm/xe/pf: Restrict device query responses in
 admin-only PF mode
Message-ID: <aaCVXnUYdsQwlSx1@lstrano-desk.jf.intel.com>
References: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
 <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 985aa244-cdb2-4803-063f-08de756791d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: AGJakdP+u6DAWOzhYyvVb9swT/1zoGkJuXWkGANXaVBn7u7+S33KOJmW6s83/QCWsz8tp/wop2b1YTvpAD/fwW3Hx2aiWzYDmanIlnWg9Cy8XmSnP4Xk8ct5rizVugiDkeiRO03FvcytqHCOyr6+i1kaJuMb79bPhoyGR4XSfVYAp/zXfK7DfFO54DWBasHWdYhcUXyGBjFRqnsJz/agT3HGaQ0S6RVvcjjzhGtloW9OwuYGuAqi256s1Fqo6w9UcKgHD3WzKUCoOy4wXYspwxooEt+aLcDaM4e9+8lkJdvjcBT5sLW11QiaM1D7sEpECBh2p8M075SPR+yF8QTT7UzKQs7CW06tdjx/TmtThve4NHJ8G1OVaJ469l5daJPSDO44/vOqJ9xB6SiFDq3XxlqCd/f9n6eE3iFCY5dziYBWGtg25tYKD4OihD2KgOA35iyonHd4CwBgY/+UZXBQ+wz794bbR0+noVmLKBaKfWmfkImoZrvheIGg1r5ETTVclPXna1J/AiBw8MxLiI8uMvaohvj7y6i5BLcVHvfHHdyEaNn5xSlTW5E40FiGiyDSz3arD86Nty7ELA556/kHRXFV6hV7G5WSPFuqlUsxnynRE2wZIKj5qxTgJKTTk6LbLdoUh3AZF11FpEr/rqc7SjbHWOHAAcugt6vIajjfcApoyQLB0dlmIfB2l29MgGUheWPSVcrh03rWWuFhrYxdDdog/M9hyisqH2ouNexE5Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9Ma3pycVdVckx5My9lZWY2YldZVi9nMkxUcGUzd2xyTDI3UEIwQjl4VTJw?=
 =?utf-8?B?UkkwNDRxSVp1aE93K0tqMU5rY2orby9BY1JMaDdlSnhlZ2NuWU9tWUpPc0ZT?=
 =?utf-8?B?M1piQkVzcmZOajBLb3Z3dW00d3BSaHd3ckdyelhLN2pWU2JhejUrZWxVVEtP?=
 =?utf-8?B?UkR4Y2NzOGZvVmJkNVNCZXJhSjhPa2YrWVcrM0NvVUZUVHc1cUlKUWJHd3I0?=
 =?utf-8?B?WTkyVlRqOHAyMG02NDlqSG93ckk0Umo1ZlpCbDVLNzJ5OXFTNE5FOGNaOGxX?=
 =?utf-8?B?alEyTW1pd252UzV1QnFlNmlOVGkxSTkyd093bC8xbTViM2I0RzN2MWU1OUNO?=
 =?utf-8?B?clRvQnZDRGJ4aVRqZ3pUZlhPU2g4RWZyQmNlQ09LSE51b084SUdjNllQaUNl?=
 =?utf-8?B?MjkycU9CSHVkT3hZcVJXQjFEZ1VMcWIvMGhqVy81OGJUL0U5SzJTaHo0czRF?=
 =?utf-8?B?cFp2ckZpVWtkbUZ6QllQQyswQmFwK1BDMENSaWZISzF1RDdRZjc3aktFQnFC?=
 =?utf-8?B?cmFQcWNtc0JxQ1BHMjhibGE1dWZIZHhXZ2VsNko5aVJXeUtVQzkxK05qK1g4?=
 =?utf-8?B?MURVbm9CR2ZHVmxxRG5uREhKeHBCTGRhMEpXdmpTQ0tGVjQrcE5tMGdpQXBW?=
 =?utf-8?B?aWd3Z1czamg0YUplbnluZVMvYVRMWjZqWWNEc3JXR2llbERmZGZZWm5tYTVY?=
 =?utf-8?B?NFgzMnlrOUdKSGNxajBhcTk1QzZUODNiNCt5eER6RkpkWXNzQVhPWG1WVGtE?=
 =?utf-8?B?N0dnSGJQRm50aHRaQXN4MERzNHFsVDhMZUV2eVFYQmc5TExtNmt3UlhlYlMv?=
 =?utf-8?B?cDdlUmJVZ0p3aUZ4VkFBQVYwS2ROT29QcjNpRkV5NksrUld5R1Y5eUVMMmhi?=
 =?utf-8?B?elZPcW0wWENwMzBMa0srbUg5bnVPa2JKN0RnRlRZbXBaVyt3cWZibWRHUTd1?=
 =?utf-8?B?VE5Ncjdic20xRUVNRkRud1VOT0NhVFd5SzI3YlZQMXpNV1RWdU5FanVRQzNZ?=
 =?utf-8?B?OGlPaDlJcC9ERlF4OEFzZ2VIMkJyWGNidjVOVS80MjJzYkNIWG1ldklSUWpm?=
 =?utf-8?B?Qk03S3I5c0Y1OVFzVkFjOHh5K1kzRjl6N3V3aHlnbzcxT01sMnpIZE10dFMr?=
 =?utf-8?B?R0tXaGtCc0xITElvNjlYNGNGT0d0WnkrZnJXMElCZVFreFFUdVEvN3ZQV3Q5?=
 =?utf-8?B?ZXJibGh5V3FMbFpsWFMvOW9QTCtlcXRSZjRVT2x1TW43cFhJSWRaTGFYYWFC?=
 =?utf-8?B?UEVuRFU4Ty9ubDJYeW9iZTc2dVI1WG1zTzVVNmdOOTY2VzFIdTlQVkNwOVpr?=
 =?utf-8?B?bEx4N2VSSkFtdnJaUXJ6R3FJNld6VDRZOUo0MWc5dGhMR0dRYUtBM0dSRTBZ?=
 =?utf-8?B?OWdKTERKRTNqd09yWmhWOE5vNnNjcE41VmRpY0J3MGxqSFN5WVZGZ2R3MUV5?=
 =?utf-8?B?b2EzZC9TSGR1THhMN05FQVhFTFNXZGZNMVc3TXA5YzhDRHZJMUtkbVB4b21B?=
 =?utf-8?B?NG1rYkJiZTQ0Sko4ci8xdFNiQVNRcktId1pGc2xpMFE5WStpQUwxWmUxSHVP?=
 =?utf-8?B?QzVPYmR0NFVpQnJMZHRGQmxHMlpPemJmckJsYWNwbGJOQ2JXNEthaXpvV1Qw?=
 =?utf-8?B?blN3cm5PY2pXeWc1b2ZCM09DSk5EQkx4TUFyaFdBZXFjeTZvdmtXMkZHQ0dK?=
 =?utf-8?B?WjB6M2pnNXNtY1BUNHFkOFhRUU5QdDhJRVkvaElEQVE4K3lCY2RreXhqcEdh?=
 =?utf-8?B?RCtJWDZoQlVFQXpCTmh1Nnh1SVpHQmFLekcrbTlrK0J3SitJVko0MzJ4MFJG?=
 =?utf-8?B?MmNqeXpNeHJjS2pjbFFrNTZtbW1BcFNkV0R5T0tuN05XSkgrdkhmdzVnaU1K?=
 =?utf-8?B?RTBic0FMUE5aNGZKYVk0RWNYUG5jWkozVmtLcVZRNDVNZ3NsSVFnaW5kQ2Q4?=
 =?utf-8?B?SldKUFRnd1RzT1NBQ1AyL1RlbkhSd2dnQS8yOUFCbmNSUUFuOVkyVUpYY1BE?=
 =?utf-8?B?Y0hOQlpvaGlWQnoyMjV5WUlETjFtLzhQdU5LOUIvdmVxOHQvNjhEcDZmMTc2?=
 =?utf-8?B?Nlo5ZUNacDVWbmhvZXpyelF3ZnVaWGhyd1lpdXVkay9QWkN1VGw4eWJTWmcw?=
 =?utf-8?B?QWMzQ1ZWNCtadG8yNGE3MXJXbnN5d01FYXBmcUovcFpDa08zdEVBdW14c3pt?=
 =?utf-8?B?c25ZMlpiUmx1RXlSeG1qeWFvY2dYc3RGK1d2WjF6Vlp4L3VtVkwzUWExbVlP?=
 =?utf-8?B?UzR3MFByQW9UN2oxQnBIZUZDVDZVTndCVnFjY0hISXV0dW9mZlZWVHVtT0NN?=
 =?utf-8?B?MTlVMnpSZWVReCswV2FXYnBSUFhpdVdHUW5hVXBUL0p5WURMbmlNZzNQQnRJ?=
 =?utf-8?Q?9YGznSUZCdVYiy6E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 985aa244-cdb2-4803-063f-08de756791d4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:48:02.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYTUQnaJyDAmDO5IDSqTeXv/knsyUaHTFRt9sOVpLjGgKZ8iEkMV6VuOBby3xPaRba1u/Wq2f6gqmZWEHLe5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C41E61ADFA9
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 04:31:06PM +0000, Satyanarayana K V P wrote:
> When the PF is configured for admin‑only mode, it is restricted to
> management functions and should not allow users to run workloads.
> Suppress device capabilities to userspace in admin-only PF mode.
> 

I'd mention which IOCTLs we expose in PF admin only and why we expose
each one of these IOCTLs.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> ---
> V3 -> V4:
> - Suppressed device capabilities in admin-only PF mode. (Wajdeczko)
> 
> V2 -> V3:
> - Introduced new helper function xe_debugfs_create_files() to create
> debugfs entries based on admin_only_pf mode or normal mode.
> 
> V1 -> V2:
> - Rebased to latest drm-tip.
> - Update update_minor_dev() to debugfs_minor_dev().
> ---
>  drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_query.c  | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_sriov.h  |  8 ++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..7bf462eed917 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
> +#include "xe_configfs.h"
>  #include "xe_debugfs.h"
>  #include "xe_defaults.h"
>  #include "xe_devcoredump.h"
> @@ -213,6 +214,11 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  };
>  
> +static const struct drm_ioctl_desc xe_pf_admin_only_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),

XE_OBSERVATION can create buffer objects and exec queues? Is desired to
expose things like this?

I like this approach of only exposing a subset of IOCTLs though, pretty slick.

> +};
> +
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  {
>  	struct drm_file *file_priv = file->private_data;
> @@ -442,6 +448,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	struct xe_device *xe;
>  	int err;
>  
> +	if (xe_configfs_admin_only_pf(pdev)) {
> +		driver.ioctls = xe_pf_admin_only_ioctls;
> +		driver.num_ioctls = ARRAY_SIZE(xe_pf_admin_only_ioctls);
> +	} else {
> +		driver.ioctls = xe_ioctls;
> +		driver.num_ioctls = ARRAY_SIZE(xe_ioctls);
> +	}
> +
>  	xe_display_driver_set_hooks(&driver);
>  
>  	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..1416ab7be809 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
>  			i++;
>  		}
>  
> -	engines->num_engines = i;
> +	if (xe_device_is_admin_only(xe))
> +		engines->num_engines = 0;
> +	else
> +		engines->num_engines = i;
>  
>  	if (copy_to_user(query_ptr, engines, size)) {
>  		kfree(engines);
> @@ -297,6 +300,9 @@ static int query_mem_regions(struct xe_device *xe,
>  		}
>  	}
>  
> +	if (xe_device_is_admin_only(xe))
> +		mem_regions->num_mem_regions = 0;
> +
>  	if (!copy_to_user(query_ptr, mem_regions, size))
>  		ret = 0;
>  	else
> @@ -419,6 +425,9 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  		iter++;
>  	}
>  
> +	if (xe_device_is_admin_only(xe))
> +		gt_list->num_gt = 0;
> +
>  	if (copy_to_user(query_ptr, gt_list, size)) {
>  		kfree(gt_list);
>  		return -EFAULT;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 72e55543c30e..be426afa90b1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -37,6 +37,14 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>  }
>  
> +static inline bool xe_device_is_admin_only(const struct xe_device *xe)

Kernel doc.

Matt

> +{
> +	if (xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only)
> +		return true;
> +	else
> +		return false;
> +}
> +
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>  
> -- 
> 2.43.0
> 
