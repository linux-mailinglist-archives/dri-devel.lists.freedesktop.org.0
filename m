Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODyPLrhYeml55QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:43:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C576A7DA2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77010E2DB;
	Wed, 28 Jan 2026 18:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWC3W1pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9653610E2DB;
 Wed, 28 Jan 2026 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769625781; x=1801161781;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QRckLEY4uheCT8X7vFGLMJKTp56sDboUaZDtmnGwBv4=;
 b=LWC3W1pqN0iuVY4JiuMJDHmP62zDht30QPUG36WwMRWYp6plu8ZZE15O
 8gVoqolEv6zg4lqLN0QpjEM/7asnGhylT0ueqtLRrxpDSWe9O84EqGQ84
 MZXXSEHvLKDXbHGAmtII4kWKMgT5aqXg+3lONqq0lqEDsbKjJN69++3WK
 RFtbonJxomsJs6f5SClcZIz11htcvLb8kK4gUgk9FvfLoDZ9LNMc35uRP
 fUQQ8nxoFsQhnY/mjYsRBNfwJFT9BeoodeUtDTWaNbIQN3Vbi7Hu13Bgh
 7sNQoDlrwkqIfsLU1uephSdOuRVsGrS28pO3uMJc/GPYVHQZ58aR8h5dL w==;
X-CSE-ConnectionGUID: C6Fdba5JQ52FbRirQtKoxQ==
X-CSE-MsgGUID: tyJQF0zJRUmdFCAlA3KnbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74711458"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74711458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:43:00 -0800
X-CSE-ConnectionGUID: O94H8zwXQG6xfYft3w4exw==
X-CSE-MsgGUID: xv/4qlPUQ1eo6lMcbWGqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213209407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:43:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:42:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 10:42:59 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 10:42:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMrMwMBrTXt3IYYETdpCJyQZRiu8ejAutzoT/pVSd36OlfK9H2bGk3aDqB6vYCs/FlnNc79BHtyexENcEPn+wWF0t5+lRRuy5OGaFH0ZQQoh1bIs4OlnoB+FwijrKLOKtc0K8kaeUwaWIdd2DDI3LZGXW8Qe7Wb2mexUUfsdCdD1HCCpkM8RO0jOpfKpPZ5FtaXbyUcn3gtXAPsGLnr3sGb4dBRMUZB4O2JZzaW91ZfjNvhzM286MB8emqCbdzOo8RKTL9Inscl4yXDeh9nCGMjhj7vdKA+m2Ou8qgs26WtPd82Jrt8u6VFPIk9OGJ5Vk37cScPFTZdkXPMjfyRDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsR4yNXT59JxsiD4jd/fr7NBnqB2ZY2uMo8er8uBYH4=;
 b=l73V0ysB5GQP1cSsmBvJxovRs0E/3IaJqFBgEbg6pujw/uxNcPLj2/KvzG/APRgRSsUziai0ATu5vTgLA2UAJh0sJEgxwKwYfm6zrNkROPx7hRpOuXdnafJquh/U2/qiqaXqHLdnBADl0rio4sr69nGKKndh9DYfGlnJ2qhF4bHfn9jU7ILYDTTdkdtd0HXyxvOQpxeU83tY3z0cQTaCe/wuvjkm0RKAGP7h83F0HWseG4BgPnQVrL3puGtlNJaInB24chrT0BDzvHhv6JGqKZEdZeEnbQln9E4ydNTv3rlyBuc0LJPJEaP/ngbXUrqMGSz2tD8i/O+/fDztMoZB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 18:42:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 18:42:56 +0000
