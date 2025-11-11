Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165FC4A2F2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F0210E4BE;
	Tue, 11 Nov 2025 01:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4AnTqwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502510E4C4;
 Tue, 11 Nov 2025 01:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823155; x=1794359155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PPQAx4DeEJiFg2ORqs8oWjlULiyKgbS0+qQGGLDmU4U=;
 b=k4AnTqwoEIaHU7lmD6utogSk/5HAsYqhDnR0nIrFXh4P16tjgkSOObRu
 TCMHgVUf34tyeN17Ht9UdFPtXf2nVbD9nbAXI6u1FFIQw1QnMEXc+1n52
 byGrRnCkUEt/XpjPteUVMPizFyvu2nH3FIoeyi5VHnUuDroPIB7Uh8l10
 NBiGIZjogxP0PRO0i6zGWHA3AKywlKbZB0TJu57cTJ50SbkuymiL+LWGa
 NuGRIks7/ZOKwWDph1fxcoc1Oal3pjX4Bk9VQ4ehxyMo5rPra6ZUmsZhC
 yFgm3Fu38QRokGN3BPYyCFeWJ8sMrLs0oZDqH73mtYrfhgIuxyFMTH3tg w==;
X-CSE-ConnectionGUID: i8N9jvzXTBa3iL4bpooQbQ==
X-CSE-MsgGUID: 0SUGJu6oSvWkzMagEEdRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75174816"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75174816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:55 -0800
X-CSE-ConnectionGUID: JkW3rq3KRfi2IiXQc56pxQ==
X-CSE-MsgGUID: MM2lDH7nTNafOMiupyYKfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081863"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:53 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cABgr4CpSkOYVzBHvY5nzhHYDzNZ8UDo/MwM9V7OYmoWHL6KC6M8csKsqlhJ8hii7X6nhEUWE7NR7u+eqHoQLJXVtKovt2tmsoO+cXK6YcC9iH5tUZEMbW150jhhdsI1MtiReQjYhK+QfQRWk//ov07GZP4pFOJeNyuFU2c2pDchZZQLvzSeHBsz1RY+cVIw/cewBVckvACOawJpyY6WEujt6p9sfz9hD4+YacmngL9w4ymblzuUA/ALPYCf9bApngReUuAIf3cut/EV9i5IHQ9sC7xLWSPxG0PLCIUP409LipmjRp9Gg3vkEQbzXIbL1hfjsyIc8fHpYadXB94tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aDp9rQ7TgdszQJc0aFTs7fQW8DNiLThtbjj9Xt1hyY=;
 b=e8aVOPICWrxy/zngUxS/7cV8qw/f9X92xdFkj/IZ6ja+gNFKqGl3g8U8y44JolY/r3ZJkELyT5Y3J9N7FXhgXoz8sx2w3cn+F6PO+wl8tyuA/9uE3/Mf0+W7EnTjjCTBMHgQFT8Ou8WS6iO7vHVvfImxnE5xSMeDrr+O+NTRdMFI3XPA3b7GIhD53LhXBcz6FlMh1QanbDVdU8SdL1Iigh2F5Gn4ldisF5b1gBoSPV6VcNe6khH81HS1/73eqj4Tv9anCDy48fjuJhukkMFK1qLnnJ2qIL81HmRgS068N54ppeeFD+HflRgK1s81mt6ojLXas+WcwTiI9CMkQcxBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 10/28] drm/xe: Add sa/guc_buf_cache sync interface
