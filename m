Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4499B99839E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1CD10E8C2;
	Thu, 10 Oct 2024 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNrhFGg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60D210E8CB;
 Thu, 10 Oct 2024 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728556351; x=1760092351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wLcAo1WhV3XHKAuXQH8tJQ1yh9wGo3PPw0FqfBgmVgg=;
 b=hNrhFGg4M60xhFqDzqwyLTCvW4UVx9jPefNoHmoULmCw2us0XiijZaN2
 nZ/5UWHJ8iZsqWzYDE9vRD69A45lSoezcWivfpY0oPpdWWlP6ZXb+B05A
 XgCno2QlC5I+FA7ZFMBpMAdnQx8zBzO1r6nmXVfv+v9ztz8+M4yshRQ1x
 6JufdGf90SoLhqNYh1jFFqwiPjv/ZQl9v1CAVyW6gsRX9wijZCmMZ5Opj
 PWliO+wPRsmE9/ikVsczVSYNEcWrF2+PfxxLaCptUA2yDi0Zg5o9mzr8K
 qkUy0RJXl65YJNGzMF/eVzvMs8X44WO97LtMXUAbBbA3owlLRRsqWR6dI Q==;
X-CSE-ConnectionGUID: WnH4xYdyTEGgMyTdEtDP/w==
X-CSE-MsgGUID: RRaTIIN5QnasQYIEU2KzLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15528480"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="15528480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:32:30 -0700
X-CSE-ConnectionGUID: nnlrErOJRmWMOTj/MwP17Q==
X-CSE-MsgGUID: +GrUhSX4QsqxkK+YowOn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76751669"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:32:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:32:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIAtwStontmQGMXV2b7+lIjnVS1toR+NRV9NlrJCA79su1Jffd5ua1cPP46GilFQTc60hXXhxvssQAgsK6f7gO5p5UgxkqeQBmpIS+GLsHrEtRg1yLsPUJpbXLc8KOjLY7jl8Gb7NBqw58NpupjSRiu1S/tReyr2ZNjvNY3boBp80RVB5rKVEGxn6yJ0sgmJz4y6cx+gYYqpwTwMUayTn/J8WcHTCQyLNiENUVCWp66LeghpR/l4tIKVON8552usiaYV73+su1hVkwJ2Wf1tV6dFvN0wPLwHf0NAUFc0QIpRfFJ199Fq7XiOSt47JPYeZUaqfDXadEuJb6VeNE2Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+gdPjlhdRoa/icp7FwuL0+xbBgzz7H41qTyybjcdLY=;
 b=EjQlCoXc41qwCJ76l/LAwdOk9WM+5ru+24pJNOtiS9eNtNdN7peF94Skk1x4/yVShCwlY3KzDegbIhTpev3DsxzuvNlINQ9uk7EAAVbkoztTQaqEcr5nVW8KWDx0MaJutcCWulDrLj7KuFgzdfmOGXqIPNCYzTYGdNI+3FbNMSuL9Xh28s3yHdyoT/jlzJdDtT9zj/x0P79joPAhCTjnPImyxqweQZcsETHweQuiXUy0A6a+HsgqGvQ6yERziRBnw32m8Otr3dN/fWeF/7Vun0aRBvPmw9nWdzjJDE6VuWtKzSZRLt27eoNuv/O/DLU4ccZBM1+9nzEVB5fg3vfG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 10:32:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 10:32:27 +0000
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
Subject: [PATCH v3 4/5] PCI/IOV: Allow extending VF BAR within original
 resource boundary
