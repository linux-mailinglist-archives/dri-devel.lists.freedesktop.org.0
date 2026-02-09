Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCyQMLMHimluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:13:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6D1125F9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0881C10E42E;
	Mon,  9 Feb 2026 16:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAMMXgP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7E610E42C;
 Mon,  9 Feb 2026 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770653614; x=1802189614;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S08MlH+AnGnF0fhCyCd+lg4G8OSurx+6cxAzE6wiPDw=;
 b=jAMMXgP2cwXgsDlSy99VFmNzbd4fHtwSNU8XzHOEtUgOrIDZvL0LxfGI
 xt9E3pxbTi0LjVzMdKZm9jdCKIdk/OxXUxwSUfm3lFufsSslaEvhdDjnj
 RtGryyIiTrDVOewePMyrTSK+XAOZYkZXUeLsHnNcLhsIo12lMmcI8kEuf
 IO0w9ZyNopO0MgpfoLoj63k5vyZucaZsQCmXA7uzkjswNMCTCjmD5VpDN
 4I6mxaBeK1y8R7ys5/qyZdc3vQDI869qD8R7enOMPr3xCDQQBxa2gCwmH
 Cm6MxlIeAzS1qrz1b1j7cC/bi9sJeglWpXwdM9ZnQSkKbWwmuiCoTut2G Q==;
X-CSE-ConnectionGUID: EaUlrsl2RwuEsB3CynVN8w==
X-CSE-MsgGUID: 8TK3BM4gSxK7S/M7ThokTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74365429"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="74365429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:13:33 -0800
X-CSE-ConnectionGUID: v4uPc96MR76tjEsQjJlQog==
X-CSE-MsgGUID: OU7HTNTLQeiEikh1auMQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="249254427"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:13:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 08:13:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 08:13:32 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 08:13:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCYFkPReFRY+cz9tvWPvm3yMcFRAtx1/p1pQMvqedHwdmqQX3ljiDMD57R4noQXQKK1NrGbWRxTvHi4NiVf/1YFKdr2u9Vl50O/70IomuWqDhzHmiafZA3arwaXy2yXylX0qbtjv31buE9lMqpxpeH/rcNjFlS9/nJwrGYFF4QrdvdpJeYL49Psq04iWbcyTp+GneXx+H84UZTjNdFMaVT7pBQA/X6QcS9eeYTk3g7ZY16tXJGfPHIz3ndGjbwCxhRtm+AKJJJgrLSAFmlxifYnP1Wvgq9pHsT0PBqL8mZcU/9n89oV9lY/ZekGKA6OKtlbO4ufJOLnQeV8A0pEP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie8Onb55bvMGiAvZE/hPjsLebs7azr4IuHS6V9iQ1As=;
 b=PQ23ddZjbcX+tqkdySNA23xAONEOeApaxxg7LZv93gFMUU9B9fVCWMxr6mJUq7oMgFPGv3GPtarxKbF6xoH2AXxcmsOfyCUjmDvzmH7QEGiCP0ullQN5f4sS91AYvF8AgRI8fpPb9IH65ccwixyVQB0EgTdy1hz7zpBEu6LVQEVRCLXVTd0iSChiXXFFM6Tadw70Ylq6jwhKMn39Z9IvE0qFPEU/WNEOL7xQbijZchB6+uAUetr8gEhl89wfEw0dM5bFpZKBTxMxk0xRRdUfEPLEKItkXF0k4Z4/uYP9Wz0EajhzraZpGi+wcloI3XHCs5gkM3siPsmFLYz/8R94JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 16:13:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 16:13:30 +0000
Date: Mon, 9 Feb 2026 08:13:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <jgg@ziepe.ca>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 2/4] drm/gpusvm: Use dma-map IOVA alloc, link, and
 sync API in GPU SVM
