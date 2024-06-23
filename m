Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C209913863
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 08:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390910E030;
	Sun, 23 Jun 2024 06:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Ntmx+sKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9310E030
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 06:59:08 +0000 (UTC)
Received: from rly12d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly12d.srv.mailcontrol.com (MailControl) with ESMTP id 45N6wflj101740;
 Sun, 23 Jun 2024 07:58:47 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12d.srv.mailcontrol.com (MailControl) id 45N6vvma096261;
 Sun, 23 Jun 2024 07:57:57 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by rly12d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45N6vq4E095279
 (TLS bits=256 verify=OK); Sun, 23 Jun 2024 07:57:57 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1CnXLaU7nXtNreovovGgAootoL9Ix+2tgzD7fml/ztQFQjpaUAOW7RabzZRd2LqLDYfP/9Zq3QZZd6nnPS7yfsHjP2GtYThlo3ICOs7USc+klDEObaWnVCZdddHhiwOV/BPvx7T6EydFS4O/vgJqyMeePVmgjGWMarIVEjWiGZjnQd/HrPErQQW03eEcq2O93IkbcQH0Pmu9VZ1sbOAMLFxfFiEaJa/GqH291o2QqnISlL9kWydF8dDmi7NLg40BDImUfPCXoVLrvO83nios3fY2ZjxyDoHxgu0dKFZFhF8Ii+AmL3uIoJYkVvR+uV+6JZ/FlNVbQ8fr1RxntdbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfuy9+jAEbgLMT+S5zRv2/V771fglrd/3qxxEWMdwoA=;
 b=br9yKFXnUqEl+hEX6wyNA8mSpSW+sjbslfoLkf89BTm4k81D2mOEWtteDUHdtf0X5IXh7nH34kkxJRTU+EXcJq4H6gqYVxKIHddc1tI67HWiLg2arXj8zlutDRGF2P29tGo1+ePFLV9ZJjJQUkAS1PcwmoIYWcDt3xlG4Yq0TwHSCfw/gSBKV36oBMDgt/XyIqrpfNO/xcviMNz3gKAp3CEE87x5tBE1pIAhYsyqN8vRHDId+F46yWiT4h4QWF+cuTc9i+mkRnvr6Q/pqy6oJdcOjCC+6hXz5xw5UbjlbeA3fFfbJyN90EvgTtnpkS0x22rg58FoUMeApY0eaR50bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfuy9+jAEbgLMT+S5zRv2/V771fglrd/3qxxEWMdwoA=;
 b=Ntmx+sKLrwGygh5W/9JehEXsc5TaWTeaOE0CzCUQSrtFyzdMmEm03QW5uEZc36l9ol9+iFN+nnT7yhJHdsKCzY7WO3NrfcyFHKB+SGIlvDaaiDxTf39X9LsDgAIl7XZ20lio0OaQzFvb8fr8b8XwhPlJ+ZJRs2o9BEX+R1mRy34g89tcQG0dCPA0aVsQIpHEK5a+0Y4LBP0Jh+n23DoefxY5WBW7WmFUcUqc90A0qHwNa1IiWouN+Qv8tz+NU5GuAkzEGMQHXAYLbCo3LzyqiXUB8EDzcN6M4S4uDJhk1cnbY+mWMinLNKIHQSMiG23oROC7pT2mr45cxmZCCmxzhw==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS2PR02MB9882.eurprd02.prod.outlook.com (2603:10a6:20b:60a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 06:57:51 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 06:57:51 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Topic: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Index: AQHavWrP8fzUP7TvlUuSpdkfhyjIlrHPc/UAgAKZx4CAAFg9AIAClIWA
Date: Sun, 23 Jun 2024 06:57:51 +0000
Message-ID: <a1a3bafb-c64e-4960-a826-f49d4679d7a0@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
 <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
In-Reply-To: <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS2PR02MB9882:EE_
x-ms-office365-filtering-correlation-id: baa7d008-b69e-4e1e-443c-08dc9351cc9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?d0JyR2NXZXEweUg4K2Fna0hrVTcrVnByUzA2MlYxVklSUHZHWHpZaFdnczR6?=
 =?utf-8?B?N0NLbS80Qmg3dVE4SC9ZcFlUZUJ1ZzhmWTJnOURobzVPOTIyN3ZjU1hJRStI?=
 =?utf-8?B?OThPQWUrUVYwVFB2VkRvaGpQT0VUVG5yYWVqSjI0NVMxbjk1disvWVllNnZY?=
 =?utf-8?B?UjRRUTVkUVhvYXNlNnl4cUVDMi9PdW9LZkF6M09aOVVHN0FtMlFWMjU1S1hy?=
 =?utf-8?B?a0FLME94YmtLNndpZkdDYkNuc25md2VYRjJvcVlTTXBJYmU0WG5EWGZnRm9r?=
 =?utf-8?B?NW5nTFdnZkZUYXdlUGxjMDdzNGNYUHZDeDBJTllleTAzblpVdS9HQzVTUDQv?=
 =?utf-8?B?YnhZZzRPekJldmxKbjg2UlZ1UzhHY0x5QmFOdDJLZjgyT0hvZGJNWU01Qk5M?=
 =?utf-8?B?WkZMQjNBTS9JekMzT3krL2g0SHk1R1ZSOFEvY2dRbDd3eGQwcVVjN3ZGcGtJ?=
 =?utf-8?B?b2ZIZzdvTE9uZTNoMXFLVEFJek5Lc3MreEJ5N1l2NGdGV0lYSzdiSGpkL1pG?=
 =?utf-8?B?TFQvalppK1VtNk13dVBWU3hMc0lYNHhSWkRJOWUyQWZJc0tJYi9XU3NHY3Zk?=
 =?utf-8?B?VG81Kzd1UjREWTVSNHV5dmRhcUh3MDBlVktPUmMxcTFQakdJVHIydlc2cGJy?=
 =?utf-8?B?VmhQN3VZODZ4SnZyeEY1NTYzVHFpamhLdUNUeTh5MmpyRXBOcVh6Zk00Rjhn?=
 =?utf-8?B?NlV6MVlSNHA5bUdjamhJRHNETnpITTdPMDA1aEs4djU1R1NORjdBeTFJVWJ5?=
 =?utf-8?B?bkZpN1dCZ3VYaEtadmVjL2dFSUZxc0pSRzBkYS92YlhtZEdnU2cxSHBraGZV?=
 =?utf-8?B?Q0pqY3FhSGc5L1BPZGdoVE1aSm5WWlZoQnF2NHFYSVJkQVBIQ1F4SnlUNlN0?=
 =?utf-8?B?RTlVbVRZN0JwVkRvTXpBMHB2ZFhWV1Z5R0QxRlY3WDk4aGJVTVRIZzNqNkR1?=
 =?utf-8?B?VWhqRENOZVgwdDdtWS95WnN2SWhyVDVzdC8yZVpza0lkOTNybHB1ZzZoY3Jo?=
 =?utf-8?B?SEhMMTBuMFVvZlV0WG1mMk9QeG8yZVp5cGtPNkRCeDUyWUVwTDUwOFJhbkcx?=
 =?utf-8?B?RlI3L3VTR3FGMzI5TjVXY0RXYjU0THJMZEl4NzJhQnFDUE11QVVHT1hsNklu?=
 =?utf-8?B?WGFldFdhRVhFQnU3NEJINmhrK001aEsxdE5qcG1GMFNiL0lZRzFyNXJMbnF5?=
 =?utf-8?B?WTB3V1lPVWhXbGVqQUl1QndaQWZpbmFxRzZTY0pMa0JLWVlBN2xNQzROVWly?=
 =?utf-8?B?aERkT0hvZldNZG5PbXBSYlZ2Zkc3ZmlYVElZSkE0QTFTZ0kraHQ3KytVcmVL?=
 =?utf-8?B?TkVCS3QxY1RUTXFRczBiTlhDK2NXcHcybVZEazFpamFVbHp1M3R5cmhVM3J2?=
 =?utf-8?B?ZzRUM0sxZjlUY2paZGw4SytGL2FhU1pGTUZ0WHdZMHBJUUg5R3VEajBxVGRP?=
 =?utf-8?B?UDFuaWhhOWg1MXNYZS9YRG9oM0J0RWZrVUMrNm0xVCtwbkVxa3JNdXdjYU1M?=
 =?utf-8?B?dTBFQ0dNdEFuRjZiNnl2QlAyMDhkMk41RW5zR3dUbXg5RTduU2F2UkRyNVJ5?=
 =?utf-8?B?NWpQTnFKcHJHckxGTFljVFIveWlPOGs2YXZiTlVQMEYydVEyU1ZqTHBjVzR5?=
 =?utf-8?B?VE5tSEhGeTl1c1FqVnBrTUx0QlZaOEU4UDZKS1A5SGxodDRsdk1aakNtVVdz?=
 =?utf-8?B?S3AvR0lEYmY5Z1VVV1k5TXNGYVRsazcvY3JIWmoya0ZNeGdkbHltSnhrVHl0?=
 =?utf-8?B?TnhxMFZuYk0yVTVvVHpHekJ2MnVMSVZmbEVDbmx0NmNLbDlkQ2w5RnhORW12?=
 =?utf-8?Q?Rr7cGixjfGa87fVd7HSGOw0BL5wOT5ha8EJtE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmxydUVsMWdoeXhaRE1abmhpR2lITVhmWGpFeVRwTy9QVjlRMzY4b1kyOHUz?=
 =?utf-8?B?VXJGUW1CMDhGOFhNa3laY2l2Y2N0ODJMVW9yZUFMTmhhMDVIRVRXYW1LUTFu?=
 =?utf-8?B?WDR3cElCd1lHb3ROK0JLZmpybWdFMGJaQjFmNDhoSUpKQjRxN0JOd2U0VzBQ?=
 =?utf-8?B?b29aTXNkOEpMQW03bXJXM0JIY0IxWkszNTdvOWVYWGFBVXVwNXFHOS9ueUMw?=
 =?utf-8?B?b0hzZ0JZVXlWWWZ5Kzh6RHRpMGZLMUtWUVdpSlJ6RitRUmo4bGNtRDM1YXRa?=
 =?utf-8?B?WTZxM01yMjRBbjRWUVI5cldBMlcvMlhSbkgvYUx2VFA2Umd2REpNeklhMXVo?=
 =?utf-8?B?V3hGaXNKMC9vWDQycnlkVkFtN2ZQWHFnaU5zNUtkaVJndTh4eVVGWE1YdmEr?=
 =?utf-8?B?K1plaTlFM1ZtSkdzeDRFZkhsUXBrbThuc1VkT3h0Z3JUczA2ZWpJeitHbjNJ?=
 =?utf-8?B?V1kxTHdTOVlYbkZ6SmlSMXZaV2tMczhtQy9kcXdoanl3OEVhdk1oWGQzUVU2?=
 =?utf-8?B?MFJDSEpIVXNLMXZUV1pBVkhIeFY0QklZa0pyL2pEUTdtblBROGk2K1VuL2RN?=
 =?utf-8?B?WUR3SVV0QXVidUE5UU9DTVJOZ04rSUtyeXBzTExaTXpMSkhIb1o0L0NTanVM?=
 =?utf-8?B?ZmpTYUM5d3ZYdG9zaTNmYUJHdkwwZGVEdmVmSGVWSDQrNnZoT1FWOGZpa2VU?=
 =?utf-8?B?ejlpL1VOaXVpNXFoRDhqQ0NETGVjSnJTLysxNW5vdGdvdytBR1R3M2lrOU9B?=
 =?utf-8?B?b0lmVDhiSVo3RnJvajJqVlhVVjhCcXVaaExVZnZFUnlScDFXTTRjNGFsLzZG?=
 =?utf-8?B?MFc2aWsyVUI3NWg4TVZjYURvWVFtVnJuSGhNQnFWQTBOOXFobHhYL0N0Mm5W?=
 =?utf-8?B?Z3dWbjdJcXJHVXV1SWFGR2dDZktHenRCSDVhdlk0akxnRGlacERacjBTSUxl?=
 =?utf-8?B?SkV3SlBTY2NxaFpqNHlQdDRPbS9OSEx1Mm8zV3ZFSTlmQnFVZ0NRL25nSXBr?=
 =?utf-8?B?bmFQWlIzZ1NSR0t4Y2xhL3Z0enBJZEVURzhCUUJNVTdKQnZqSmsxcUlXZkl4?=
 =?utf-8?B?dEZWTmlwMTVoWWR0OWtPbVJmZUlkSjhLUytlUms4Y2RtKzVjRU4xb0xjZEti?=
 =?utf-8?B?SEhKbmhOWUljeTA4RStPYXBTTXY2a2xuSlFacGcvRzRIazZzV1ZVbU9DbFdW?=
 =?utf-8?B?MVlYSGRZekxUVVlQT20rS3JFY0JyYitRTXAyeHRPdW8wQkdHMmdoWGxQRFE1?=
 =?utf-8?B?ZU85MHA4TGM2UGwyY0hoR0FGNDRXSUdxVUluSGdHdWdRTnRlUHI5R1hUTUlq?=
 =?utf-8?B?UktNUG1aUm56dFNGRk9WZHppZjBWM0ZtTzdqV0dZdE5IOHREbFdybHNPM3pU?=
 =?utf-8?B?QlpIZXFHazBIYjJUL25oTFozeG9OaS9UV3lkWjdHVTdEd0hYYU9HL1BKbE13?=
 =?utf-8?B?T2FQRkppUFVPdGNxdmJ1MDBoeHo5ZUV0a1IwblpxQTFhYXBJSFhkRXVvbEh1?=
 =?utf-8?B?d0JITC94ck9jVnJkajdSYkpSRmhWd2hvL2U4YmRlZnhTVjAwZnpYL1gwZkFk?=
 =?utf-8?B?SkJPVUVxSjVsckxqSTVUU0VZa3krT1N2dFVtbVNuT1MwdnJHbDlIYnBDSXov?=
 =?utf-8?B?YnpYejdwa2dpVTRITFNwNGlMNzZwMFpWdVdEcVVoVG9yTitQUGZGNGlSYjNW?=
 =?utf-8?B?NTR0Y25DYk9uaHg1QmRSTVkrd24raUJQN0dkWFZCeFhKbGFRWFdoeWZ0c3FI?=
 =?utf-8?B?bjVwQkNWY0x6WjRBdUsrcEtrOW9YbWRhQmtDcTZacE5Sc0ZHVERvT2lOWDY2?=
 =?utf-8?B?bHZZTVVzdzRRMzQvWTBVOWVwVTVNQlNlRlN3d0owaVlERGY4U2FPZytrRUJo?=
 =?utf-8?B?d3dNVVdJbWdXMUNKR0dUQ21GUWgzdm41alhRcWlkblBTWTNIT3JTZHEvdjVZ?=
 =?utf-8?B?ckhZV2YyVUtVbmdrc3VES09tTDAzeEFMRmJoSFY3NUkzU1BEaXZ6T2ZnRW1W?=
 =?utf-8?B?SlZvZmZNV3hHWVNLQzFNOTVMdTU3TURHaDZXMTZoalIvV05BTFRLMmZkeWVx?=
 =?utf-8?B?NWhjcEUrbEhuZmlTQnFRa3BDbFB3MUtCZk4valdxQnRsNW9qcWROWmpaMVQy?=
 =?utf-8?Q?bZSMKqRwu72n5H+DSiOfMKu44?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <737CA35007430B489861B40AE9C493DF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: e3Ku+FTS2VOvwl5ho+xShiumf5Kmu5Is5S31FdgfYGsmHyUGsnWwtAmS2va0ucc/H8bclE74k+MKMf/Db/EP6BjSowcFDVhKW1UM4m5MH322cCShDGWsKh4lgRKaA0+GiIJrkDByZy3f/QN83AjyWWG9Tfm+Ao1us1B2PEUs0FxQ7nIljHqfGaHkj7UcVZEY6kkzpVMzxcPYQ9sMR1QU3fW5bV0aKawVp4aJd/a321xIJAZth3R4yh4KWS8lJPra3Lof+griwhq1UkgDhjjH7tbUkctxdLTJ2HU9t7ex6kwNsW+aRwS6NqlVb9AsxN3gQXYCYXZEXTa7yr/9QOMmFVB996xeut07KfbpcGIvfAezgxRyhJmG+RPls/JdWy5FQlv2HoikwEuyF6L4+bbdc74J2NgPZZF7DrSaGLkMzxCoWCFaVJjlS05PyZEtBW726M6oU6XkdYAEANLgx0Pvc+vrg21fQGAMpoyplBV33V5ClmyF0i83Tdh3/ck4duX43FkzN0OzKie4cig1S4lULzfZ2Xd3vX0lVcnxCQrsCJ6RcjElBKTcZDAJyZaUHRcuDmAMqoWlkElMPoQopJxKDkwV20rK1jMWa+pNqdMceKFZz5Yjw6VcleQb/4m0ICLl
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa7d008-b69e-4e1e-443c-08dc9351cc9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2024 06:57:51.3826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eLauBEBBhgKklpUC9Ws9HfcevLdg23GafTWZbuANLp118eKYw2YukWcWXhVttQsb6RbFd9sv+ISN7DLvMffTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9882
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTEyNTkzOTpGUEtleTEucHJpdjpSVyedlWVdfXhaaYQn5wu/wbAG48CtXCsLujHfejfdb7ehkGBRTdoz99VX2ud9HMsuozhCie+pU+BTHBDPbbQBKt1GStxI9yqtMulcYeo9ZUIVjrn7aRHkBsB0shwBaaOSZ//6Wg79tSgoou/v+fHQ4cKfGEz8P4N3rdYZeq6UUaCZ7LBQhW+BJwn5NDm2hwogG2KtfF/8sqlTYkvi4rZ7Xtk85A6eQDvByBqcGvyf8gwCpBF3a6IOq6pSYSSWrXAPi+h03x+brKJ6c0UQhE3cNNvipeABw9xTBQtbNKWLc5xKXgqaRZywMkf9md0mOqtjMs6p4r3wq4JbhBD6a3Lt
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.122
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

T24gNi8yMS8yNCAxODozMywgQW5kcmV3IEx1bm4gd3JvdGU6DQo+PiBJIHNlZSBvdGhlciB2ZW5k
b3JzIGhhdmUgZGVidWdmcyBlbnRyaWVzIGZvciBkZWJ1ZyBjb25maWd1cmF0aW9ucyBvcg0KPj4g
c2V0dGluZ3MsIG5vdCBqdXN0IGZvciBkdW1waW5nIGRlYnVnIGluZm8uDQo+IA0KPiBEaWQgeW91
IHNlZSBhbnkgYWRkZWQgaW4gdGhlIGxhc3QgZmV3IHllYXJzPyBUaGlzIGlzIGFsc28gc29tZXRo
aW5nDQo+IERhdmVNIHB1c2hlZCBiYWNrIG9uLiBXZSB3YW50IHVuaWZvcm0gQVBJcyBzbyB0aGF0
IGFsbCBkZXZpY2VzIGxvb2sNCj4gYWxpa2UuIFBsZWFzZSBjb25zaWRlciB3aGF0IHlvdSBhcmUg
ZXhwb3J0aW5nIGhlcmUsIGhvdyBpdCBzaG91bGQNCj4gY2xlYW5seSBmaXQgaW50byBldGh0b29s
LCBkZXZsaW5rLCBldGMsIGFuZCBleHBhbmQgdGhlc2UgQVBJcyB0byBjb3Zlcg0KPiB5b3VyIG5l
ZWRzLg0KPiANCg0KSWYgaXQncyBwcm9ibGVtYXRpYyB0aGVuIEknbGwgdHJ5IHRvIHN0aWNrIHRv
IHRoZSBvbmVzIHdoaWNoIGV4cG9zZSBkZWJ1Zw0KaW5mbyBhbmQgbWF5YmUgc29tZSBvdGhlciBu
ZWNlc3NhcnkgZGVidWcgb3B0aW9ucyBlLmcuIGxvb3BiYWNrLiBJJ2xsIHRyeQ0KdG8gbWluaW1p
emUgYnkgcmVtb3ZpbmcgYW55dGhpbmcgdGhhdCBpcyBub3QgbWFuZGF0b3J5Lg0KDQo+Pg0KPj4+
PiArV2hhdDogICAgICAgICAgIC9zeXMva2VybmVsL2RlYnVnL2hhYmFuYWxhYnNfY24vaGJsX2Nu
PG4+L25pY19tYWNfbG9vcGJhY2sNCj4+Pg0KPj4+IFdoeSBub3QgdXNlIGV0aHRvb2wgPw0KPj4+
DQo+Pg0KPj4gV2UgaGF2ZSBhbiBldGh0b29sIG9wdGlvbiBmb3IgdGhhdCwgYnV0IHdlIGhhdmUg
YWxzbyBpbnRlcm5hbCBOSUMgcG9ydHMNCj4+IHRoYXQgYXJlIG5vdCBleHBvc2VkIGFzIG5ldGRl
dmljZXMgYW5kIGZvciB0aGVtIHRoZSBldGh0b29sIHBhdGggaXMNCj4+IGlycmVsZXZhbnQuIEhl
bmNlIHdlIG5lZWQgdGhpcyBkZWJ1Z2ZzIG9wdGlvbiBhcyB3ZWxsLg0KPiANCj4gSWYgdGhlcmUg
aXMgbm8gbmV0ZGV2LCB3aGF0IGlzIHRoZSBwb2ludCBvZiBwdXR0aW5nIGl0IGludG8gbG9vcGJh
Y2s/DQo+IEhvdyBkbyB5b3Ugc2VuZCBwYWNrZXRzIHdoaWNoIGFyZSB0byBiZSBsb29wZWQgYmFj
az8gSG93IGRvIHlvdQ0KPiByZWNlaXZlIHRoZW0gdG8gc2VlIGlmIHRoZXkgd2VyZSBhY3R1YWxs
eSBsb29wZWQgYmFjaz8NCj4gDQo+IAlBbmRyZXcNCg0KVG8gcnVuIFJETUEgdGVzdCBpbiBsb29w
YmFjay4gVGhhdCdzIGhvdyB3ZSBjYW4gcGlucG9pbnQgcHJvYmxlbXMgbGlrZQ0KcGFja2V0IGRy
b3BzIG9yIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLiBGb3IgZXhhbXBsZSwgaWYgcGFja2V0IGRy
b3BzIHdlcmUNCnNlZW4gb24gdGhlIHBvcnQgdGhlbiBpdCBpcyBjcnVjaWFsIHRvIGtub3cgaWYg
dGhlc2UgZHJvcHMgYXJlDQpyZXByb2R1Y2libGUgaW4gbG9vcGJhY2sgbW9kZS4gSWYgdGhleSBh
cmUsIHRoZW4gdGhlIHJvb3QgY2F1c2UgaXMNCnByb2JhYmx5IHNvbWUgaW50ZXJuYWwgSFcgZmFp
bHVyZSBvciBtaXNjb25maWd1cmF0aW9uLiBJZiBub3QsIHRoZW4gdGhlDQpwYWNrZXQgZHJvcHMg
bWlnaHQgYmUgcmVsYXRlZCB0byB0aGUgbGluayBxdWFsaXR5Lg0KV2Ugc2VuZCB0aGVzZSBwYWNr
ZXRzIGJ5IHNldHRpbmcgYSBsb29wYmFjayBieXBhc3MgaW4gdGhlIE1BQyBsYXllci4gVGhlDQpw
YWNrZXRzIHRoZW1zZWx2ZXMgYW5kIHRoZSBOSUMgSFcgbG9naWMgYXJlIGFnbm9zdGljIHRvIHRo
ZSBsb29wYmFjaw0Kc2V0dGluZyAoZXhjZXB0IG9mIHRoZSBwYWNrZXQncyBNQUMgYWRkcmVzcyku
DQpXZSByZWNlaXZlIGFuZCB2YWxpZGF0ZSB0aGVtIGFuZCBpbiB0aGUgc2FtZSB3YXkgd2UgcmVj
ZWl2ZSBhbmQgdmFsaWRhdGUNCnJlZ3VsYXIgcGFja2V0cyAtIHRoZSBsb29wYmFjayBieXBhc3Mg
aXMgaW4gdGhlIE1BQyBsYXllciB3aGljaCBpcyBpbiBhDQpsb3dlciBsYXllciB0aGFuIG91ciBO
SUMgSFcgbG9naWMuDQo=