Date: Thu, 10 Oct 2024 12:32:02 +0200
Message-ID: <20241010103203.382898-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010103203.382898-1-michal.winiarski@intel.com>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2b1505-1539-41b3-3a73-08dce916d5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTllWlBXcTJjNFFwK25MYnlSd0hPUHFGaGVNOEMxK3g2anFSdjdlUjFZeXlw?=
 =?utf-8?B?V0o1K1dsTi9EaXplUVJ4UmJDRk1PRDVTZXliWUFWdzQ3UThyc0dsdncweFJs?=
 =?utf-8?B?VEJCWVA1TStLYjg0MWhic2tLdFNpelVQSkJZZVpsN1ZzbnFuLzZadFhsUmcz?=
 =?utf-8?B?VWFPKytnVjU2MiszdkxCQUg5QTMra1lOZHZXNExwQm5HVktlVFAvUTh1dFh4?=
 =?utf-8?B?R09xY2RQTURwUmx4TVQ0LzB1ZUlRM1ZhUldBbjcwbDRTamFraTJ4UVlQTXo1?=
 =?utf-8?B?bVFYYWFrcFJoQnRwQys4dDVWY2dNNmZvZDNIS3FMbmROeTk3R1BOTFFoOXF1?=
 =?utf-8?B?cU12Q3BPYXFTcjFpRE1yK0NpR2dKM3Fmb3Z3RTJYNjNVMnNMQkRVTE4zcDgz?=
 =?utf-8?B?TXgyclBabWI4bHR5cHR1QkdENGwyTUQ2VTJLbkNKSGlOei9yUzllemtRaUx6?=
 =?utf-8?B?OGFDRmlQUStrWjA5bHJTSTQ3REZQOHpvYXJ3U3BhUVBlNzV6QzBNYlhZYzBo?=
 =?utf-8?B?NE5Hb1ZrckRmdzZreEI4Z1A0VEJCeWRBRG1CaDhxVkFkUHFud1hIeG9FT3JW?=
 =?utf-8?B?WC8rOWVvNXZWUDhnWHgyY0U1bUl1UGhuWXpMRERkVGVoUEJFS0o0OHRWRFd0?=
 =?utf-8?B?RGw0dC96T2VHOS9iUHdySVBCRkpOUzVGTzEvck9NU2JaSmY3aEZMbFlWNjF3?=
 =?utf-8?B?WXhCeWRWSjk3WjFwYVZ2aVROckp0dk1NSExOV2Y4cUF0cEhZRWN4U0VGaExq?=
 =?utf-8?B?b25vbEpZWjlaaDFlVE5CMnUyUUVvWVlUTjlaOTcrd1M3U2JQaEl2NDd0SW4x?=
 =?utf-8?B?N08wUlN4bG9sUWpKam9seHFSV2tVNnlKMC90b0Z4dTQxcFIrTUpqUHl6d1dn?=
 =?utf-8?B?TGM1cWkyV1c4aFY1V0pQMGdYRjFFdGdPN1UxZkNwQVB3SlVheGh4Z1Nlc0ZO?=
 =?utf-8?B?dlYrQ29iWE51bGIxbVpiNFJhYlZ0Yzc4MDBrN0pudUlTd05lUVpRQmxGUjBz?=
 =?utf-8?B?bk5vZWxCV2w5eENROFRVd0RXTm1CbllpcDF2T2c4U0kwcnIxU3lyZDVTTFVZ?=
 =?utf-8?B?MGhIc1ZVcWZ3TGd4YklZT3RQL1UrMlBrUGQ1dHMycjlnMFdVK1dvL3pKTy91?=
 =?utf-8?B?ZUg4dEgrdmU0UzNVa3VQMXpCMk5KV3BOdDloM3V4U2xrSjJLY1I0dlZjZVJl?=
 =?utf-8?B?M291QzBMWmpSV2hwS25EYU5rL0VuMnhkTVQwOHdqSW9PR2I3KzNLdGZhWHdp?=
 =?utf-8?B?Uk9WUzhWVGxSSkdtaGtDalgvVncwQk9WNm9uYjJkWnNxYUtrQnd3blMyRnRZ?=
 =?utf-8?B?RUZhc2RMc3hxNkdOUElRdklrNUgrZTJ3em5zQ2FOUlJpTityTDdHR01yd1Zn?=
 =?utf-8?B?eERubzEra3ZmYlFlUVJkWEc5cCtSemJ2RkVCQ0pYU3d2M3RTRVpiRDJWV2RE?=
 =?utf-8?B?U3Nnc2V6OE9MamlLc3l1Qkp1MDR1Y2FPZW1iRnRONXUvSXdoYWYvR2tjcGc4?=
 =?utf-8?B?Y2w5T00raDk2MnRrZk52UDdrdU9YQU9CN0dPY242RlVJVmdWMzYvajMwemV2?=
 =?utf-8?B?MEFYMFl1OXpoM25OYlcvNHY1RkpFbHNJT0doTDlvQnNGSWc5cnFOejFqQkRy?=
 =?utf-8?B?MW95VGI2MS85MnV1dUJRZ2dpcVp0ZXhPRmpPWktMUGk5M2QwZGhnNmhWSEtk?=
 =?utf-8?B?dytSNTNPU3NPdmhUSmMwL2xEbFRJOW9zVGQvSGpUcXFtUGpXS29ERHl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxreDVKczZRQUljM1BNelhIUHQybkM3cm1wa3RxUlk0MXNlaEtrMmdTaDhm?=
 =?utf-8?B?ZHpONUREa3o0aUh1d2UrbVFxV0hFRDVYZEt6SHZxWXc4Z2NwRFI4V2ZpT1Nk?=
 =?utf-8?B?YzNZNFh4c2E2WnZNUlQreUp6K2Z5OTFzTUZhY2RQRU83YUQ2Ri9ya0cyMkVZ?=
 =?utf-8?B?dTVPRzUxYWowZmVlcnJ0QUtzaHAzRkk2UEl0eU0raU1SOTQyTlVWSTBjWXZE?=
 =?utf-8?B?ejVlZllxZG1zSGFnV2xSOWgrTmNXSWNmbFNHSmt2WXF0QXBGUDgza296R1Qz?=
 =?utf-8?B?UUVuMURwdVFLT1BqdXB6Wk50d0JUZmhoYXYxVDBGdUl4KzQyeDlLTHkwZTBu?=
 =?utf-8?B?MmhFNklxTUVPSlZpS2tBNE1sek4vTndBZjN5Q2hkRjBsMDNHOW41eUJPZ1Y2?=
 =?utf-8?B?b3dGNGtobFdMWDVnMzRJd1VlS0EzS2V3S2JuSUpoM2t4L3pOdUZ0ait0UWNh?=
 =?utf-8?B?bkcrQ1o2ZmJ0L0UzNE9pbGNUeDQyRHV5ay83ZXc2TzFiTk5NWXNsaHRUbk5v?=
 =?utf-8?B?ZzVuSG5yY1hGUW5nUGdwdUNFd0ZBZzc5aTFKYmRJcXN3Zm1LUytaMWFlSFdV?=
 =?utf-8?B?TDMxUThjZVI5M2lhTml6YUxVak9saXUydmlsYkp2ajNLMUkzZEJYUU5RNEkz?=
 =?utf-8?B?YkpXc0orajlYRE02UC9pWFBPU1pTMkw0L3g4RWVyTENucmdUVzdsbnplcTE0?=
 =?utf-8?B?OGdCN0pXbVlRV1ErNjlseURpU2gxZ1lKZWx1bWgxanM2bk01clFONmFBRzly?=
 =?utf-8?B?c1hiMmxlbW92eVdLV2VDdTJLRjZWQW5xN3lmNmpNclJ2TW56SnhvY2dza1dQ?=
 =?utf-8?B?RTJFS3FWZ0JjVjZ3Q0x3Qk1UY0VwR3NqNEZITzBscHdLRFBuVG9GSTR2RS9K?=
 =?utf-8?B?eTRFVEc4YXl0MUxnWU8xR0RicTI0SE1LLzQzZ0dyNHFNbnBodXdkb2E0TzND?=
 =?utf-8?B?Y2I0aHFkaEp6VE9PcVd2QTg2MHF5UThDS29jVk5XQjRpcVo4bHpIdnMrbjBD?=
 =?utf-8?B?TVZlTm9yaWZEeVV0RkRxdDgxZGJqeWFBZ3REUk9qNkxUNlRPNDg4Y2QrLzA5?=
 =?utf-8?B?aUNUbHJOckNrZzBwUFkzNHRWRmIzUXgxTG83T29CdjJUb1M3ZGo0QXcvUXF6?=
 =?utf-8?B?eGlhTHMrNGRFZzM5S0MzcVNtQXlZbVp2aTFYRFhDcDloSFQ0aElLaS8yREs1?=
 =?utf-8?B?RjNHT1J5QWhWNXcrS3U3RXhZdFZ5SnQyN3RPdXhWVS9aNnoxN253K0dNWFNG?=
 =?utf-8?B?WXZ4a3MxRnJkYUxxbXlqTTZGa2o0OURhbFFva0wyRkZRSFFEUmREc3pTbGFZ?=
 =?utf-8?B?MG9lRzlXZTdUNyt4RnJZeXFaeUFrV1A2WjR3aXI2TldMNlM1Z3U2MHdiS1h2?=
 =?utf-8?B?RG5UZUE5RXJWckNhd0t4dGxDdUxvc1FiaUZSdG9DTnVKckhuTHpFYXBWUUJq?=
 =?utf-8?B?Zld3WEhOM24ySmlwWUoraEZ4WEZuK08vUld0MXcrWk1iWVUxczdrNGpncHVY?=
 =?utf-8?B?Zm16T2hVWU42OFBBMGZQMjNhWHNjWldvWjJwL1krSlk2NFlYRWJUWWN6MUdj?=
 =?utf-8?B?V2JTZVVBN2JSbSs3cjRJRHo1ZzJhYUdXR1VMbGNJQm5uT0FtWHc2T1FhVk9z?=
 =?utf-8?B?c0l1NU4zNERHU3NTZnA1aWhTait6REswNno2OVBROGpGTDVLUURWSkQxM3lT?=
 =?utf-8?B?M054UURDV3JHMmZTR3plQXpnMGtNN1F0YVpLR3Ryd2Jxa3Y4Y3BvalFMMGY0?=
 =?utf-8?B?YnlmRWNXSnZsN05OTW1LVnVDbVFnV0RQZGNEYzlTM0JLUldSWDhPZVo5WE9z?=
 =?utf-8?B?b0haUHU0cVVjZEExMVJGdU9MU2M5bTUwYjY5Q0hkaGk5VnBPTmt1Uk80dnNT?=
 =?utf-8?B?Z2s3REZNcHlxeUNlQW1FalFaSnU3N0NXaEx6RnBqTW5BZjk1ZkNneTBmS2JQ?=
 =?utf-8?B?dmdjMlpBNWUybnIzZDZ3czNBVkdCc1AyNmRtbTlCZmJ3U0lXdDlQMXZZOHUr?=
 =?utf-8?B?NlBRcjNTbnBvelgrY1Q1NnJEL1FGVFNmVlQyU2JGS3dSbHVmSi96Y3U3OXZx?=
 =?utf-8?B?S3VCQldsMFI4aFEveEp0WGxNQjlHR1RLWVBOVm9ZNnd5aEdyTmtDbkVWdjF6?=
 =?utf-8?B?emVDaEhKZGt3UmNCT1JwNWwxM3ZlQ1pTNGhVR3JFdFRWWWRjdDlZVnkzbFMz?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b1505-1539-41b3-3a73-08dce916d5f8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:32:26.9304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQajWpZPgQEaOzB4W+4QVDJUsgSbCSqZKVEToILOHmRb6XhTswaKf3DRUmo3/ADMdKCtnu4dJ71m2UeUj9qhSKS2B9MYar/f51CfGblxMDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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