Message-ID: <aYoHp5s393jWqqNb@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-3-matthew.brost@intel.com>
 <a49090041ce136443dc75d7f9dcd7e2fddbe90bc.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a49090041ce136443dc75d7f9dcd7e2fddbe90bc.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e7b06d-a41d-4fd9-c660-08de67f62a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HoaTVw/Iou9uVfLhjeUbow7WgibTCqxbKfsNL5otlnuenAk7s+E+gN29XO?=
 =?iso-8859-1?Q?fQNrMijDmDh9umz5mfjLADCD39gxzxZDuAeVNqyQsv1WDdeyjXYFm4GRTH?=
 =?iso-8859-1?Q?ho3y3zDg6Qb+FLv70V7GnTpnZDc/NbCq1OtwaJ8RbUFi/g1QT0bs9wlfoH?=
 =?iso-8859-1?Q?8ROwuHc1L9Gb2/bwWjYqoNbdioZt4hy7kKdeJBgYMv3cYifrd0m+QHVwHn?=
 =?iso-8859-1?Q?Yd//kEYOwaCONA1fe5QnlDECZB1x5K0NRPgTh+RHw8lVG4LDhBAMDKv6qC?=
 =?iso-8859-1?Q?gvLGq73DAnam2WRFn5aO/T+nHJSLqAe4Svx98szLj0YMTsWRdVgROkYuQp?=
 =?iso-8859-1?Q?Qcca5BBN8mUyaKbF0R2y7GFqXvTzTPL5qYYR6ftWS1OWvqvzTdQSoTFjJx?=
 =?iso-8859-1?Q?BZF0YwEi6kRzbfmZPDI31CzCVcbc8XAnbZdzmu+Aoezmiuo8uCzUJCrs5B?=
 =?iso-8859-1?Q?KYKtk+I9/I8s+QhZB/RX3WHtQ15aLS5AIODkIoX21CC4Z6pAL6vSCHAOeb?=
 =?iso-8859-1?Q?te2et2VnoN8VdEw61lbuks/48azsvEQWgGx3UTymTvOlvV7vZFvVHSMXfK?=
 =?iso-8859-1?Q?JwOdSdrpiz9MvqeW7qez5Y0ZnQPWL7xnhOG7XOw/NYgI05DKIbIMoc77DM?=
 =?iso-8859-1?Q?n8OJh8zvXUudSaPAiF2N9Pqzo8XMWQOhH/EOic2eNxcMQhbiMtK+qjtqMP?=
 =?iso-8859-1?Q?dlXRJR68VomdQBs8Fxq9gkSyVgkuKDoZyM6E0AtC/DO9H8ZKFtYzi6YQRI?=
 =?iso-8859-1?Q?Zy2m1w6iiSHsZBJUsF3sHfClJ8K85QEvzKGikym/HwD6oB/Xhd3Z4GP7tB?=
 =?iso-8859-1?Q?GoO8WACfWoaf0bUQ0FWg8tBNzCCb2GnBNhfndA0JqQGj+l2SiuFHfkXX3z?=
 =?iso-8859-1?Q?OcK7SgdmPQpsqqYRxrOzjWV75M8jHmYaOVVCsyQHfqowQpBzAu5LB9ZAHx?=
 =?iso-8859-1?Q?+BGkNapZ6WMAcrr8Y+xIDPBJrNwovojtf/wSNywSF7kksxyWLInjbXziXo?=
 =?iso-8859-1?Q?dggKsWW5vUsKH7GVedZJ2yeLBBssxsZ4V3EOf5fgMVQXUoJRmHM185kUgs?=
 =?iso-8859-1?Q?TTDtXvZ3awi2Wt5ya3RjxVnh2nXmYdK6zgg+si8eKv/Y/viQbZwEDegTzs?=
 =?iso-8859-1?Q?eFIIwuoU5YSI/r/aRr2EcNJp1e36IsZ7PH8MTYTO1YZkSFsqYUGpaarK5f?=
 =?iso-8859-1?Q?T2ins5brfsncaRxhTzZ/I9m65vnJTDi1+bXfp8o5p8Zf9sR8zJ/M8LQOGt?=
 =?iso-8859-1?Q?zawDxi7GOnB96HhJEr9u4JMOdMQsn2XdOjKQJFi6LChckmTZtEWsWVKmN3?=
 =?iso-8859-1?Q?BSU4y3pyznctdgZlGJftSds2/JzufYCqnP8iA3aYqWU3F0opTlZVCyqo0v?=
 =?iso-8859-1?Q?gy4Y170xd+WLihmJxewFNRa/2KLs3KoRpc+xU7DhrWWGu//kGlycH9MM0x?=
 =?iso-8859-1?Q?aCSj/Ie0jdALRkU6VtPVOTdapyS/iKtKq1thV6qkKN0ZQjzMvTXkL7bYhE?=
 =?iso-8859-1?Q?VyhF7YGY8T2+YVWF7jAxQiMNoV51ZsDokOJ0fAkln359d40KcS2LveALuU?=
 =?iso-8859-1?Q?WWDxKG74SDAqwOT6sB771VRWHBTT9DHuXEA9PE5lTryd3OgayThCv7PS1R?=
 =?iso-8859-1?Q?Kzrc8LBVr0aTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jDpAGtQ0ZcZqeOU0F5aVik8+DmrwDrsQzR4G4+bHo7EKm4dLhYsqZ8kTeJ?=
 =?iso-8859-1?Q?EoNd6nRlZZ26MRG8zI2wsijRWDT0gr4/P+6CwVClKi6quJEkGWsC9cXA5M?=
 =?iso-8859-1?Q?/8CCK2viJebRj51dm/FqW4mCsHO/kEoaF8rO6eQNsLPJJhzZvxjvbLoyhn?=
 =?iso-8859-1?Q?BTszv/CAStByBkjHVYqnL4OnGnSntcAPCpxqv8Nx7K/9cxG7uoPJBJLO9X?=
 =?iso-8859-1?Q?kr4yek4EEQlaR095BL5BljpNw4PrJsLZoxef1TBf04xxxoO1PzZ7rtfG1j?=
 =?iso-8859-1?Q?dXQ/pql7knQvp8Yuzq/T5s0Y3DOIKDnxjfJsQBjPLurIQrkkvrec5PosZB?=
 =?iso-8859-1?Q?Ync3FMobYdxG85HUlJ0rUZ/md+jD2wTTbulxPF1sh2wNr/avnJ6K5EMJbk?=
 =?iso-8859-1?Q?wJfofpKb3UuHHbdPuTUXSRlLirQRrbs6x5cDTNbzb65+Cfyl3abBXZCg+v?=
 =?iso-8859-1?Q?G71Rsy8m10FJTwvxSjDZMQj9YHPbqgh7h80nkOftkJQKG1hqTfDT76Lwjj?=
 =?iso-8859-1?Q?mWffcnMuVQduLlSSrrtdWynyc9EtxjwFF9XhayDjM9n4OTpUYg2E4tBlqL?=
 =?iso-8859-1?Q?UYOqEb+57Bwzziyq3klz4awH6RsBS/JZ+fpRfgtujGB0es6JAHxzQP3aIx?=
 =?iso-8859-1?Q?MOXmh1M1ntsab1iePttoGKgj4MUGRBNHu+Yw5gJcSm1LDC/7YOA9Djela9?=
 =?iso-8859-1?Q?5Zv9Mc5OU02wZpptv7N8zKVUQjb4ThEjEpk71ErMYbfnGD+pIgObcl5DBp?=
 =?iso-8859-1?Q?om78ssWPc4xG5Z6rGhjYl4huAmEZAQuqCJyLGsCgoE8cYm2XzVaonxqSia?=
 =?iso-8859-1?Q?rF3L7O72mjF/0IGJNPuRKNh4ZtR55HdEHrZ3+mowqq660/HjjOVWazmSW0?=
 =?iso-8859-1?Q?Kuw2OfR0kmOlmS2fH3soHKErcGjpC+uLMB9DqmHgytmlOp8Q8W/TfASlKb?=
 =?iso-8859-1?Q?h1orqPe9WZMVSTX+6qG3wbl9hhf6gHu2k3dwLkMgFlsqUoAHc8HaNnO2r5?=
 =?iso-8859-1?Q?xU8Fuo4TRjE6YAVj2FkA8MdAg7LtxUP21TtBkDO2QZnqj6kUoGOp9oaynp?=
 =?iso-8859-1?Q?YDFwxG7UOFBRmBzhvdlrT+dI7nS3k1RY18rB+nxtxFceQFBACtaaeojy5e?=
 =?iso-8859-1?Q?O3YbwjaWnX04rMilcjZYW7JEAYV9PCvQR8A/0ghoHNzquWg/MPEXNY9a7Q?=
 =?iso-8859-1?Q?zkk5ftvd/s/v2vUeEk4H7xPjCgPMNDoZ5ccmuGuE9VW/G4nkONReWIu9dd?=
 =?iso-8859-1?Q?VVnSd3JfO3+I3O7iPlaee/2iSyXF15FxfTt9H7986kuelgsq9b32m7Gj5N?=
 =?iso-8859-1?Q?1WMFYkrfhyTPkL0/PaVKTQJQpHoggWPegOI7bM/a/9WoxAz44G73aqZKv2?=
 =?iso-8859-1?Q?iJMvPpM1KL5J1MZlB/MdfEWQ56pb1Hb9Wns+RThrA5qRYWU73vV4llaMhe?=
 =?iso-8859-1?Q?SLigbPvrZ6VWyhTnIuiNyZzKmmWeEcv3ZnoM7AeydWY3x0qi8ftfBqCu8o?=
 =?iso-8859-1?Q?+1PV8ORuHDKPoEIccNbOOT6jG+ZFfbtLqwv2TZTLa9BLDgfdIOmnKtPW9+?=
 =?iso-8859-1?Q?EzPIFzz13EtT8JNKd0fUwvOevdGb6jaMB8z7Pf8Bje0BWqlgBF+AgFEX7A?=
 =?iso-8859-1?Q?zebsHT5p2+YuKUdxnztGA4brmprCxf8hpO5hXPJ9h96kzGk7C6oB0mvrir?=
 =?iso-8859-1?Q?Nytz8QhS1Hbe8we1Hu8SB7VDNXkV0lvf3pWr66ciLR2AdENS2qdQ80zWUX?=
 =?iso-8859-1?Q?gAs/JXR+rfbg3Z2DuoOdo1zXuKmiMR73uMpjNKi2PjuGzXemfBUBpO/QF9?=
 =?iso-8859-1?Q?lUX+4boIBIWPtu7yVo6Y8+EJ7XJQqmA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e7b06d-a41d-4fd9-c660-08de67f62a02
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:13:29.9585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xEJQKzCslv3k6UKKRqYEDwdqSaKnpigCh5xcw6A+qPQzGD7pkivsIfdBkkayM1CWAA6/2t8L5sPEnHuAD/6wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6682
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 03B6D1125F9
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 10:44:43AM +0100, Thomas Hellström wrote:
> On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > The dma-map IOVA alloc, link, and sync APIs perform significantly
> > better
> > than dma-map / dma-unmap, as they avoid costly IOMMU
> > synchronizations.
> > This difference is especially noticeable when mapping a 2MB region in
> > 4KB pages.
> > 
> > Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
> > mappings between the CPU and GPU.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > v3:
> >  - Always link IOVA in mixed mappings
> >  - Sync IOVA
> > v4:
> >  - Initialize IOVA state in get_pages
> >  - Use pack IOVA linking (Jason)
> >  - s/page_to_phys/hmm_pfn_to_phys (Leon)
> > 
> >  drivers/gpu/drm/drm_gpusvm.c | 55 ++++++++++++++++++++++++++++++----
> > --
> >  include/drm/drm_gpusvm.h     |  5 ++++
> >  2 files changed, 52 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index 4b8130a4ce95..800caaf0a783 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1139,11 +1139,19 @@ static void __drm_gpusvm_unmap_pages(struct
> > drm_gpusvm *gpusvm,
> >  		struct drm_gpusvm_pages_flags flags = {
> >  			.__flags = svm_pages->flags.__flags,
> >  		};
> > +		bool use_iova = dma_use_iova(&svm_pages->state);
> > +
> > +		if (use_iova) {
> > +			dma_iova_unlink(dev, &svm_pages->state, 0,
> > +					svm_pages->state_offset,
> > +					svm_pages->dma_addr[0].dir,
> > 0);
> > +			dma_iova_free(dev, &svm_pages->state);
> > +		}
> >  
> >  		for (i = 0, j = 0; i < npages; j++) {
> >  			struct drm_pagemap_addr *addr = &svm_pages-
> > >dma_addr[j];
> >  
> > -			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
> > +			if (!use_iova && addr->proto ==
> > DRM_INTERCONNECT_SYSTEM)
> >  				dma_unmap_page(dev,
> >  					       addr->addr,
> >  					       PAGE_SIZE << addr-
> > >order,
> > @@ -1408,6 +1416,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  	struct drm_gpusvm_pages_flags flags;
> >  	enum dma_data_direction dma_dir = ctx->read_only ?
> > DMA_TO_DEVICE :
> >  							  
> > DMA_BIDIRECTIONAL;
> > +	struct dma_iova_state *state = &svm_pages->state;
> >  
> >  retry:
> >  	if (time_after(jiffies, timeout))
> > @@ -1446,6 +1455,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  	if (err)
> >  		goto err_free;
> >  
> > +	*state = (struct dma_iova_state){};
> > +	svm_pages->state_offset = 0;
> > +
> >  map_pages:
> >  	/*
> >  	 * Perform all dma mappings under the notifier lock to not
> > @@ -1539,13 +1551,33 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  				goto err_unmap;
> >  			}
> >  
> > -			addr = dma_map_page(gpusvm->drm->dev,
> > -					    page, 0,
> > -					    PAGE_SIZE << order,
> > -					    dma_dir);
> > -			if (dma_mapping_error(gpusvm->drm->dev,
> > addr)) {
> > -				err = -EFAULT;
> > -				goto err_unmap;
> > +			if (!i)
> > +				dma_iova_try_alloc(gpusvm->drm->dev,
> > state,
> > +						   npages *
> > PAGE_SIZE >=
> > +						   HPAGE_PMD_SIZE ?
> > +						   HPAGE_PMD_SIZE :
> > 0,
> 
> Doc says "callers that always do PAGE_SIZE aligned transfers can always
> pass 0 here", so can be simplified?
> 

 * Note: @phys is only used to calculate the IOVA alignment. Callers that always
 * do PAGE_SIZE aligned transfers can safely pass 0 here.

So 0 would be safe but possibly suboptimal. For mapping greater than or
equal to 2M, we'd like 2M MB alignment so large GPU pages can used too.
I think passing in '0' could result in odd alignment.

I am assuming other vendors have 2M GPU pages here too but that seems
like somewhat safe assumption...

Matt

> 
> > +						   npages *
> > PAGE_SIZE);
> > +
> > +			if (dma_use_iova(state)) {
> > +				err = dma_iova_link(gpusvm->drm-
> > >dev, state,
> > +						   
> > hmm_pfn_to_phys(pfns[i]),
> > +						    svm_pages-
> > >state_offset,
> > +						    PAGE_SIZE <<
> > order,
> > +						    dma_dir, 0);
> > +				if (err)
> > +					goto err_unmap;
> > +
> > +				addr = state->addr + svm_pages-
> > >state_offset;
> > +				svm_pages->state_offset += PAGE_SIZE
> > << order;
> > +			} else {
> > +				addr = dma_map_page(gpusvm->drm-
> > >dev,
> > +						    page, 0,
> > +						    PAGE_SIZE <<
> > order,
> > +						    dma_dir);
> > +				if (dma_mapping_error(gpusvm->drm-
> > >dev, addr)) {
> > +					err = -EFAULT;
> > +					goto err_unmap;
> > +				}
> >  			}
> >  
> >  			svm_pages->dma_addr[j] =
> > drm_pagemap_addr_encode
> > @@ -1557,6 +1589,13 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > *gpusvm,
> >  		flags.has_dma_mapping = true;
> >  	}
> >  
> > +	if (dma_use_iova(state)) {
> > +		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
> > +				    svm_pages->state_offset);
> > +		if (err)
> > +			goto err_unmap;
> > +	}
> > +
> >  	if (pagemap) {
> >  		flags.has_devmem_pages = true;
> >  		drm_pagemap_get(dpagemap);
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 2578ac92a8d4..cd94bb2ee6ee 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -6,6 +6,7 @@
> >  #ifndef __DRM_GPUSVM_H__
> >  #define __DRM_GPUSVM_H__
> >  
> > +#include <linux/dma-mapping.h>
> >  #include <linux/kref.h>
> >  #include <linux/interval_tree.h>
> >  #include <linux/mmu_notifier.h>
> > @@ -136,6 +137,8 @@ struct drm_gpusvm_pages_flags {
> >   * @dma_addr: Device address array
> >   * @dpagemap: The struct drm_pagemap of the device pages we're dma-
> > mapping.
> >   *            Note this is assuming only one drm_pagemap per range
> > is allowed.
> > + * @state: DMA IOVA state for mapping.
> > + * @state_offset: DMA IOVA offset for mapping.
> >   * @notifier_seq: Notifier sequence number of the range's pages
> >   * @flags: Flags for range
> >   * @flags.migrate_devmem: Flag indicating whether the range can be
> > migrated to device memory
> > @@ -147,6 +150,8 @@ struct drm_gpusvm_pages_flags {
> >  struct drm_gpusvm_pages {
> >  	struct drm_pagemap_addr *dma_addr;
> >  	struct drm_pagemap *dpagemap;
> > +	struct dma_iova_state state;
> > +	unsigned long state_offset;
> >  	unsigned long notifier_seq;
> >  	struct drm_gpusvm_pages_flags flags;
> >  };
> 
> Otherwise LGTM. 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
