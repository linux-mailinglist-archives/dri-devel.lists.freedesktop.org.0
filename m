Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AD9B11E5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8859E10EB93;
	Fri, 25 Oct 2024 21:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kh7GiJBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8044110EB94;
 Fri, 25 Oct 2024 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893085; x=1761429085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+6kX+PN8G7ONn69IurZXEHL7OKrxjzVRleyDPT0EP3I=;
 b=Kh7GiJBtgsuD9yFaaWJDUF67Wfw5pLut5WyAYuUl6hse8OP7hh15J98i
 xF336LPCLv3jxK8oaPtqbzQQmvE29Ic5LBNOk4538atBLEgNVydHjIXG+
 Omxiz+QarHeocDdYWmh10BhVr8gpTcBllNWo6BbFe6bNXyMyDutAS5ELI
 MXyZipkKJmr8iiNdOir/m8oAzR2x3hpkv4D27Ci/IFgdPKWIoAWFPEb2m
 4TW1bcuaoq6Tbe82YYti3Jq3rgyMhzjE2suL1bK07oiY2XWBzcsqEgHuS
 8Tfb8OGFTKv9V7e/mTfn0syTp04thsCUTnRawmAlg7PjdHgrEMonmePJg Q==;
X-CSE-ConnectionGUID: yS/M8t+ZTyu3ploeeH8I9g==
X-CSE-MsgGUID: fOW8yV4/SD+SHIOBvtgsHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29704511"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29704511"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:24 -0700
X-CSE-ConnectionGUID: fVOU1lOORGShgQld12K5tw==
X-CSE-MsgGUID: KjNzKySLTx+EEDqUT3X9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="111854145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t61H16/QvbYc7XiVxmQ2qeypXB3lixCgRenTVrw5kMtrQNfIhfVToy7lY+e8oT4QsUskzTRWPUeZBhqPCUuS1frnTBez33SXPWC2sRABs3/8z0HAB4VlQ4U2hl0Ys+mcjvDR6LlpOICtNx4D4KLroeyhT3tKoMRCE+3NcEnWMykgBCQ3YSR26EviT8gQi0zxHJWUArKdNZKFU4KMkKTmMEK6GZbKMSFr9Y7cFdWFiD2JXsPcb+GsUWuHRK8i1iKjhfej7XIJE9y8nsCTN1/PKfV3TQz9kuptYvz9BVIzYlX/EgCUnrD8cVAo8CQ+4Qtfqvd91XR/gxdFkbv3rGcg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QmHvi2kGNZ/R3MXys/d+yl7CPR0MJOK4uWFtGOMqxM=;
 b=c9D9WMMnAdSSbZivka/R6iIInAF2+Xlujo9d9xolefwgiCTjM5nfIushDoInXn+oNUIF3qgiplIWWlh9IwJqnOVCwGrJNmxJ66DHdgwhqVPm7QFTCM6EDoCIDho/DScN4sgrCOoodu0soDq1E7UmJlw9k375jd5uSsVTn2/Bkpvv1kGhQI4RF8aOQQVGZT764q4K7rtTQx28cAAZsu/lAetexg4fUDl6amNrUA8YzEAiG4Aa5tYysDFPPenmTuHDCMVY8lZFYEAxVsKAstLeSDuC4IDH3+7WKoxJ/jS+W+UJcm+FuJeif6GGTch2LX5+C7uhJ76H4Zqy3lGNF8kVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v4 5/7] PCI/IOV: Check that VF BAR fits within the reservation