contains enough space to fit the BAR of all SR-IOV Virtual Functions
that can potentially be created (total VFs supported by the device).
This can be leveraged when the device is exposing lower than optimal BAR
size as a default, allowing access to the entire resource when lower
number of VFs are created.
It is achieved by dynamically resizing the BAR to largest possible value
that allows to fit all newly created VFs within the original resource
boundary.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h   |  1 +
 include/linux/pci.h |  3 ++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 591a3eae1618a..f9071c1cfe9ee 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -174,6 +174,86 @@ bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
 	return cmd & PCI_SRIOV_CTRL_MSE;
 }
 
+static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)
+{
+	resource_size_t size;
+	int ret, old, i;
+	u32 sizes;
+
+	pci_config_pm_runtime_get(dev);
+
+	if (pci_iov_is_memory_decoding_enabled(dev)) {
+		ret = -EBUSY;
+		goto err;
+	}
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes) {
+		ret = -ENOTSUPP;
+		goto err;
+	}
+
+	old = pci_rebar_get_current_size(dev, resno);
+	if (old < 0) {
+		ret = old;
+		goto err;
+	}
+
+	while (sizes > 0) {
+		i = __fls(sizes);
+		size = pci_rebar_size_to_bytes(i);
+		if (size * num_vfs <= pci_resource_len(dev, resno)) {
+			if (i != old) {
+				ret = pci_rebar_set_size(dev, resno, size);
+				if (ret)
+					goto err;
+
+				pci_iov_resource_set_size(dev, resno, size);
+				pci_iov_update_resource(dev, resno);
+			}
+			break;
+		}
+		sizes &= ~BIT(i);
+	}
+
+	pci_config_pm_runtime_put(dev);
+
+	return;
+
+err:
+	pci_warn(dev, "Failed to extend %s: %d\n",
+		 pci_resource_name(dev, resno), ret);
+
+	pci_config_pm_runtime_put(dev);
+}
+
+static void pci_iov_resource_do_restore(struct pci_dev *dev, int resno)
+{
+	if (dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES])
+		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);
+}
+
+int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+
+		return -ENODEV;
+	}
+
+	if (!pci_rebar_get_possible_sizes(dev, resno))
+		return -ENOTSUPP;
+
+	if (!enable)
+		pci_iov_resource_do_restore(dev, resno);
+
+	dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES] = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_resource_extend);
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
@@ -438,7 +518,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 				  const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret = 0;
+	int i, ret = 0;
 	u16 num_vfs;
 
 	if (kstrtou16(buf, 0, &num_vfs) < 0)
@@ -480,6 +560,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 		goto exit;
 	}
 
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		if (pdev->sriov->rebar_extend[i])
+			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
+	}
+
 	ret = pdev->driver->sriov_configure(pdev, num_vfs);
 	if (ret < 0)
 		goto exit;
@@ -874,8 +959,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 static void sriov_release(struct pci_dev *dev)
 {
+	int i;
+
 	BUG_ON(dev->sriov->num_VFs);
 
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
+		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
+
 	if (dev != dev->sriov->dev)
 		pci_dev_put(dev->sriov->dev);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e15fd8fe0f81f..57e79f75e4c8f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -403,6 +403,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 573b4c4c2be61..023c0fa1dd9f2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2371,6 +2371,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2423,6 +2424,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
+{ return -ENODEV; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.47.0