Date: Tue, 11 Nov 2025 02:04:21 +0100
Message-ID: <20251111010439.347045-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf2c861-3bc2-4105-0a28-08de20be748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2kwVktsdnFTdSs3Q0h0WTZZQnBkK2RWeU9Wb2NaUURtak1qblkrMTJ3M2Nn?=
 =?utf-8?B?ckF1Slc1MVdPQm81L0xqL1RnYmpyVlYzdHh5LytiTnFVQmt6V1FpenR3SE9V?=
 =?utf-8?B?aFFmZFdEaFdzZzVyUFVXcTk2Q1FOTDZDUlNTeC9FaVpIeDAzdFcySkZ5Ym11?=
 =?utf-8?B?K3l4WjEvUGpmeVdSVkV5OGFQUkx1TklWbzBSWlVNUnRiQi81L1BRSGVBRnhy?=
 =?utf-8?B?V2Z1MEhGVzN6NHdIM29ZdFdVOW5kQnc4akd3cU1HMmFuaW1XV3p3Ly8xSnh3?=
 =?utf-8?B?NzZmaVBKaDVUb0xXYmhJZld0RTY4V2VMaXpBN0FjZlFmTm1rUTZ2MnRGVmsx?=
 =?utf-8?B?bW1WZnpZT0dEN3JuSWR4ekREWGMvSndDTVVFa3BZRStCVjBwbWZPZ0NGcjRM?=
 =?utf-8?B?OFNQTUs4Y1YwZC9lVm1JWmlFMXNwT0Znc2wzcUVoZGc4Uno2c2N3a3NXQnN4?=
 =?utf-8?B?NUJOSS9WSitRdDM1cjdyNkJxNVhYRFliZ1BGOUt5MlU3VC9kblBDTHJmWGFL?=
 =?utf-8?B?TnFVcE03ay8xbDJRNkZhZWNIc0NFL1BOZkV2OVJVNU52QWJ3b3RWY2t5Wmpq?=
 =?utf-8?B?ZlZrdVAwdVhtbjhPY2JNdkdTR3lvN2t4V296bFpTQW9lN091b3hwS2l1dktT?=
 =?utf-8?B?VXIzU3BOaEJKWGhaZnlEWmlMcUhNNlhrdzIzbU5jVlpRQ2E0M05xMVhaQS9P?=
 =?utf-8?B?a2lPSzFreFEraDc5NTFhd0tZeUUyVnVXODQ2K1pBWWdNWDJjRUt2eFROQ2tr?=
 =?utf-8?B?SVBCYmttcHBSWmI5d0UvV2RFNDRRT24xUVNGZmlxSUpJOS9SVnVDaUFycHhp?=
 =?utf-8?B?N0xuMjNteEp6L3BraGczWTVuUnYvYWlCVjhpemtKY0R1YUNqS1ZVcm1kR0FV?=
 =?utf-8?B?RitURXV2N0tOMGNJcERvZlBKWGZOeVlpSHZrQ1BjN1hLTDE3Uk1DQndUOHk4?=
 =?utf-8?B?Q3FuN2FzSHpuT0lFbmR5bzQxWHg5WjFIdTh4TDg2dklBM0tJUFA0Snp1WWVi?=
 =?utf-8?B?K0Q5d1RiQmdCeGorTWxrQ294RG9UOWVCUjdpbTl3eDk3SWp2aVB2QWdra1BJ?=
 =?utf-8?B?TWJTa2l3Y0JzQ2oyYmRiQnE4YUhJRFpiK0F5c0ZLNmdsMjRQMkJ4SExSd29J?=
 =?utf-8?B?a3RHTVFJNlNxNEhmTkM4cGt1YlNsUkhxR2Q0THNsLzNVc0xTMm9TZi9IQXJh?=
 =?utf-8?B?ZHJXNS9seG9zcHRkRWRRNVVUdlVlRDFqaVJDTHhIRkVvc2RJeWNudC84L0RR?=
 =?utf-8?B?WjZZM3FXdEhCY3lvTXR6OFpxOUlsNThOb0JmU2ZDaDkyMExpVDE1V2pzVzBo?=
 =?utf-8?B?U3JNUS8zQUtvbmF3TDBBdmpkeWhwamhrT2FrTFhnaUxubnpkZ2g1TnE3UEla?=
 =?utf-8?B?aU1TVE1oTE1FR29QcUc4dzV1T0dpTEdVbzhKS0k4dVlSRC9iRXAyQ1h0Sjg2?=
 =?utf-8?B?eTJIaTcxMjA4ZUZ2VFBDR1Btb1p2SkxORHlQeDVOUUMxQU1zQjRQRFZPVi9B?=
 =?utf-8?B?azdSeEVCdHpKQ1VnVkdtT1N2QTBxajhWc24yQnYwRG5FM0JjVHo2b1pxSCsz?=
 =?utf-8?B?WjZCWDhHQmx2dTNuS3VuN3VZQWhZTUJ3SHFOM3VQUkZjUzkwZHRHdEdlc1do?=
 =?utf-8?B?UnpHQzJucDFHYXlPd3VWOHdZMDZ1eVZXSVg2RjI2NHBEZFZKSEIxYmUyNzY1?=
 =?utf-8?B?U0d6ZVZzK2IvV3ZwUW1oVTFBZ0p1ZEIzL0NmTTB2dWdyUk8xcFplVlJZeEJs?=
 =?utf-8?B?N0Q3NlUrOHBabER2b3JaN2c5cFY3NmhzRUFOYlVnOVVocTF3NGtvSi9ud243?=
 =?utf-8?B?a0FyUTRnMENCNEZiK3lCcTlveE9BR3labjZVeFBBZ1FjYTQrY2dlbTFuNFZQ?=
 =?utf-8?B?S1hPNG1VbjFvMUM0b2pDUlp6ZHNHZzZNUWZaUTZRNGpLTWg1Vk9vMktVbGFa?=
 =?utf-8?B?SUpWTXZVeldWUEVlMzRJVWhSQ3laOXRUZG1vNURuWkpOa3JvaXZPWFdkc3hy?=
 =?utf-8?Q?R/strsGSv60u+Axsh+4e6uC/d4e04I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qnk5YzdjT0dLd0NUZklsVVErTkFZV1JuS0FnUmtMa0E3N1F4ZjdKeXhDRlBI?=
 =?utf-8?B?MFY1WUdJUGlHQjFMN2JMdUNZRmYyODR4ZVhiaUdoSEs5UFd2NWVLOGx3T2lS?=
 =?utf-8?B?MXRodHFvenRyTkRTL3VZQVNrdHVvQzhMc3ZScVdXOFBDUE9YR0ZrVVRjZlMr?=
 =?utf-8?B?Ym0rbklEMkEzVHljVmE1dWlRTzllbXg3TFV3aWtJeGtzVDN2VFFyYlNvZDVo?=
 =?utf-8?B?bzFtUkM4RjF1cWhLZTNHOTdkaWpOWHE4QzFVRzg5U01CS2pwRnkwUHQ4M05z?=
 =?utf-8?B?cXprcXBkR2dML0psK3p4Z0FyNXlPUEZpNG5jTDB4cXgxWFpNZ2JaZXNybCtJ?=
 =?utf-8?B?VHlVVUdnYmM3WFVoK1dvUDk1eGk3MitMSWNxdmp1WG9qR0tnSWpjcFJLU2pr?=
 =?utf-8?B?K1BaM3hKWUFTaHpqeUVDRGZiYllmSktZV1diK0Y5YkhqbUN5Zjg3dmx2ZkFu?=
 =?utf-8?B?UU1tMDEwMWVuTS9POTMrSzRGNmhkNzhNNThkNkk1ZDNyUndNNk9MZklqR2Mz?=
 =?utf-8?B?bm1UMzFOSXQrbXV1cXZ2bngvRDZ2eGpPVm8wUHRtcG5WTWVqek9oSGwzaEFN?=
 =?utf-8?B?ejhWRHVvSVV4TXlQbWlBWjlHVFlUWmxFWjVkV3Fxamg4akpaaUVucmJBWHpK?=
 =?utf-8?B?MHpWUVBlZDVwdEMvL2h3bFBpZ0pDRnplWk02UUdjZnd1SWNrbDNzQ3U5T0tO?=
 =?utf-8?B?YW4wN0JwZFF0Rlp2ZE9HeE9BL1F4SkMvMUkrR2ZJNS9BcUozaFZ5RFF1SW1Z?=
 =?utf-8?B?dE9kZHNMZjVBdjhoQ1RZWFFYY0NYYm5ZOVNuKzR5WTRuS0dCMkhBNkdQVTQz?=
 =?utf-8?B?eVRBQWgyZDNXb054QmEzSnNFOFFVQnVmZFNHcDN1NGtTWDVhM2JpNWR1RjZO?=
 =?utf-8?B?ZUJCUjFLZG93ZVdKaHU1TGVrYmFYMzVWNFRQUTM0VGM3Y2lHb1hGWnVzckUz?=
 =?utf-8?B?TEd4WEVvSVkyZkZJTkliT1ZQZ2Z0WW5XUEpnU3VXSStac1hqN1RWeUI1VmNE?=
 =?utf-8?B?QlZqL1NEdDhLcWxUYUM2S1Q4OXhDTVMxVGI0MlNPUlNJTm5Odk9nUW5NOGIz?=
 =?utf-8?B?Sm9lNkVabEZzT1Bsa1pQU0lzYnoxeVp5ZGhhRzJkeTgrMTN2dUQ3aytVUTc0?=
 =?utf-8?B?YzJ4dE1GSFg4ZUxBdlFZSHZtTXhUSmJXRGdhd1NXbDIralpadCs0T1p4STVs?=
 =?utf-8?B?aGJacGRnc3Zxd2xPQjYyT1poUVFDVXFiN280WEliUG9HZ0Evd3B2enVRTlhH?=
 =?utf-8?B?cHkvTW1KaXRmZHBRVmt2RkFseGxoRGlXQTlmMzVTOUxCVStKTnNHaW5ubTVM?=
 =?utf-8?B?eE5wS2pEM3luU3pxYnZDSkxiVG0rKzFkMFNlckVsOVBoS1VEODcxUmhYNTJp?=
 =?utf-8?B?cmJ1QmgrRXFSa1hrN2lDMnUyRlVrdFNlQlhQSGNvMlBOOWFNN1FlUit5UW82?=
 =?utf-8?B?T1RnN05yR0xKNWE4eTRPWkw2aDhhUGppaGhORGJCMlA3RC9RSVJ1bmxFMWNR?=
 =?utf-8?B?eTMwcmpWOGY3TVJKVE5vcUNoeTJwTFNxeUp4YVp6S29DQVFIL2QyUVJlekhT?=
 =?utf-8?B?UEtYcHVCK0F1UENxUTcvNVJ4Zk1ZcHM1d2lIQnJrZlJKbVQzUEEzREUxR0pH?=
 =?utf-8?B?T0tVWkhMUU5sWTc4d25PUXBHVmFheE9EN0U1T2sveWtQODRUcXpEV3Zwd1Zz?=
 =?utf-8?B?OXo5ZXhialBQQWVCZnloZUJmMnkrY3dwTGl0R0wrM2R0YWNSRWRsNC9lbmN3?=
 =?utf-8?B?WVdDaE1XQUhpdExzaXBrcDVGMUxpcE9QM29DMWJ0a3lpTExlSjVqMWZSanFG?=
 =?utf-8?B?K3ZWNnpQWmdwdGtxL0NBSE9RRjcrZlhoRlorV1FXeFlhbG9FQkJqc0F4cTZt?=
 =?utf-8?B?UFhGR0xYRkxSekJtK2dZTVRMNFpzK3pSb0p5emJTSGJWamQyZTBLbTdGdVpt?=
 =?utf-8?B?Y2NYQ0pEaGQ5d0RqSlVjcVVTRE1mTm5FQUNyVDF3eUkxSFAzMHorOTFwUW5i?=
 =?utf-8?B?cDk2WDR2eW4xaU1NcDRwV1RXb0lncGFRTGNibVhqWEZjTHYwdmM4NWNHNEJQ?=
 =?utf-8?B?aWZHMUk2OGdFTytzR3Zpb29FWjFpbFd4UWpPRGFqdE9vUjJLSHFVNFprOXlj?=
 =?utf-8?B?U3BBSDZybkdiSm12K0V0SmtRN203eFdPZWNsWVo4cEk0S1BvcmpuWmUrdGZD?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf2c861-3bc2-4105-0a28-08de20be748e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:50.5868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWWHeOLTfolYU/m3fPjWRTBUvwh8VzWZAP3Q7HpcRprRI7hJ3K8eFwNoiBSfAGAtE7RoXANwhhA+9L4fFGYZlhN6mIwsk6o4g3Lt0uBCrQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