Date: Wed, 28 Jan 2026 10:42:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128151458.GJ1641016@ziepe.ca>
X-ClientProxiedBy: CH0P221CA0045.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b714cc-8c1d-4814-4a27-08de5e9d0d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmFJNnRpV24zYk5aMUNWUlV2bDN4V0hDREZBekxPWkdnY0Jra2x3ejQvQnc3?=
 =?utf-8?B?V1ZYV3FLUm9SRFVTNkxKSCtvNDg5OWw1cW5GY1lsek9Ib0tXeGorZnJIYnhW?=
 =?utf-8?B?aW4zdlRPVEt6ZFpiNi9IWGJvSU9hV3lwcG5qRWZUa240a3ZSMjlXMTRlZ1Zl?=
 =?utf-8?B?bnZYdFBad2NtNkdiSnhaVlNHdXJLVndFblo2S285WVQyVTFXT3RmWkpWdDJW?=
 =?utf-8?B?dXJkT2RNY2hnTno4NkpucXcrV2xkRGphVzUzVEhKUExzRWs2Ui84elJtTkVk?=
 =?utf-8?B?WHgwR3RxOG5NQ0JnOEM3KzhZR01jZnAydGlZL1VIYnhjT09tbkRYdUE4ZUhk?=
 =?utf-8?B?cnRmVlBINHZCWFh6c2VweGc0cjJEMVVYUzFjVmc3K1FCV0JQZDVqR0FmNkFk?=
 =?utf-8?B?SktMNHhXWmE2QTd3RVlpVWVlTHpsS3dKcDZmWldTRUZLQ2NLLzQ1Vmh5a2ty?=
 =?utf-8?B?L2g2ZXdGZWVPTWdOVUhTSFNKenJyeWwxUjZ1MVVzRGRGY3plZ3ZxRDVERWh5?=
 =?utf-8?B?VVdpRjBGTlZaVXIvbm5IMmw2L0hsVVF6UHVJYURNeWo3YTM0aVE4akxiZmZO?=
 =?utf-8?B?VzhlMDVHcVE0Z2NWUVlvRWttNDJxRFVnSWs0ajF3cEIxc0dyclVHK3JjOVdS?=
 =?utf-8?B?Nm1wZTE0WVZ2NFQwc1NMQm01L3Y5U0lVNVdHNFlycFVUVWxOTm5HaGduTjls?=
 =?utf-8?B?STJXVUNFOUFMVllmQ0J0Y2tHdk16dHlvdzBpNDA0NUdOZXcrTzhHZEFHN1dW?=
 =?utf-8?B?QmtNRFBsUEVkOXdmK0FMUlZHWDhhWFViSXJPamlMMkpmNjJEV3l1eXhHQ0kv?=
 =?utf-8?B?WUZTU1lodjR0eUp3YVkrUmhKeUlHUWdkRzFMNFRsYXRSQm95amF0YzREbnYw?=
 =?utf-8?B?cGpFRXpBSUNHVWYzODNzNGpNLzR3N2xSaXVwSEcybGFrRU81OENlVkhQbnBK?=
 =?utf-8?B?WnNZMXNpNFV6ZGJwZGpIN2o0SFBJSDNCdURkS0JrSkJQTlc2bVdVZ1czYVBq?=
 =?utf-8?B?ZXpGQjNkUHcxT3kzRHpQTzRMMko4ZnY2UFYrRmZTS0RNMkV6YWcrZGgzL0NT?=
 =?utf-8?B?TEZ5anJ2bE8ybk05RDB4YzdVNTdxYU1sSjNwRTZnREdjdEU0SWtzckRHVjRu?=
 =?utf-8?B?a08xYjRzdm5qa2JuK2Exdi9nUGtzeE1LVkpkem9ET29kWFRjNUVTQ0ZWUk5Z?=
 =?utf-8?B?QnlRUVFwQVloNWNzdGhxRDZET09xVWw5UXpGMmg1RzN2cjJFRSsxRU1XOUp2?=
 =?utf-8?B?eUFDd2ZHMVJKQkxzQkd0WWx0Y1FxMGNDSGN5MEloSEpFQkVuUlZUb2p1US9G?=
 =?utf-8?B?VFNveGlDbmdHTmlRRnhoQll0bVJDRnRWRWlhdTRZd2g0WFErZ1FSclliQWJF?=
 =?utf-8?B?Y2VienlKczZxSVl1cEMxRGZVWkNkK3E0OTFRVk5BM0JBSWR0a0FGc2cyUUpQ?=
 =?utf-8?B?VU1wR2ZiWi9GVEEyelNnZnUvL1JTWjZ4TDd4c29tWGlOY2VCcUlxcDFmUWZH?=
 =?utf-8?B?SUpITXh5K1BUTWZxVXZUM2Z3TzIrSisyYU1tS28wRUwxcnhhVkFpTGE5T0hT?=
 =?utf-8?B?dTJvcEYvYlpLVWYwU3l5VVhEU2F2UFJmNWNDODlERDdyRTh4OGlQNnBaelJs?=
 =?utf-8?B?czgwamxQRlpFZzgzVlJQOVFoRWptdVF3QWpQbzRTZzhyN0wrQTJRTm1aL3Vi?=
 =?utf-8?B?QXlyU1VyMGJyQmt1OUsrL2tVeUpJWVdjdWhabFowSHJHWkRSOEQxNGFkNXhk?=
 =?utf-8?B?NlRwYzFIQnJ3aFIrYk5uQ3pUVXZFWlFTTHFyWHVyTzlDZ1NRdGxjV2hVUSth?=
 =?utf-8?B?cEtWUm8vcGNERUJ5clVhbG9DeUdDaENLNjI4b1hvMWFYbThyVmdSMWMydWp5?=
 =?utf-8?B?ay9lVVNEbXVtZk9EY3E3dTY4STVDQmFOY0xiM1NCdTRZUkp0TVFHRkhhbTBw?=
 =?utf-8?B?T2o5ZERsa2hZMUdhVFJZNCtJY0c2dmNPamZ1ekZ6MDM3SnU2dWh3TGZza0hO?=
 =?utf-8?B?K2JKT0d1YklVaFpYN3pTWHZ2QVk1RVBRU2Y1dlhyb3BQb2N3THFiaUlKYVpF?=
 =?utf-8?Q?ehUFpO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNWZEY4SHFZU1dWTkNzczBGWWZHc1R5SE5XNFhFNHpEQU0zbzg1cFhVOXVv?=
 =?utf-8?B?cjFONGs4MWZyaUVNb1MyUEJlSUNNeFpDeFNKQVAwUWV5ZEJOcDFsdnZTTVQ5?=
 =?utf-8?B?MmQrS2lzRUd6Qy9iTU1lUVBya2JYSGFZbWJ0TDB4TkZVWVdEeis4WkR6cFF5?=
 =?utf-8?B?WVRXSW5jTWZmaktoTzNXdDlvaUFRODBqbUxid1JpQlJKUlR5ZFpqVDRJaG9I?=
 =?utf-8?B?RjAyY21QQlVNa0M3L1hwSG5LU1NkNmRwaTZweTQwamhZblE2SjdiNEMxNzBC?=
 =?utf-8?B?cnY3VVNSM2I5eVdNWDhuVzRLYmFOTE9MN3BwY1RLL1VnTVNhQUorK2FaY0pG?=
 =?utf-8?B?TXJlYTdVWDEyMTJ5YkN2NHppcFNmZ1liMWl3TUs1elMzTDU5QXJvR1pYY01z?=
 =?utf-8?B?NU9oOEV5U3MwRDdOSTZhak1BakdScDI3Vi9yaUpIM3NZRVJNK3RCekhET0sx?=
 =?utf-8?B?dWVjeDlKRXFwcGl6aW80TGxVTGk3Z2ZTbzYyK0JvZklxOHMrSXdsTGlXNkZz?=
 =?utf-8?B?Y3ZGQXZidUZSZWRKMHdLNStBOGRvUWh4M2tZVzRmRlpGTFlpT1BXNi9YRG9l?=
 =?utf-8?B?Qk5PNm1VNmNSWEZFRHZ4VnJUTTJDTExaRHNqZnA2VStJaDdTRDRBMDU3aDd3?=
 =?utf-8?B?T1F0UU9Ocmk3TUk5MUptYmxoL0xJSnR6Y3RhOFY1UUtNNnBybEdQeWlqYWp6?=
 =?utf-8?B?NkxuVU5UWGtXTHpGd0xtYUxWZnU0cEYxZFM0bWtta2xmT3prbERvZWY2aFdG?=
 =?utf-8?B?aFJEVzUwdnJmdUkvN0RGVitZYTcxaEowY2JTRWRjL1ZOVkd5di9WZk1WRHBs?=
 =?utf-8?B?cE9CN3UwNTBqVkFlVy8yYXUzOFo2RWM2U1ZiL3Y4QkxLR3BiQzUzdWY2TEl3?=
 =?utf-8?B?OW1ESzZ4UjBuVldRNkh4TFIzTzcvTFlJV2IwZDlDb3Zhdy9zYWh5anNwQjA4?=
 =?utf-8?B?U1NqUU9FT216UHdzbU1oZTcxZzhKVUJiZnpXc0xXeWwzelFOWmhpdk9vTjl5?=
 =?utf-8?B?K2pJVXRyMDhHZitsM1d5NG1nb1oxTEtEbnBQcC95eHA1T1A4SlJwUVJZVnJW?=
 =?utf-8?B?VFoycUdYMTZ1aGxKbXdwSHlrQk02NzJoWHpzTmNGZmI3blZvSEUzVGxhUkkw?=
 =?utf-8?B?R2hWQ1E4KzI5NVh2dVd1cGEvMEpNblYyMVA0Vm9DeVZkbDhPNVBUN2VCQjdy?=
 =?utf-8?B?Y0ozREZDRXFRTnN0VWpGRmV5RmJhZGZHMHdvc01rRUxtM2Nsa0JFU2kzU1JN?=
 =?utf-8?B?SEtQaDR3UUJlNEpnTHpZbFNROVJmQmlENHhIVHl6RDV6emZtaDg4UlRHRnA3?=
 =?utf-8?B?VG1NaGpRKzFqWEtjakI1cG5aZktpWG1NYlJBNWVHMTFzVmIwcTAyc1llazhG?=
 =?utf-8?B?NE94QmdEWmJOc0p6S1ZVZk1Fd2FQcFVBa0tmbHlrZ010OURPWCswWFpRekJJ?=
 =?utf-8?B?RHhjcFphVFpyWWtTN1dkNm1GMTlNdHVpRnVKRTkzVWRrYXB4V0R5NitZK3dZ?=
 =?utf-8?B?NVRZc2xKdnFaSmtjMnp5dVYvOWU2N0RyTER1RlJKYmd5c09XVDhZWWx2bEI3?=
 =?utf-8?B?TVRVT2FmZ25NcnpxQjZibVYrNWFvT3Y3bmp1clI3bVltQlZ2TGRmQzA1UGUy?=
 =?utf-8?B?VXMxNDhHZ25BUGNvZzY4K2lSUFJGMm03THpYWElZblJBbHhVUHB2OXIzYmdQ?=
 =?utf-8?B?ZnJ2NS95N0VmOGprajJuSXVpTkNKejVLaTVBcnlMYUhxT2poVTdVMmtrYnpr?=
 =?utf-8?B?Qm45dElybW1sZk4vUW1Uak9LekQ5N2NDbWMrc0M2dEd1cjFKeENzTkJPUWtD?=
 =?utf-8?B?RVFCVldYcTMxam5tb1Y3ZFgxUHVXREs4dWEzanM2TDRGL213OEZxWnZ5NEx0?=
 =?utf-8?B?MFp0ODB3bnpMQndzbnlIS0RtTnBmZUtIL1J3cG9hZktWYUthQm1sZzk4VGJi?=
 =?utf-8?B?OU9zZWd6c25TaWZSU2Rva3BIdVU3ZGJuSHpxK3hYejluNDd3MlRDUGlwZHRa?=
 =?utf-8?B?QnV1dXREUVY3V2c1bytROTUvOGF2RjhHTnBkZTdQa1JLTDdwZVlTWmxzTG1D?=
 =?utf-8?B?dm1PeFNUYU9iTndrZnllcDdnUktDKzdaSDF5RkhYWVVSS0hMcE9EZEU1Snor?=
 =?utf-8?B?ZVM4YzFlaGRZNnJGRExIY1pJbS9rS0hjeks0YjlnVzRqejBTdlF1Qy9jQks4?=
 =?utf-8?B?Y1RvWkxvbnBUWWJhZ2ZnaDNXM0tPMUNGdXFBekxVUEh6bHZubmpjbDdhRSs1?=
 =?utf-8?B?Y1RCMEpWTGUzOHIyOVFKTm1FVCs1ZklhMkFEWExic3REd3dnSk9wVlNOTEdQ?=
 =?utf-8?B?YzNzM0FQYWpiK0lSOFRQMklRYmVFYnR1WG9pVUxDYlVuVUp2Uml0K3MySWhZ?=
 =?utf-8?Q?tDtKjLrYwyf8Qf/M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b714cc-8c1d-4814-4a27-08de5e9d0d85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:42:56.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhdX9KSIFEO9q80lxCWvluM2ztcenr+ui1uPXqmWdCJvp0yl+2ynqUthhtMgqhzvtIPBgvS0bkSiBwIpA/VQkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8C576A7DA2
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:14:58AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 27, 2026 at 04:48:36PM -0800, Matthew Brost wrote:
> > Add an IOVA interface to the DRM pagemap layer. This provides a semantic
> > wrapper around the dma-map IOVA alloc/link/sync/unlink/free API while
> > remaining flexible enough to support future high-speed interconnects
> > between devices.
> 
> I don't think this is a very clear justification.
> 
> "IOVA" and dma_addr_t should be strictly reserved for communication
> that flows through the interconnect that Linux struct device is aware
> of (ie the PCIe fabric). It should not ever be used for "high speed
> interconnects" implying some private and hidden things like
> xgmi/nvlink/ualink type stuff.
> 