Date: Fri, 25 Oct 2024 23:50:36 +0200
Message-ID: <20241025215038.3125626-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: ca155235-7f3f-41fa-1ddb-08dcf53f29c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0ZENXRSUmE5NWViZnc5Q3pMUTRaZENXc3ZJVEthbkdwZjM5K01DSlh6N0RY?=
 =?utf-8?B?Nzl1OGZoWTFVTUhjWGIvNXdqQlhIYnR4MTByZUxjNUJsSEY3SDdtY3lYNElS?=
 =?utf-8?B?dVJhKzFpL2tlelJWaGhpMWdxaHdiT3krekVmajdCanV6M0NsMitUaS9xSTVn?=
 =?utf-8?B?bmFFTVBicC91UFlQblY5QU9rVG5JT2hRMnE5YkFLOE1QWkNBL1ZtVStWcjZO?=
 =?utf-8?B?c1owWmF1RWVSVTZ5UE1kUi9mT1grQkQyZmcyMFd3YzE3T2U3UCtOaWQ4ZTZh?=
 =?utf-8?B?QkROaWRBM0VjdTBwUVZGM2R2d2xvd25rQ21ySTREV1dHTW83YW5yNStTMmNk?=
 =?utf-8?B?SzhQRzdTSUtRa0NYblhCd29CK0VzTVgxbHJkbEZ6RTN2dXZ1c0tkc3pMRmJP?=
 =?utf-8?B?S1lOcDJEbWRiWWREOXpPZE8xMW5od0d4cjNKWEh1a2J3U0JHbXNvenV5clYx?=
 =?utf-8?B?MmNjYVRkTnFVeU9VOU5UbEdabHNMQUVTSUVGenRtVWRnYUhTMlF4S3Rrd0hX?=
 =?utf-8?B?Vkc5dFZ6VTFBcm45K0U5ZU1jTGI3Z282MTd5ZzNzZjEyL1VSbkFrODNlekkw?=
 =?utf-8?B?WURzNGttRTJxVTlKYjh3TlB0MDZmMnhIay9BeEZ5ZEtNRFVHdmZaVlFaYjA5?=
 =?utf-8?B?MWFDTVJXYkl1ZUtUZldHaU5PT1NXdHArcUF2VXdQYzh3K0piK25QZHBsRi9z?=
 =?utf-8?B?aUVSaC9jWnJ0dkNaTkFWUXkzNmdySGU3WXRhZ0o3cXFQZitFUHpRQzM1WEtB?=
 =?utf-8?B?N0lldjJaU3IrMFl1OG1idVdWc3hIcE5PWHpUS1phRnhxcEM0WVVDK01seGtn?=
 =?utf-8?B?c2lpNmxCN21ORC9mRUpqbFo0bEFIN0J1VnpmdDF6QnNMNGxTSlVBTzdVVXBq?=
 =?utf-8?B?dWdZTnJYU1A0U2hHK283S3pXUEFhMHU1anBpQ3h2eklXb2ErQWw0N29VZ1Uv?=
 =?utf-8?B?M3hiODBSMWs2aFB5eGxORG0vM0U2YkNNODFMM2tzbklPdXJKR0VMZlJxRzNX?=
 =?utf-8?B?RjdlNExZcDhuWTcrNk9rdlhMQ2c5M253dnlzeFQyV3VxTUtZaTJKazB1bFIz?=
 =?utf-8?B?QXh2Q0paTlo2ekJkQXF6MkFqN1pJSmZXZTJqZzB1Q1oxbmF3ZEp5aHdJL3dS?=
 =?utf-8?B?elpzOEVoeVNOZ2NqOTAzOVBlejhOUyttekNhWG5CcHRkR0h3MFBnK2YzT0RW?=
 =?utf-8?B?eWlGU25qWkE4c2piTmFHbXFaem1SUTJQdlFjNjZJSWhVZE0wSTJUbit6NitG?=
 =?utf-8?B?N1UwMnliNGkvYXlTNEMzaHNJMlFBUEpUNEJodmpvT1VGMGJDUjBoQWpHU1l5?=
 =?utf-8?B?MU1xNUR1TmFraUV2L2JGSENYMUxpRkpSZkMxUnJDcFVVTFZpeXpyZHVLQmc3?=
 =?utf-8?B?QlcxZko1MDBpZnNQcGNtRjgxbVFXdzdHTm9nSk1kU0RWeHgwTWlyQlB0UzdQ?=
 =?utf-8?B?d2RDYWFnWEhEV2ZyVnNUSzdycFg0aXZ4Mkh5M3Ntc2c3bFRGdm9Nd21PVmhO?=
 =?utf-8?B?aE40UDRYdkFIWkJuRCt4WEgya0dva2JvOVpRYXVES3RLQ09sV3BNUlJNM0da?=
 =?utf-8?B?RVBFSFQ1VWkxdFVzaHAxUEhLRnhtaUVxK2pmdlNyNUV6TnJUQ25WSmtrNjZ1?=
 =?utf-8?B?dDYvUEdFdHBzeThOMXU0b243djlIaXNSKzZJY0lBcE9lMVA1NXN1UW1PYVNQ?=
 =?utf-8?B?eElYVGczYWlpald3a1ppNW92bG1uM1ZrcWV0MGRWREl0VTJvVjhiNmRtcTFl?=
 =?utf-8?Q?ioaVvkMZrV9D78LVbnLmIXcEUaW8MCTX7epDxLx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRkWmRJUmdGRUpzaDJtYjBrMmpsNmh6VjJ6S2dia0VoWkFkdzluQ2UyelpL?=
 =?utf-8?B?MjlMdGlHS05vRDRoYUpGK2tiaTRMZWxEeDdsZFFVV2lJMmRVWG9va3UwYStD?=
 =?utf-8?B?MVpYL3d2dHIzeGdidFJocFNpaERtUEVFV245eEV1cHJGRnN5K3dQUUYrYnJS?=
 =?utf-8?B?a2M5bEtxdEhtNnVFME01VDBCS1hJM2hPanBiVnZXeFpDWmdZanMwelpoRkY2?=
 =?utf-8?B?K2Y4V0dmeFJtdnlvcG1makZaV2lnZVJvQWJuZ3FkRjVBN3JIaGpDODNPekJm?=
 =?utf-8?B?SVBGNU1vUFRLclNMWmdyRzM5anRwR1JwVnVqTVpZaUYwRXFkb0hhbmdoQmZX?=
 =?utf-8?B?T3ljUXY1V2svN0lqV1pPS2xqS0JHSVBOMGJXMy9yZ1NtVE50K3duMmZna0ZK?=
 =?utf-8?B?SEdqTERnY0FXWGZoZXFZaDVCbG5qVEV4ZktOMzNKRTFKOFVLRVJlZDJjT1dE?=
 =?utf-8?B?RlBLaUEwaW1zVnYwbk5HRDNibzNKRmcrUjRscTNhSGJ0RWI0UkxXOXcwU1Vq?=
 =?utf-8?B?b0dNV20zSURiQlJkTWR4bmRxQjJBM2VWR2h6RFVjSFVhNTlFclNtWnV5UVVH?=
 =?utf-8?B?VUEvdUUzWWYvRXYxMEM2VkNNUWdHSXcyak9ldWZLUSs0T0Q4aHd3WjRnbEJw?=
 =?utf-8?B?RXBOdFhWczBqTmlUekY3MDU0dVc2dnNFOG92a3FDeDhJK24xT25sVGVFN2NQ?=
 =?utf-8?B?eStBRWt1WmkvVS9NZTZPc2VOWi8rSDhvUlUyQzlNeW1zZW1zMk53SnFObG5G?=
 =?utf-8?B?eFVvTEgzVWVVTEw2bDBSM2dETnpGL05vVjN0TzFscmZ5RGZqU0hXZm8vMEND?=
 =?utf-8?B?R2Zwek1Wek5acm9pMDcrOVlSRCs0RFdmZEtJdVVmWWgwVUFIR3paZC8zODNB?=
 =?utf-8?B?azFsSWtWT2d5NFk3cEI5VzYrc0NyK1BWWEg3ZStBeDJNVTZDazViaXpQM1RF?=
 =?utf-8?B?Y2pGTkFJQnVUZkxOaGJBNXZKTlVmU0ZTTWVodFNUb2NoZ2JrelVBT2lGMWFh?=
 =?utf-8?B?RDVqOFZKWDBGdDNkdzMzckZKckhSZEQ1ejNFWjlScUFteGgzK21BNGlCak9D?=
 =?utf-8?B?Z3Q3Wkc1QnF1Z1loR1VrdlRnUkRlSGFURDg5RnJQcndoN0FpN3EvY3F5QjJG?=
 =?utf-8?B?V0ZQZTk1MXI4ajcxRmdLcmU5MnZTNHEweDlNb3pyOTJJaU0zNUowN1BNT0Fn?=
 =?utf-8?B?WFEzSE42STVEVXZ1VDVZWUZZSXU4bHRxNkFXZzNYZnlwaWFCbG96N3hRMkow?=
 =?utf-8?B?NkJ3d2pVckJqYXdqb0t6WFhNTjdCaWdBNGRnd3kvNGhmSlhsb2c4b0tJTEZX?=
 =?utf-8?B?RThqTUFFYXFzWHJqNVhuZDdnL0Y3ZlZ6S0NRZ2xMdTV3RnlNcjdIZ2NhNDYx?=
 =?utf-8?B?NUVET24yVW56dlg3UFlILzhYaWlYVmM5c0Y3Wk9IMUdTb0FuRm5qNDFKVXhG?=
 =?utf-8?B?L3ZUbVZoY2E4aUc5TkxIZTFOSXNZVThMKzVxd2dwUHE5S1VtRFdlTFNXZWQy?=
 =?utf-8?B?S2pkcjE5cjNSZHhKSTd1OG5wcmNUOEtQYkthbi9hYlphdTVHdE9TWnNsOVJN?=
 =?utf-8?B?c0J3Ni85a3VvL0NjeUpVNHBmelFYQlhuN01sTk9DRDNoTEVJN1ptWE5nSzd2?=
 =?utf-8?B?QkNUMG5FOTR3SkNrVWVMTkNGbWlKZHFzWFZOVnZ0a2ZQbEgvVVI2OUdqelhn?=
 =?utf-8?B?NjRuK2toTHJUcVZPcjRvckZHbTRxRlJtaGNXaUs1TGZOUS9IZVJYOHVtU2xm?=
 =?utf-8?B?SFBiL0hNckgxSkM4ZUdwSFoxOTJnRFFaMU9tVlNSQTUzc0NtWFJJY0hWV2Rk?=
 =?utf-8?B?cUtFTEc4T3pWRHJyN1o5T2ZKTFR2MmNQbGRLa0doVVRTNzBqZFNsRElaUVB1?=
 =?utf-8?B?dXJ6a2xaUWliMmtxNlBWQkwyTW1UazBXaElob1p2eURuR01PRFFDdDYwMlhr?=
 =?utf-8?B?U1Bob1psQ3ZyeXE1anVBSWtVS3JoOW9GQmZGaTI3a3ZrYjNmNlNVV0ZvanJ5?=
 =?utf-8?B?UDVIZTh3YTQzR1VXU0FJd1BxSnJsaXJtZjQzR1R5K1ZaUzhzTnhidGFJeU10?=
 =?utf-8?B?NmJDbVZ6QWxNVnNmSEhCSm5LcWQ2bGJ0bzhSQXRrNDNPbi9xR0J3blY4K2Nz?=
 =?utf-8?B?R1FwNEsyRHJjeUdPdjlYQWxNTmxkbDE5VVR0dHlQUGZMTXBDallXczJQUm9M?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca155235-7f3f-41fa-1ddb-08dcf53f29c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:21.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XgPgUJNOFCIDFEH3Fo/lHsn9Q+NGbgHujLlu+gf3xOdD2MhI4McvcoU5hX4vsWGTbRdzrXCeAW1E9ev9JtOfaRta/VOjhB4TWROpvXHyr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

VF MMIO resource reservation, either created by system firmware and
inherited by Linux PCI subsystem or created by the subsystem itself,
should contain enough space to fit the BAR of all SR-IOV Virtual
Functions that can potentially be created (total VFs supported by the
device).

However, that assumption only holds in an environment where VF BAR size
can't be modified.

Add an additional check that verifies that VF BAR for all enabled VFs
fits within the underlying reservation resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 79143c1bc7bb4..5de828e5a26ea 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -645,10 +645,14 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		int vf_bar_sz = pci_iov_resource_size(dev,
+						      pci_resource_to_iov(i));
 		bars |= (1 << pci_resource_to_iov(i));
 		res = &dev->resource[pci_resource_to_iov(i)];
-		if (res->parent)
-			nres++;
+		if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
+			continue;
+
+		nres++;
 	}
 	if (nres != iov->nres) {
 		pci_err(dev, "not enough MMIO resources for SR-IOV\n");
-- 
2.47.0

