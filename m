Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D479BD261
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7D010E41B;
	Tue,  5 Nov 2024 16:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOGX2gXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F4510E079;
 Tue,  5 Nov 2024 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730824310; x=1762360310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jfWUUkaihPZ4e3ld3sbHlwHDsH0Kcywld0abb3SOcZU=;
 b=YOGX2gXBicY6Q5SxqyxZGcwt2KcCRxY2jmZyC/F3t04JIH9dfCGbRdL0
 3m4zGeVZuiBFmOrmJspJh3OBDuxIVAqwBOgIWrQA73MmQjTJnuQ2w2/70
 QqModeaH6EMf5pbEjJJNRPVWvghfODHBvVobXQQo1ifUVZD2ERy7qkdtf
 rmpKFOw2xHlYj4NBUUwQVDIhPKsCHV1aBY/LTks3WBCN3gbqFf/jXzNb6
 JjmB092ZR2t7TRrj5GcXntwLjjJKmv3NAvKNlTKbZji05eUc2fvk/lG/Q
 NgNojqum4cW9XJhMqw7yzbXBnrQm2ALeKpgq56KJcGOBqaxM+oHzluZc6 A==;
X-CSE-ConnectionGUID: oYyKi8+kS8ms0mSqWmFY5g==
X-CSE-MsgGUID: Px17/3lBTtGL91iqA/F/8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30460867"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30460867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:31:49 -0800
X-CSE-ConnectionGUID: bSeGyRb7TN2nhJ3n98asoA==
X-CSE-MsgGUID: pu0AYuBrSCGQukfdBYWzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88869018"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 08:31:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 08:31:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 08:31:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 08:31:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMC7XmG/9Ln0+vyjTv0HafifjET2NZZv8dyZ4Bja+EczqHTJCCJ4fPsDzVhYMPrtK86V1SS9cgrn1cX9hWGV/WCJ9fQmgVBYc8XzkS6qibH5Zy98n8TFPBUp5s0mgiYJWaRUOo0339NzAAiIOm6ibOW+knnq8XkQxxAj9XQxc5N7dWyZRQ20G6KgCX+qbYCu8DbZAKPpFRgq5NoS8DoEArZOl/jZ+hJp4joDGeHWjTP45TnIULg6wmCI+j4Qjne8VHwDnDIAK7vyG7xI9+8EWgga8imYdXbRg7M39LGmPDFZ7yZRzRZfjKPJNaLNqtC/l1I3b25K5KAG8hsqTv5T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7tLILXKnjK9Ye08//SWBD8QFvwa/ku/yMzgrAe7v/Q=;
 b=zFeEaAXd6VwLsS1BR97OpCiB+5FB5UcV8E5DshrOHDr/3/LIxnTYuX2EBDTubrIfjInDN6eKsWLelucRIXAQgkejT7whMtR8WCIYRZxUnQoqN3WaWHyn+Yw4bqQqDXTY2go673ZaHF/dL0jlM8865XmtoWyqgF3KhU1LBE6icRaTUCDrbw8o6YhcLJGEoywmPR5Kd+2WW3L5qNFXADmqZm5w+Icc9kwpRGd6bE/K9ifNOMCWuNXOMrpBcUN9VQddvB8E1njvP7jH3iuhTNnE4gOMo6edqXlNqOE3ZsL7NGTiTJLCWj0wOsPFcqExDx52E9g9IS1skogtlxY96+S4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 16:31:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 16:31:44 +0000