Yes, the future is looking forward to xgmi/nvlink/ualink type stuff. I
agree we (DRM pagemap, GPU SVM, Xe) need a refactor to avoid using
dma_addr_t for any interfaces here once we unify this xgmi/nvlink/ualink
as dma_addr_t doesn't make tons of sense. This is a PoC the code structure.
s/IOVA/something else/ for interfaces may make sense too.

> I can't think of any reason why you'd want to delegate constructing
> the IOVA to some other code. I can imagine you'd want to get a pfn
> list from someplace else and turn that into a mapping.
>

Yes, this is exactly what I envision here. First, let me explain the
possible addressing modes on the UAL fabric:

 - Physical (akin to IOMMU passthrough)
 - Virtual (akin to IOMMU enabled)

Physical mode is straightforward — resolve the PFN to a cross-device
physical address, then install it into the initiator’s page tables along
with a bit indicating routing over the network. In this mode, the vfuncs
here are basically NOPs.

Virtual mode is the tricky one. There are addressing modes where a
virtual address must be allocated at the target device (i.e., the
address on the wire is translated at the target via a page-table walk).
This is why the code is structured the way it is, and why I envision a
UAL API that mirrors dma-map. At the initiator the initiator target
virtual addresss is installed the page tables along with a bit
indicating routing over the network.