In upcoming changes the cached buffers are going to be used to read data
produced by the GuC. Add a counterpart to flush, which synchronizes the
CPU-side of suballocation with the GPU data and propagate the interface
to GuC Buffer Cache.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  1 +
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 502ca3a4ee606..4d8a4712309f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -115,6 +115,19 @@ void xe_guc_buf_release(const struct xe_guc_buf buf)
 		xe_sa_bo_free(buf.sa, NULL);
 }
 
+/**
+ * xe_guc_buf_sync_read() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ *
+ * Return: a CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_sync_read(buf.sa);
+
+	return xe_sa_bo_cpu_addr(buf.sa);
+}
+
 /**
  * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
  * @buf: the &xe_guc_buf to flush
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index 0d67604d96bdd..c5e0f1fd24d74 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -30,6 +30,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
 }
 
 void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf);
 u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
 u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
 u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fedd017d6dd36..63a5263dcf1b1 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
+ * @sa_bo: the &drm_suballoc to flush
+ */
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
@@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 			 drm_suballoc_size(sa_bo));
 }
 
+/**
+ * xe_sa_bo_sync_read() - Copy the data from GPU memory to the sub-allocation.
+ * @sa_bo: the &drm_suballoc to sync
+ */
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	if (!sa_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
+			   drm_suballoc_soffset(sa_bo),
+			   drm_suballoc_size(sa_bo));
+}
+
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 99dbf0eea5402..1be7443508361 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
-- 
2.51.2