Date: Tue, 5 Nov 2024 08:32:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZypIj5z3RE/SPzjC@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <2bd1937e4a2c842f3e92de7cb32135d72fa73e1f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bd1937e4a2c842f3e92de7cb32135d72fa73e1f.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6b9599-3660-404d-40ed-08dcfdb75602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kQF3cvnAIfIJ7zr2Fe3xF8Bd4oPF1kB+pQtJ5x+8cD+2yCP9FioXC1v2A2?=
 =?iso-8859-1?Q?AYbI7TEVJO5LbBKl3IQ47hTyc9s2uBnal1s+VD+IeinjEunJuG1H/VeNcq?=
 =?iso-8859-1?Q?ThjFAkPt82FqEnN7c3aaXFA4wa/v9meL9n0OB9B7NFaA1SU4JpUMg4XQ0m?=
 =?iso-8859-1?Q?8vR+8wGNfP40j9nSt6ZSYMVgA9fWB6zCRzIjZ984VSyY0avbRn9uMQeuje?=
 =?iso-8859-1?Q?RoNP51/1rkBG/uf6/kOBTf76WH+nYSH6mQDbiN4mGkoHYLXWRvVu6B+dUM?=
 =?iso-8859-1?Q?Kf06jBigseBpcvbXuI2sl7gw6iFahs7VaXbLkAVmQC7ved5y+m0IjHdKHv?=
 =?iso-8859-1?Q?BhMlFsjdNVDAnmdQo3mBsIGJqMGxRoIcGE73AaT9AffYNxZtSdOh5VxQS3?=
 =?iso-8859-1?Q?7JOx6350Scl9JTHqXufMNTfcCU91pGxPoqywqXRZ+q8RzL4HvaqlJZlm9x?=
 =?iso-8859-1?Q?DY8maXJ70xyrvJ0CizjjUmNO9AN6Q7to5HiubmxpYmtESBd01Z/ovehJ87?=
 =?iso-8859-1?Q?kZzfVmC6QVbqA8sGt/YGuLbYl3SbdKoAbbKdAJzEFPFvfEIkqLAJVpqhP1?=
 =?iso-8859-1?Q?iyan6eT/duzJWrqMPpdTeOcawjXpdwuIQrP/NLba5ti+GJaSQz72Tk/QCO?=
 =?iso-8859-1?Q?DMNLH0R6E0pSsufvedzrt24AdHc8FAXlAhw+IhZRtUnN+bf46Xlj4argCk?=
 =?iso-8859-1?Q?BdSuBsiyo4XoHaJ56nMPtt5KfiudgtqdhIC0voeDdXrWHWtW4vdChRFv0S?=
 =?iso-8859-1?Q?qtmFlHWDeM8Gv2bQ3bKITTazsEjyP+ujFdpXMSO7tYpq/vweZ1/Jmc8KyP?=
 =?iso-8859-1?Q?EUAS8yH4an0/SjGm9AmWvYQ6n1RtsWbT/xr7cgZAbbHgiUiYOzXqUPc6OZ?=
 =?iso-8859-1?Q?gZ4Xk/g9jCuQIblItYScpB1K8YCTZMk4j0AKTXDi+qmFRuV0eNXIPWowxd?=
 =?iso-8859-1?Q?C48JwdCGMq10VOBUOfjqGiVyo248HUOo0VeGzwaO6eGo5XGg50BKG8uxaW?=
 =?iso-8859-1?Q?pvCHORbhXsCbCCPJCYqAqfEQyppzPsGiyxMlCKjsgTda1lxM9AMc8DW5xD?=
 =?iso-8859-1?Q?7/LYAYCshoYIyqz9VBlCZJfnNszikiWxb4Yd4hLwdIHMjjCTsnhvv/OXoz?=
 =?iso-8859-1?Q?BoJpu0hMtE5r8rPbsuleQM9GgCYDQalL4asQ3yGcV6XuREfTVUvO5QxWcH?=
 =?iso-8859-1?Q?EKkv04HL1/JlgoPIRoF34qrXb3lkzpTJ2jr6s0Gxy6UnpAIo2eH4gOoF1z?=
 =?iso-8859-1?Q?Dt2664ADFhaipQ+F+bntD9kD9bGLdqcE/e+N5YJxdg8+OKwgo7ocnrFYf4?=
 =?iso-8859-1?Q?GZh1Q4BUVwxLuj2X0wRePRaGqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?J7wVW2Bz9OeLRICzdDOqQJa9iPSnkv13fzuANkn85jpWYe3aftpD6p9lVN?=
 =?iso-8859-1?Q?MxKFzvGMwvfqGBiDiqaOnPbqTp+Fdkp7BoKpDMu3PSdh+ELhaMoYrLrwKV?=
 =?iso-8859-1?Q?EFoeQniL2Zd/wjLNOeBB79hz7VfCY6/frbHuV31hWYIOgedzIkb0O1qsmX?=
 =?iso-8859-1?Q?6Agp5Of4fFpVAjrZSCncKsSAdPEDJndVX6fJqXPYlo4cvOtyQF5kZZtZvg?=
 =?iso-8859-1?Q?elOG412XMzr4nT1PNPwwoK91k5yZ9KrPrUBjRHGgjGKKqVltspaRMWM/yn?=
 =?iso-8859-1?Q?uoweGeFMBdTRt0wF7ZpUcN4xP9+1EvPwOJ33MFVXbMcccVRcxZy4CRckB8?=
 =?iso-8859-1?Q?BpSPpv4aqpDhdwiBJC6lX3YWkFqfCxj3byV9ytCSP47QtB+3sO76RK47aF?=
 =?iso-8859-1?Q?Ncy7gMJ6PLyBucLCkDY0/Uf7aUeQi8aYnTLmyh2k79JEX68ym6txCgsfLG?=
 =?iso-8859-1?Q?dTKjtFS39guS04Ue8RR2ESo+IwI/pqv32Pww5h9bNk8bOcqEJTzOJG2eWB?=
 =?iso-8859-1?Q?Z97RPOn47QU7ls4Gluk5qKvTDzwrDH1YkOMEAfUQfxXFhKvaAkM3ugDYbb?=
 =?iso-8859-1?Q?mwNWzxM5h/RbrTjsJ/sox4SXvSH2tou23pNn/l5mu1fDSCNyxWyauCzMqq?=
 =?iso-8859-1?Q?l+Tu0fFx5gbpxRbmIBUs5epePL91g4jOa68FIvp84/CaIUeSvZYz0fTCuH?=
 =?iso-8859-1?Q?MJ30UWRVutoRcfOj1kwftro3+a/tI9wNxqhWSOni4oZnxvsHh6yAMoaSFn?=
 =?iso-8859-1?Q?umWD/kCu7QABCNgnYc/hQMPapweqFr+3Fj6mwPM89RbYAu39gCixlMiH70?=
 =?iso-8859-1?Q?hxWfi+v/ibot1p6+U8BIJLifkbj50sQRd9cxiIKFw/cyLD5lLR4I8708SP?=
 =?iso-8859-1?Q?06iWMAigbIjKClRgdTPzpn6p4QSqd3/L5fRP1r8wHDqESZMzQCDcYjoDe5?=
 =?iso-8859-1?Q?KpNf7vU7rvHvDu43VCG1D5Nv4s0rR/L3wTte623N+dLfa1dCTdQqKJYFVP?=
 =?iso-8859-1?Q?qEF27YDr50to54uieE5hfsUKeBZ5SMRyapltSb6HltoYOIllm9CFlSiCnA?=
 =?iso-8859-1?Q?++SDLRkBpEg3q0V2ga2j8NsGy+YeSnXf85rs11sOex4IH12VGoFm5cGEA7?=
 =?iso-8859-1?Q?q9ni+XXAEdPrLJg5Ygtne5I0XxBIzsff167qV49KYmbJPyxHQiOOAE9YDR?=
 =?iso-8859-1?Q?eRZgptcz+bJye5knlNEBjQIX/E/6thZwlYjD+dmxCQj+UYe6bH8UcsOM+u?=
 =?iso-8859-1?Q?4AJFG7Et6Y5qNJIdefGJF1s66IL//YcyijHsiQzfjjEFRLnwtLttAf/Q22?=
 =?iso-8859-1?Q?4AkpqcwftJU3kzdHbCHORmTZF4do49rWzRW/UCra5NnxgSwT4PRvHFxGYo?=
 =?iso-8859-1?Q?qDiPXeCTrjA9Hm9cxNnMqs90W+MS7On9rax4f1k9Vc9LzdNWfRtXODPlcc?=
 =?iso-8859-1?Q?GVmuCCuf8MRVk+JfW7/TupyZIvnUk45zFo0sXqhjGRgAXOPGWZ8jqE78QR?=
 =?iso-8859-1?Q?tYrW5drwtvnRQRi1qrOuP/BBktD/BxftScNpUnj2G7RyczxO7dJJP6f5ch?=
 =?iso-8859-1?Q?oh5YyzIEDo/sf7VNK2eNkEnOvoqBHo8MTkQuLe2OLSp88T1w3b4OmUaV1+?=
 =?iso-8859-1?Q?EK/MSuErHxhukneObys9skMh1oh6ph7ZdE2R+SwwIBdChG2T3+33Jz5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6b9599-3660-404d-40ed-08dcfdb75602
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 16:31:44.5431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J+C/5KzQ3Bv2UCNNhS8TyDE7gZurNKUne/8Nm5f3rNd5NEDwcPgxj5roBqAg5OyF+puJ5PfTfnPklxmMARxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