Let me give some examples of what this would look like in a few of the
vfuncs — see [1] for the dma-map implementation. Also ignore dma_addr_t
abuse for now.

[1] https://patchwork.freedesktop.org/patch/701149/?series=160587&rev=3

struct xe_svm_iova_cookie {
	struct dma_iova_state state;
	struct ual_iova_state ual_state;
};

static void *xe_drm_pagemap_device_iova_alloc(struct drm_pagemap *dpagemap,
 					      struct device *dev, size_t length,
 					      enum dma_data_direction dir)
{
	struct device *pgmap_dev = dpagemap->drm->dev;
	struct xe_svm_iova_cookie *cookie;
	static bool locking_proved = false;

	xe_drm_pagemap_device_iova_prove_locking(&locking_proved);

	if (pgmap_dev == dev)
		return NULL;

	cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
	if (!cookie)
		return NULL;

	if (ual_distance(pgmap_dev, dev) < 0) {
		dma_iova_try_alloc(dev, &cookie->state, length >= SZ_2M ? SZ_2M : 0,
				   length);
		if (dma_use_iova(&cookie->state))
			return cookie;
	} else {
		err = ual_iova_try_alloc(pgmap_dev, &cookie->ual_state,
					 length >= SZ_2M ? SZ_2M : 0,
					 length);
		if (err)
			return ERR_PTR(err);

		if (ual_use_iova(&cookie->state))
			return cookie;
	}

	kfree(cookie);
 	return NULL;
}

So, here in physical mode - 'ual_use_iova' would return false, true in virtual.

This function is also interesting because ual_iova_try_alloc in virtual
mode can allocate memory for PTEs on the target device. This is why the
kernel doc explanation for Context, along with
xe_drm_pagemap_device_iova_prove_locking, is important to ensure that
all the locking is correct.

Now this function:

static struct drm_pagemap_addr
xe_drm_pagemap_device_iova_link(struct drm_pagemap *dpagemap,
				struct device *dev, struct page *page,
				size_t length, size_t offset, void *cookie,
				enum dma_data_direction dir)
{
	struct device *pgmap_dev = dpagemap->drm->dev;
	struct xe_svm_iova_cookie *__cookie = cookie;
	struct xe_device *xe = to_xe_device(dpagemap->drm);
	enum drm_interconnect_protocol prot;
	dma_addr_t addr;
	int err;

	if (dma_use_iova(&__cookie->state) {
		addr = __cookie->state.addr + offset;
		proto = XE_INTERCONNECT_P2P;
		err = dma_iova_link(dev, &__cookie->state, xe_page_to_pcie(page),
				    offset, length, dir, DMA_ATTR_SKIP_CPU_SYNC |
				    DMA_ATTR_MMIO);
	} else {
		addr = __cookie->ual_state.addr + offset;
		proto = XE_INTERCONNECT_VRAM;	/* Also means over fabric */
		err = ual_iova_link(dev, &__cookie->ual_state, xe_page_to_pcie(page),
				    offset, length, dir);
	}
	if (err)
		addr = DMA_MAPPING_ERROR;

	return drm_pagemap_addr_encode(addr, proto, ilog2(length), dir);
}

Note that the above function can only be called in virtual mode (i.e.,
the first function returns an IOVA cookie). Here we’d jam the target’s
PTEs with physical page addresses (reclaim-safe) and return the network
virtual address.

Lastly a physical UAL example (i.e., first function returns NULL).

static struct drm_pagemap_addr
xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
                          struct device *dev,
                          struct page *page,
                          unsigned int order,
                          enum dma_data_direction dir)
{
        struct device *pgmap_dev = dpagemap->drm->dev;
        enum drm_interconnect_protocol prot;
        dma_addr_t addr;