On Tue, Nov 05, 2024 at 03:48:24PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> 
> 
> Continued review:
> 
> > +/**
> > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped
> > for GPU SVM migration
> > + * @dev: The device for which the pages were mapped
> > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > + * @npages: Number of pages to unmap
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function unmaps previously mapped pages of memory for GPU
> > Shared Virtual
> > + * Memory (SVM). It iterates over each DMA address provided in
> > @dma_addr, checks
> > + * if it's valid and not already unmapped, and unmaps the
> > corresponding page.
> > + */
> > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > +					   dma_addr_t *dma_addr,
> > +					   unsigned long npages,
> > +					   enum dma_data_direction
> > dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!dma_addr[i] || dma_mapping_error(dev,
> > dma_addr[i]))
> > +			continue;
> > +
> > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_devmem - Migrate GPU SVM range to device
> > memory
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @devmem_allocation: Pointer to the device memory allocation. The
> > caller
> > + *                     should hold a reference to the device memory
> > allocation,
> > + *                     which should be dropped via ops-
> > >devmem_release or upon
> > + *                     the failure of this function.
> > + * @ctx: GPU SVM context
> > + *
> > + * This function migrates the specified GPU SVM range to device
> > memory. It performs the
> > + * necessary setup and invokes the driver-specific operations for
> > migration to
> > + * device memory. Upon successful return, @devmem_allocation can
> > safely reference @range
> > + * until ops->devmem_release is called which only upon successful
> > return.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > +				 struct drm_gpusvm_range *range,
> > +				 struct drm_gpusvm_devmem
> > *devmem_allocation,
> > +				 const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation-
> > >ops;
> > +	u64 start = range->va.start, end = range->va.end;
> > +	struct migrate_vma migrate = {
> > +		.start		= start,
> > +		.end		= end,
> > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > +	};
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	unsigned long i, npages = npages_in_range(start, end);
> > +	struct vm_area_struct *vas;
> > +	struct drm_gpusvm_zdd *zdd = NULL;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int err;
> > +
> > +	if (!range->flags.migrate_devmem)
> > +		return -EINVAL;
> > +
> > +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> > !ops->copy_to_ram)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (!mmget_not_zero(mm)) {
> > +		err = -EFAULT;
> > +		goto err_out;
> > +	}
> > +	mmap_read_lock(mm);
> > +
> > +	vas = vma_lookup(mm, start);
> > +	if (!vas) {
> > +		err = -ENOENT;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (end > vas->vm_end || start < vas->vm_start) {
> > +		err = -EINVAL;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (!vma_is_anonymous(vas)) {
> > +		err = -EBUSY;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_mmunlock;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> > * npages;
> > +
> > +	zdd = drm_gpusvm_zdd_alloc(gpusvm-
> > >device_private_page_owner);
> > +	if (!zdd) {
> > +		err = -ENOMEM;
> > +		goto err_free;
> > +	}
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/*
> > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages !=
> > npages, not
> > +	 * always an error. Need to revisit possible cases and how
> > to handle. We
> > +	 * could prefault on migrate.cpages != npages via
> > hmm_range_fault.
> > +	 */
> > +
> > +	if (!migrate.cpages) {
> > +		err = -EFAULT;
> > +		goto err_free;
> > +	}
> > +
> > +	if (migrate.cpages != npages) {
> > +		err = -EBUSY;
> > +		goto err_finalize;
> > +	}
> > +
> > +	err = ops->populate_devmem_pfn(devmem_allocation, npages,
> > migrate.dst);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev,
> > dma_addr,
> > +					   migrate.src, npages,
> > DMA_TO_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *page = pfn_to_page(migrate.dst[i]);
> > +
> > +		pages[i] = page;
> > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > +		drm_gpusvm_get_devmem_page(page, zdd);
> > +	}
> > +
> > +	err = ops->copy_to_devmem(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	/* Upon success bind devmem allocation to range and zdd */
> > +	WRITE_ONCE(zdd->devmem_allocation, devmem_allocation);	/*
> > Owns ref */
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > dma_addr, npages,
> > +				       DMA_TO_DEVICE);
> > +err_free:
> > +	if (zdd)
> > +		drm_gpusvm_zdd_put(zdd);
> > +	kvfree(buf);
> > +err_mmunlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +err_out:
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_populate_ram_pfn - Populate RAM PFNs for a VM
> > area
> > + * @vas: Pointer to the VM area structure, can be NULL
> > + * @npages: Number of pages to populate
> > + * @mpages: Number of pages to migrate
> > + * @src_mpfn: Source array of migrate PFNs
> > + * @mpfn: Array of migrate PFNs to populate
> > + * @addr: Start address for PFN allocation
> > + *
> > + * This function populates the RAM migrate page frame numbers (PFNs)
> > for the
> > + * specified VM area structure. It allocates and locks pages in the
> > VM area for
> > + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation,
> > if NULL use
> > + * alloc_page for allocation.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct
> > *vas,
> > +					       unsigned long npages,
> > +					       unsigned long
> > *mpages,
> > +					       unsigned long
> > *src_mpfn,
> > +					       unsigned long *mpfn,
> > u64 addr)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > +		struct page *page;
> > +
> > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > +			continue;
> > +
> > +		if (vas)
> > +			page = alloc_page_vma(GFP_HIGHUSER, vas,
> > addr);
> > +		else
> > +			page = alloc_page(GFP_HIGHUSER);
> > +
> > +		if (!page)
> > +			return -ENOMEM;
> > +
> > +		lock_page(page);
> 
> Allocating under page-locks seem a bit scary, but OTOH we're
> recursively locking page-locks as well. Perhaps a comment on why this
> is allowed.
> 
> Allocating and then trylocking with asserts as separate steps otherwise
> would guarantee that we don't hit a deadlock without noticing but the
> way it's currently coded seems to be common practice.
> 

I think this works as page allocated clearly will be unlocked and no one else
should be locking the page here either, but agree this is a bit scary and does
expose a deadlock risk I suppose. I can split into a two step procces /w try
locks if you like or just add comment. I don't have a strong opinion here. 

Note this code will likely be updated to allocate 2M pages if possible so 2M dma
mappings can used for the copy and eventually migrate at 2M grainularity too in
migrate_vma*. In that case breaking this out into 2 steps will be less costly in
common 2M case.

AMD has similar code this to fwiw.

> > +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > +		++*mpages;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_evict_to_ram - Evict GPU SVM range to RAM
> > + * @devmem_allocation: Pointer to the device memory allocation
> > + *
> > + * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap
> > lock and
> > + * migration done via migrate_device_* functions.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > *devmem_allocation)
> > +{
> > +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation-
> > >ops;
> > +	unsigned long npages, mpages = 0;
> > +	struct page **pages;
> > +	unsigned long *src, *dst;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	npages = devmem_allocation->size >> PAGE_SHIFT;
> > +
> > +retry:
> > +	if (!mmget_not_zero(devmem_allocation->mm))
> > +		return -EFAULT;
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr)
> > +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	src = buf;
> > +	dst = buf + (sizeof(*src) * npages);
> > +	dma_addr = buf + (2 * sizeof(*src) * npages);
> > +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> > npages;
> > +
> > +	err = ops->populate_devmem_pfn(devmem_allocation, npages,
> > src);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = migrate_device_prepopulated_range(src, npages);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, npages,
> > &mpages, src,
> > +						  dst, 0);
> > +	if (err || !mpages)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev,
> > dma_addr,
> > +					   dst, npages,
> > DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(src[i]);
> > +
> > +	err = ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, dst);
> > +	migrate_device_pages(src, dst, npages);
> > +	migrate_device_finalize(src, dst, npages);
> > +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > dma_addr, npages,
> > +				       DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +	mmput_async(devmem_allocation->mm);
> > +	if (!err && !READ_ONCE(devmem_allocation->detached)) {
> > +		cond_resched();
> > +		goto retry;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * __drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM
> > (internal)
> > + * @vas: Pointer to the VM area structure
> > + * @device_private_page_owner: Device private pages owner
> > + * @page: Pointer to the page for fault handling (can be NULL)
> > + * @fault_addr: Fault address
> > + * @size: Size of migration
> > + *
> > + * This internal function performs the migration of the specified
> > GPU SVM range
> > + * to RAM. It sets up the migration, populates + dma maps RAM PFNs,
> > and
> > + * invokes the driver-specific operations for migration to RAM.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> > +				       void
> > *device_private_page_owner,
> > +				       struct page *page, u64
> > fault_addr,
> > +				       u64 size)
> > +{
> > +	struct migrate_vma migrate = {
> > +		.vma		= vas,
> > +		.pgmap_owner	= device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> > |
> > +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > +		.fault_page	= page,
> > +	};
> > +	struct drm_gpusvm_zdd *zdd;
> > +	const struct drm_gpusvm_devmem_ops *ops;
> > +	struct device *dev;
> > +	unsigned long npages, mpages = 0;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	u64 start, end;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	start = ALIGN_DOWN(fault_addr, size);
> > +	end = ALIGN(fault_addr + 1, size);
> > +
> > +	/* Corner where VMA area struct has been partially unmapped
> > */
> > +	if (start < vas->vm_start)
> > +		start = vas->vm_start;
> > +	if (end > vas->vm_end)
> > +		end = vas->vm_end;
> > +
> > +	migrate.start = start;
> > +	migrate.end = end;
> > +	npages = npages_in_range(start, end);
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> > * npages;
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/* Raced with another CPU fault, nothing to do */
> > +	if (!migrate.cpages)
> > +		goto err_free;
> > +
> > +	if (!page) {
> > +		for (i = 0; i < npages; ++i) {
> > +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> > +				continue;
> > +
> > +			page = migrate_pfn_to_page(migrate.src[i]);
> > +			break;
> > +		}
> > +
> > +		if (!page)
> > +			goto err_finalize;
> > +	}
> > +	zdd = page->zone_device_data;
> > +	ops = zdd->devmem_allocation->ops;
> > +	dev = zdd->devmem_allocation->dev;
> > +
> > +	err = drm_gpusvm_migrate_populate_ram_pfn(vas, npages,
> > &mpages,
> > +						  migrate.src,
> > migrate.dst,
> > +						  start);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(dev, dma_addr,
> > migrate.dst, npages,
> > +					   DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > +
> > +	err = ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> > +				       DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_evict - Evict GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range to be removed
> > + *
> > + * This function evicts the specified GPU SVM range.
> > + */
> > +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_range *range)
> 
> Although we discussed this one before. Ideally I think we'd want to be
> able to migrate also other devices' pages. But need to consider device-
> coherent pages.
>

I discussed this Alistar a bit here [1]. Purposed hmm_range_fault lookup of device
pages + a new helper. I think we landed on that is not such a great idea and
just use the existing migrate_vma_* functions. 

I think we actually allowed to migrate other devices though in
__drm_gpusvm_migrate_to_ram as we lookup drm gpu devmem struct from the pages.
Maybe a little more work is needed in __drm_gpusvm_migrate_to_ram if multiple
pages found point to different drm gpu devmem struct though.

[1] https://patchwork.freedesktop.org/patch/619814/?series=137870&rev=2#comment_1127790

> 
> > +{
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct vm_area_struct *vas;
> > +
> > +	if (!mmget_not_zero(mm))
> > +		return;
> > +
> > +	mmap_read_lock(mm);
> > +	vas = vma_lookup(mm, range->va.start);
> > +	if (!vas)
> > +		goto unlock;

Not this version is missing a VMA loop here which is required if the VMAs have
changed since the range was created. Have locally in the latest stable branch I
have shared [2].

[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-10-15-24/-/tree/svm-10-16.stable?ref_type=heads

> > +
> > +	__drm_gpusvm_migrate_to_ram(vas, gpusvm-
> > >device_private_page_owner,
> > +				    NULL, range->va.start,
> > +				    range->va.end - range-
> > >va.start);
> > +unlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated
> > with a page
> > + * @page: Pointer to the page
> > + *
> > + * This function is a callback used to put the GPU SVM zone device
> > data
> > + * associated with a page when it is being released.
> > + */
> > +static void drm_gpusvm_page_free(struct page *page)
> > +{
> > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page
> > fault handler)
> > + * @vmf: Pointer to the fault information structure
> > + *
> > + * This function is a page fault handler used to migrate a GPU SVM
> > range to RAM.
> > + * It retrieves the GPU SVM range information from the faulting page
> > and invokes
> > + * the internal migration function to migrate the range back to RAM.
> > + *
> > + * Returns:
> > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > + */
> > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > +	int err;
> 
> ... and this one only the pages belonging to the current pagemap.
> 
> > +
> > +	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
> > +					  zdd-
> > >device_private_page_owner,
> > +					  vmf->page, vmf->address,
> > +					  zdd->devmem_allocation-
> > >size);
> > +
> > +	return err ? VM_FAULT_SIGBUS : 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > + */
> > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> > +	.page_free = drm_gpusvm_page_free,
> > +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> > +};
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map
> > operations
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM device page map operations structure.
> > + */
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > +{
> > +	return &drm_gpusvm_pagemap_ops;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the
> > given address range
> > + * @gpusvm: Pointer to the GPU SVM structure.
> > + * @start: Start address
> > + * @end: End address
> > + *
> > + * Returns:
> > + * True if GPU SVM has mapping, False otherwise
> > + */
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start,
> > u64 end)
> > +{
> > +	struct drm_gpusvm_notifier *notifier;
> > +
> > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > +		struct drm_gpusvm_range *range = NULL;
> > +
> > +		drm_gpusvm_for_each_range(range, notifier, start,
> > end)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h
> > b/drivers/gpu/drm/xe/drm_gpusvm.h
> > new file mode 100644
> > index 000000000000..15ec22d4f9a5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > @@ -0,0 +1,447 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __DRM_GPUSVM_H__
> > +#define __DRM_GPUSVM_H__
> > +
> > +#include <linux/kref.h>
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct dev_pagemap_ops;
> > +struct drm_device;
> > +struct drm_gpusvm;
> > +struct drm_gpusvm_notifier;
> > +struct drm_gpusvm_ops;
> > +struct drm_gpusvm_range;
> > +struct drm_gpusvm_devmem;
> > +struct drm_pagemap;
> > +struct drm_pagemap_dma_addr;
> > +
> > +/**
> > + * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM
> > device memory
> > + *
> > + * This structure defines the operations for GPU Shared Virtual
> > Memory (SVM)
> > + * device memory. These operations are provided by the GPU driver to
> > manage device memory
> > + * allocations and perform operations such as migration between
> > device memory and system
> > + * RAM.
> > + */
> > +struct drm_gpusvm_devmem_ops {
> > +	/**
> > +	 * @devmem_release: Release device memory allocation
> > (optional)
> > +	 * @devmem_allocation: device memory allocation
> > +	 *
> > +	 * This function shall release device memory allocation and
> > expects to drop a
> 
> NIT: Consider "Release device memory..." rather than "This function
> shall release..." (general comment).
> 

Will do.

> > +	 * reference to device memory allocation.
> > +	 */
> > +	void (*devmem_release)(struct drm_gpusvm_devmem
> > *devmem_allocation);
> > +
> > +	/**
> > +	 * @populate_devmem_pfn: Populate device memory PFN
> > (required for migration)
> > +	 * @devmem_allocation: device memory allocation
> > +	 * @npages: Number of pages to populate
> > +	 * @pfn: Array of page frame numbers to populate
> > +	 *
> > +	 * This function shall populate device memory page frame
> > numbers (PFN).
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem
> > *devmem_allocation,
> > +				 unsigned long npages, unsigned long
> > *pfn);
> > +
> > +	/**
> > +	 * @copy_to_devmem: Copy to device memory (required for
> > migration)
> > +	 * @pages: Pointer to array of device memory pages
> > (destination)
> > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to device memory.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_devmem)(struct page **pages,
> > +			      dma_addr_t *dma_addr,
> > +			      unsigned long npages);
> > +
> > +	/**
> > +	 * @copy_to_ram: Copy to system RAM (required for migration)
> > +	 * @pages: Pointer to array of device memory pages (source)
> > +	 * @dma_addr: Pointer to array of DMA addresses
> > (destination)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to system RAM.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_ram)(struct page **pages,
> > +			   dma_addr_t *dma_addr,
> > +			   unsigned long npages);
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_devmem - Structure representing a GPU SVM
> > device memory allocation
> > + *
> > + * @dev: Pointer to the device structure which device memory
> > allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @ops: Pointer to the operations structure for GPU SVM device
> > memory
> > + * @dpagemap: The struct drm_pagemap of the pages this allocation
> > belongs to.
> > + * @size: Size of device memory allocation
> > + * @detached: device memory allocations is detached from device
> > pages
> > + */
> > +struct drm_gpusvm_devmem {
> > +	struct device *dev;
> > +	struct mm_struct *mm;
> > +	const struct drm_gpusvm_devmem_ops *ops;
> > +	struct drm_pagemap *dpagemap;
> > +	size_t size;
> > +	bool detached;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > + *
> > + * This structure defines the operations for GPU Shared Virtual
> > Memory (SVM).
> > + * These operations are provided by the GPU driver to manage SVM
> > ranges and
> > + * notifiers.
> > + */
> > +struct drm_gpusvm_ops {
> > +	/**
> > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > +	 *
> > +	 * This function shall allocate a GPU SVM notifier.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM notifier on success,
> > NULL on failure.
> > +	 */
> > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > +
> > +	/**
> > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM notifier.
> > +	 */
> > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > +
> > +	/**
> > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 *
> > +	 * This function shall allocate a GPU SVM range.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM range on success, NULL
> > on failure.
> > +	 */
> > +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm
> > *gpusvm);
> > +
> > +	/**
> > +	 * @range_free: Free a GPU SVM range (optional)
> > +	 * @range: Pointer to the GPU SVM range to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM range.
> > +	 */
> > +	void (*range_free)(struct drm_gpusvm_range *range);
> > +
> > +	/**
> > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @notifier: Pointer to the GPU SVM notifier
> > +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> > +	 *
> > +	 * This function shall invalidate the GPU page tables. It
> > can safely
> > +	 * walk the notifier range RB tree/list in this function.
> > Called while
> > +	 * holding the notifier lock.
> > +	 */
> > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > +			   struct drm_gpusvm_notifier *notifier,
> > +			   const struct mmu_notifier_range
> > *mmu_range);
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM
> > notifier
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: MMU interval notifier
> > + * @interval: Interval for the notifier
> > + * @rb: Red-black tree node for the parent GPU SVM structure
> > notifier tree
> > + * @root: Cached root node of the RB tree containing ranges
> > + * @range_list: List head containing of ranges in the same order
> > they appear in
> > + *              interval tree. This is useful to keep iterating
> > ranges while
> > + *              doing modifications to RB tree.
> > + * @flags.removed: Flag indicating whether the MMU interval notifier
> > has been
> > + *                 removed
> 
> Please also document the nested fields.
> 

Ah yes, will do.

> > + *
> > + * This structure represents a GPU SVM notifier.
> > + */
> > +struct drm_gpusvm_notifier {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct mmu_interval_notifier notifier;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} interval;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct rb_root_cached root;
> > +	struct list_head range_list;
> > +	struct {
> > +		u32 removed : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier
> > + * @refcount: Reference count for the range
> > + * @rb: Red-black tree node for the parent GPU SVM notifier
> > structure range tree
> > + * @va: Virtual address range
> > + * @notifier_seq: Notifier sequence number of the range's pages
> > + * @dma_addr: DMA address array
> > + * @dpagemap: The struct drm_pagemap of the device pages we're dma-
> > mapping.
> > + * Note this is assuming only one drm_pagemap per range is allowed.
> > + * @flags.migrate_devmem: Flag indicating whether the range can be
> > migrated to device memory
> > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > + * @flags.partial_unmap: Flag indicating if the range has been
> > partially unmapped
> > + * @flags.has_devmem_pages: Flag indicating if the range has devmem
> > pages
> > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA
> > mapping
> > + *
> > + * This structure represents a GPU SVM range used for tracking
> > memory ranges
> > + * mapped in a DRM device.
> > + */
> Also here.
> 

+1

> > +struct drm_gpusvm_range {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct drm_gpusvm_notifier *notifier;
> > +	struct kref refcount;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} va;
> > +	unsigned long notifier_seq;
> > +	struct drm_pagemap_dma_addr *dma_addr;
> > +	struct drm_pagemap *dpagemap;
> > +	struct {
> > +		/* All flags below must be set upon creation */
> > +		u16 migrate_devmem : 1;
> > +		/* All flags below must be set / cleared under
> > notifier lock */
> > +		u16 unmapped : 1;
> > +		u16 partial_unmap : 1;
> > +		u16 has_devmem_pages : 1;
> > +		u16 has_dma_mapping : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm - GPU SVM structure
> > + *
> > + * @name: Name of the GPU SVM
> > + * @drm: Pointer to the DRM device structure
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @device_private_page_owner: Device private pages owner
> > + * @mm_start: Start address of GPU SVM
> > + * @mm_range: Range of the GPU SVM
> > + * @notifier_size: Size of individual notifiers
> > + * @ops: Pointer to the operations structure for GPU SVM
> > + * @chunk_sizes: Pointer to the array of chunk sizes used in range
> > allocation.
> > + *               Entries should be powers of 2 in descending order.
> > + * @num_chunks: Number of chunks
> > + * @notifier_lock: Read-write semaphore for protecting notifier
> > operations
> > + * @root: Cached root node of the Red-Black tree containing GPU SVM
> > notifiers
> > + * @notifier_list: list head containing of notifiers in the same
> > order they
> > + *                 appear in interval tree. This is useful to keep
> > iterating
> > + *                 notifiers while doing modifications to RB tree.
> > + *
> > + * This structure represents a GPU SVM (Shared Virtual Memory) used
> > for tracking
> > + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> > + *
> > + * No reference counting is provided, as this is expected to be
> > embedded in the
> > + * driver VM structure along with the struct drm_gpuvm, which
> > handles reference
> > + * counting.
> > + */
> > +struct drm_gpusvm {
> > +	const char *name;
> > +	struct drm_device *drm;
> > +	struct mm_struct *mm;
> > +	void *device_private_page_owner;
> > +	u64 mm_start;
> > +	u64 mm_range;
> 
> Possibly consider using unsigned long for cpu virtual addresses, since
> that's typically done elsewhere. 
> GPU virtual addresses should remain 64-bit, though.
> 

Ok, will adjust.

> > +	u64 notifier_size;
> > +	const struct drm_gpusvm_ops *ops;
> > +	const u64 *chunk_sizes;
> > +	int num_chunks;
> > +	struct rw_semaphore notifier_lock;
> > +	struct rb_root_cached root;
> > +	struct list_head notifier_list;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > + *
> > + * @in_notifier: entering from a MMU notifier
> > + * @read_only: operating on read-only memory
> > + * @devmem_possible: possible to use device memory
> > + * @check_pages: check pages and only create range for pages faulted
> > in
> > + *
> > + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > + */
> > +struct drm_gpusvm_ctx {
> > +	u32 in_notifier :1;
> > +	u32 read_only :1;
> > +	u32 devmem_possible :1;
> > +	u32 check_pages :1;
> > +};
> > +
> > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > +		    const char *name, struct drm_device *drm,
> > +		    struct mm_struct *mm, void
> > *device_private_page_owner,
> > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > +		    const struct drm_gpusvm_ops *ops,
> > +		    const u64 *chunk_sizes, int num_chunks);
> > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64
> > fault_addr,
> > +				u64 gpuva_start, u64 gpuva_end,
> > +				const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > +			     struct drm_gpusvm_range *range);
> > +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> > +			    struct drm_gpusvm_range *range);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > +
> > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range);
> > +
> > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range,
> > +				  const struct drm_gpusvm_ctx *ctx);
> 
> There is some newline inconsistency between declarations. I think the
> recommended coding style is to use a newline in-between.
> 

Ok, got it.

> > +
> > +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > +				 struct drm_gpusvm_range *range,
> > +				 struct drm_gpusvm_devmem
> > *devmem_allocation,
> > +				 const struct drm_gpusvm_ctx *ctx);
> > +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > *devmem_allocation);
> > +
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > +
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start,
> > u64 end);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64
> > start, u64 end);
> > +
> > +/**
> > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, take lock
> > + */
> > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > +	down_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, drop lock
> > + */
> > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > +	up_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> > + * @range: a pointer to the current GPU SVM range
> > + *
> > + * Return: A pointer to the next drm_gpusvm_range if available, or
> > NULL if the
> > + *         current range is the last one or if the input range is
> > NULL.
> > + */
> > +static inline struct drm_gpusvm_range *
> > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > +{
> > +	if (range && !list_is_last(&range->rb.entry,
> > +				   &range->notifier->range_list))
> > +		return list_next_entry(range, rb.entry);
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a
> > notifier
> > + * @range__: Iterator variable for the ranges. If set, it indicates
> > the start of
> > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to
> > get the range.
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the range
> > + * @end__: End address of the range
> > + *
> > + * This macro is used to iterate over GPU SVM ranges in a notifier.
> > It is safe
> > + * to use while holding the driver SVM lock or the notifier lock.
> > + */
> > +#define drm_gpusvm_for_each_range(range__, notifier__, start__,
> > end__)	\
> > +	for ((range__) = (range__)
> > ?:					\
> > +	     drm_gpusvm_range_find((notifier__), (start__),
> > (end__));	\
> > +	     (range__) && (range__->va.start <
> > (end__));		\
> > +	     (range__) = __drm_gpusvm_range_next(range__))
> > +
> > +/**
> > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> > + * @range: Pointer to the GPU SVM range structure.
> > + * @mmu_range: Pointer to the MMU notifier range structure.
> > + *
> > + * This function marks a GPU SVM range as unmapped and sets the
> > partial_unmap flag
> > + * if the range partially falls within the provided MMU notifier
> > range.
> > + */
> > +static inline void
> > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > +			      const struct mmu_notifier_range
> > *mmu_range)
> > +{
> > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > +
> > +	range->flags.unmapped = true;
> > +	if (range->va.start < mmu_range->start ||
> > +	    range->va.end > mmu_range->end)
> > +		range->flags.partial_unmap = true;
> > +}
> 
> Inlines are really only useful for performance reasons, and that's not
> the case here.
> 

Will move to drm_gpusvm.c

> > +
> > +/**
> > + * drm_gpusvm_devmem_init - Initialize a GPU SVM device memory
> > allocation
> > + *
> > + * @dev: Pointer to the device structure which device memory
> > allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @ops: Pointer to the operations structure for GPU SVM device
> > memory
> > + * @dpagemap: The struct drm_pagemap we're allocating from.
> > + * @size: Size of device memory allocation
> > + */
> > +static inline void
> > +drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> > +		       struct device *dev, struct mm_struct *mm,
> > +		       const struct drm_gpusvm_devmem_ops *ops,
> > +		       struct drm_pagemap *dpagemap, size_t size)
> > +{
> > +	devmem_allocation->dev = dev;
> > +	devmem_allocation->mm = mm;
> > +	devmem_allocation->ops = ops;
> > +	devmem_allocation->dpagemap = dpagemap;
> > +	devmem_allocation->size = size;
> > +}
> 
> Same here?
> 

Ok, will change too.

Matt

> 
> > +
> > +#endif /* __DRM_GPUSVM_H__ */
> > --
> > 2.34.1
> 
> 
> Thanks,
> Thomas
> 