        if (pgmap_dev == dev || ual_distance(pgmap_dev, dev) >= 0) {
                addr = xe_page_to_dpa(page);
                prot = XE_INTERCONNECT_VRAM;
        } else {
                addr = dma_map_resource(dev,
                                        xe_page_to_pcie(page),
                                        PAGE_SIZE << order, dir,
                                        DMA_ATTR_SKIP_CPU_SYNC);
                prot = XE_INTERCONNECT_P2P;
        }

        return drm_pagemap_addr_encode(addr, prot, order, dir);
}

So, if it isn’t clear — these vfuncs hide whether PCIe P2P is being used
(IOMMU in passthrough or enabled) or UAL is being used (physical or
virtual) for DRM common layer. They manage the resources for the
connection and provide the information needed to program the initiator
PTEs (address + “use interconnect” vs. “use PCIe P2P bit”).

This reasoning is why it would be nice if drivers were allowed to
dma-map IOVA alloc/link/sync/unlink/free API for PCIe P2P directly.

> My understanding of all the private interconnects is you get an
> interconnect address and program it directly into the device HW,
> possibly with a "use interconnect" bit, and the device never touches
> the PCIe fabric at all.
> 

Yes, but see physical vs virtual explaination. The "use interconnect" is
just one part of this.

Matt

> Jason
