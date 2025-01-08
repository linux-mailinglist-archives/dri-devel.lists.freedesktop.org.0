Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEAAA05E93
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEC110E12E;
	Wed,  8 Jan 2025 14:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="RUFtUICq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="O45lInPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1239 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jan 2025 14:29:48 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756410E12E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:29:48 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508A52D4002013;
 Wed, 8 Jan 2025 14:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=vcwVCuJnaogSXlvcXvJIly26f
 yTuzDU4mDKY6zHV2xg=; b=RUFtUICqtOELUgeHcQW4XgxO1locrc1Jv8kIBx6m4
 ilvGNkK4gq3Z/RMe+hB6QcvlgQm6E85COyS3ArILfe9EIoFH+WqRW4A7Ij7G+3gD
 RC7nvRfpMuFZlt6K2wWpRluo7mSyGjWS3EsLI7PlOzz1VgYqo3Zb9qdHalxwVj+A
 Ff5puYxX/lfRq+nQ4B60ynneoG8LIhNF2s+mY2vZZbKNXTRPG0hbrf7jhyjK+1mO
 jP9OFjm0MlxLHjIrzr5PGVjRJ8aKff+IOoRsKGw9fx5amyuUfZdRrFbStir6SWoI
 J0gx5U5q1LAjmoeQx6fnS5f7qj2S2xMZeyxZfCSPKDK1w==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazlp17010004.outbound.protection.outlook.com [40.93.67.4])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 441fna0cdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 14:08:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf1JD/kkSMZ7qyICEC0aKpvP9a6lVmgh9hFvw4hg2lGQ3Jc33dOt55VYMBovnAvzniUn7hrTk6g1ZFQBcqZmt3RAZm/OliUAsV2pioLDY2i2B77IvvzUOjaYWg4OwY/XgC7tsQY6306Jr9QiFgIiEPnVnOc/BPQS1v9UvKgIlr1JrvYlNtUEwl+vWMqZ/9NZ8ergayPMa2ugIkzHy5ql/OvPJFeqSfyiRn3EEMrmaG+GNz0m0YE8nRVc7ReI5t7tX1VR8KxXFaABOrUxjQXBnMWMRG3DexOX99KdFFEXMOE55AcPeiG4aq4jkt0l+XXZ8LDJUoR16pJt2H0cXhlWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcwVCuJnaogSXlvcXvJIly26fyTuzDU4mDKY6zHV2xg=;
 b=ZGqZjb5mN3GmS+Pm/BxseMZYlmxFUbNvSWdrPB1a9+2guhkEV63wYFczJJ7xiLibGIYaV9Kq4S0mGDkD+kTRyU0U9iFkQH9woedr83Fe1kcMISlPupyAG8X6WTTHAxLdflnaqI5cDyLpdTFCC6l66wYSxwR9FQchKeM8y7jUbHnu4OZqLGITQ8e8S6weshXytAP+EgDiXK2RU64piAWYAe73apx5MbxegkcAumaiEU9X2hbFl3ddsW19YL59G54/wizHbRGtFaVaW40/dtejzcRJE1osWZwYWQv2sgNKZWjALgFTaHMhAl/JaTK2vkoGxHe5/ksIeYT6/m/1sThxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcwVCuJnaogSXlvcXvJIly26fyTuzDU4mDKY6zHV2xg=;
 b=O45lInPaBYBiSYP065et/kEWgGJaewFxGsS+l8lZ3zEHMgRog2a7UolGOI+3DHDA9++HeTZtuRmGeU8QYPZaZKbhYiz2qP6BnQrCbKUWDr8lETcfLUFpN+mvXlUZyzbxNWFZ5P/hVVf8l5jx8AUcmADdQ/pkg19Oxhwq5ZwiXjE=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOYP265MB1902.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:ec::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.12; Wed, 8 Jan 2025 14:08:38 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 14:08:38 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
 <dakr@redhat.com>
CC: Tvrtko Ursulin <tursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>,
 Frank Binns <Frank.Binns@imgtec.com>
Subject: Re: [RFC 01/14] drm/sched: Delete unused update_job_credits
Thread-Topic: [RFC 01/14] drm/sched: Delete unused update_job_credits
Thread-Index: AQHbWttZVI8TNbAXwkWbn4lK7MOqq7MMmneAgABBE4CAABxegA==
Date: Wed, 8 Jan 2025 14:08:38 +0000
Message-ID: <f1da76a6-8d81-4e32-848a-1837e26ff94e@imgtec.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-2-tursulin@igalia.com> <Z344gwtwvqdXW1N_@pollux>
 <20250108132705.35d8f2a2@collabora.com>
In-Reply-To: <20250108132705.35d8f2a2@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOYP265MB1902:EE_
x-ms-office365-filtering-correlation-id: 97eba9c0-0c5f-4ad8-6100-08dd2fedf2cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjEvd1lIOWxFVDRMeXIwMWo1UE5UM1hkakdMYUVkdlh0RmdKYUwvRW53OFR0?=
 =?utf-8?B?aTU0NG54OXg0Q1RmMk94KzArR0xMZG5GM1psc29HdEhsZk11dFlyVEh6NktQ?=
 =?utf-8?B?aHNjVmJWZE82aWh1RDl3RTZNQUxDT1krT1hJTWxwL0hxMFZIekFRekVNTWhj?=
 =?utf-8?B?YlI1QmR1dGlsbGQrdkJwaXlwM2c4MzlMQUlkUW91Wm9EeEFkTTlVUndmSkJO?=
 =?utf-8?B?MWRKdmhqcVFZOFRCKy9HRWxPUndYb2MzQmF6R08zalMwTUM0Z0dvcDB3Qzhi?=
 =?utf-8?B?SXg1dzFNSXZwa2tBRlA1cDV1U2dhbURCN29uRDN4MjJmUjg5eVhuTzVZejBm?=
 =?utf-8?B?em5RNHEzTzA4K0xFTHV4SW13bzJIWkJVY3F0VnVQU2FqWGxFT2paRDQrZmFG?=
 =?utf-8?B?WXFTYjN1QjJFS3FyRXpZVmJ6OXpLeGN6Q2J3ajB1cmIvZ2t0SDN3RGthOWhB?=
 =?utf-8?B?MFBZdDNnQUkvdGxUUUw1L3BpQXlNend3OU04SGgxR2l2eDBFTHBmVTdvTjA1?=
 =?utf-8?B?SkpPcUZHSmhJT1c2SUtZZGNLbXBqZXlscVhhbG9kanQ1VVFNeWxFRy80d3c2?=
 =?utf-8?B?Z292clhIS2JJT0lIRW9iOC8vVGlNekFCRktqanYwUFh3R0JkSkljTGJQU3lY?=
 =?utf-8?B?Ti9SQkV1YVY0Q2VCVS9CVDM0OElxSEZndHdwZ2VxTmZWYkxOUWtSOWNmN01r?=
 =?utf-8?B?UnV3YjVTZm03Uy9MMHVpdGttWXZBNFBvdDhLbzFsdVBJMUZpb2FHV1BZMjRq?=
 =?utf-8?B?QTY0cHMwS1FVRERMaWxLemgxdzJzRk1DbUxueUR0OTB0d1VFaWRZZ3BUYlIx?=
 =?utf-8?B?MFdjYzBteWJHY3FNQm1xRU5uei9EMU5wUUpFeGdRdXBaUXRjdC9jTTYySGhG?=
 =?utf-8?B?SkNCc2IvTE5qVkNqNkZpajJXalprSmxLSElDMXdIOHdaKzRMWFdRU2R4QUtu?=
 =?utf-8?B?S0E0b0xqS1hxcE9KYTJHSXI0Q2F6VlZZWkxRWTZJYmdMdVliZXA1bGMzVThI?=
 =?utf-8?B?aklzY3BBNksyMWkrSS91T1piY1dPSXZEU0p1RHdwTm5yYmI3QXRyWDh3KzQ0?=
 =?utf-8?B?U0ppT1MyZHNYZ2Fac0J2My9jZ0p1STZuS3o1V040L202UWNLbGJtQ0VPSmc2?=
 =?utf-8?B?Q3UxWkc4dVZkQ3R2N0xNUUVGc2ZjOUxZSDJ0WWlmU3Z4TXd3aGhtNFdSeTZt?=
 =?utf-8?B?WUNrRmVRTTQrQmU2OHpUaWRtZzVScmFzc2FlZkhwZGdSb2ZFVEY1eEpJUlVk?=
 =?utf-8?B?b3JxZUkzcUNXd0NkZDhjSkE3WUJub1QxWlNqL2xHRnV6aTYyTUlCbnNMTldV?=
 =?utf-8?B?dVozNkhOcWdQeUh6bHZUOW5DR0VnQ2pDTFMram40V3dUR205eHZHc21pczk4?=
 =?utf-8?B?MFZrcktBbVRleDlQWElmSm9EZnRWQW0wTlkzVE9Vd1NCYWw5bzF1UnZmUEEx?=
 =?utf-8?B?eXFrMkRhdXJyeUFJcWJXOExRUi9icW5XQkVqemtPZUFENmhkTzNaSnRZZGxP?=
 =?utf-8?B?eWhpdVl6aUJKSk5OTjBTT2RmNFd2STdmN3RJbURra242OUNMdXM4Q1RISmsy?=
 =?utf-8?B?Q29NNHNsVytoUVlZL0lwZWgyL3J0K2VzaWx5OVhyb3NieWtsZDIwT1QrSTRl?=
 =?utf-8?B?Z3piWERTaUhpSUJjeDFnS0RndGJpamphYkhiTnlFOVNqMk5YVFVpWENiN0sy?=
 =?utf-8?B?ejdvM0V6ZXVBaDJOMnFlZGtWTE9RK2Y2NnhvM0xuOGVVODkybHhKNy82Q2FE?=
 =?utf-8?B?bC9kQnd0MFhQY3dRcE9qS2dHanVjTHBINmxnOGRoblRxdmZ1Y0VNaUhVK0pS?=
 =?utf-8?B?QnBGK2VneGw5TExSZVFUb3dvQVBxTHFXWEhjRjBUK05aRFBuNzEzb2VSdXds?=
 =?utf-8?B?RDZacytYY2craUNYbkR0ODhtMWgwV1VPK25tbGtQSnhjN0dRek5XYXpuQmdL?=
 =?utf-8?Q?Stjy/p+x1pWcvN8d8OpTdGepevzB7t5T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SERaVlZVUHQ0LzVXeEN3NUV5Tk5RVTI0QzZwYnlLWVE5VklMUHVydGlJTGdu?=
 =?utf-8?B?bmF4RGpZb0oxVmF3N3lsbzJrSklOWlpRU2VjZEgwQnhEZ3BXQmgvL0pqeDR5?=
 =?utf-8?B?MDE4MlJPZjltZUllbDZxRWRzMWVqbjlqMXFvMGNkR0poT1VHbGhyZ2dmcUZ5?=
 =?utf-8?B?L09oRUpxVFpVZHZnU3pkV2FzeVlJbEZLNTZ1K3FjWHNXeVVKejk4blFFeUxr?=
 =?utf-8?B?ZW1ZNnZGY3M3d1dPcG9kZ2xPa01kS0pZMWpCbTA1bnNkb01yYjEra09jTmRr?=
 =?utf-8?B?NitDdWxvUDFVWWFkRXM5ejFmemZoYVgveXFveE1PeWtKNHlLeUU0M0ZqRVMy?=
 =?utf-8?B?S0hxOXFqSi9IaVJNaEgzZ0ExL2tKVGZpcnVCYzV6ejBDQ1hMcjVpeGc2TVlQ?=
 =?utf-8?B?bEpuQjlBN0JhTUdNRDEvMnlzRWxXdXgwcVF1ajlwbjhreXFaT1lOYWczdHZl?=
 =?utf-8?B?d3VYK0Zab0RhdERObU9wN1MvSzNHV0lMdzc1aG93TFcybzI5dXZnOVFCZFUx?=
 =?utf-8?B?VVZuaXhmV08wK1NjWlliRmt6aGlMNmQ0dzFUQy9xazcxak9zeHVCNUpYSGRT?=
 =?utf-8?B?ODlsbHNTdDY3TXVER01WdXl3SkdUckVmZHZHOUVKTkxadXplNmw0Q0VlM0xL?=
 =?utf-8?B?Mi9qSVB3K2FWdU91bEVSdWJSeExQc0JjaVdKYjd6NHRiVjJBNjBVN0VDRFBv?=
 =?utf-8?B?NFJYZzJEWkV1TnVDOFAyK0xZVS90Vk9uOXY4R0ZnS0duQXhSb2tUc1E0SkJv?=
 =?utf-8?B?WTI5dkdyaTJXTjlnRHBNdldvT1BDZWh4eHhPcXZBYzdxaTJEQmZkcldtWEZ0?=
 =?utf-8?B?d0ZCRXVTUkd6N1MrWDYrUThHM2pRb1piZ2xFUHo5cUJCdi9NTmkzOHdLeTBV?=
 =?utf-8?B?SnJROE5jVjljS04wa1F3ajVrY1ZqK1pBSGJZTFp6bVhrbityYlcwOEQ4NnlS?=
 =?utf-8?B?RmdycDlMbnZtZDBlMnhUZVdnNHRYUndHWk9iaWFPWGQxZUVFaHJFbVUyQk5j?=
 =?utf-8?B?WER6OGdCblRJTGc4c1AxeEdES1lTczltYzNLdElhNXJRakRpNnhpWjllbzd6?=
 =?utf-8?B?d2R2RUNDaWZHaTJzaDJWcUtPUURma29XMEtTNk1mVVJyeGZCbUUvNVp3QnpI?=
 =?utf-8?B?cGJsdzV3dFlVVElaSTZ5ajBwa28yTCtiT0c4d1I1WU9IeUw3UmRXV09YeXBZ?=
 =?utf-8?B?T080a3k1NUl0V29zWVd5TGFjUzlrbkYvcXFVc3hOZERFeE0rdERQcE8zeHNk?=
 =?utf-8?B?cjZmS3RsS1pYSytJbjhlanQ4ZUlMK0xlRkdZZHFnc01KdGZpMDJZTUxkUXZF?=
 =?utf-8?B?K1lWaHRNUXR3aVN2QlhlRklNQWZ3Z1pCdnhTZVNvNFB5S0hIT0w4c0hHN1hF?=
 =?utf-8?B?WWFnSDQ0RWZ3T1llSll5YVF0UWNhSkVJOU9aakxnL1lxb0xDamhMZ1RubjlV?=
 =?utf-8?B?NlJYOHhRTldDMG4xUWd2WkVmbm00MmI4am5aMUJRdEluNzd6TGQ0MXVjRXky?=
 =?utf-8?B?WDFLaGlDYkI4U2luVXBBNDlZb2hTejB1TitkKys3czRJTDYrNi9ZZHB2eTBz?=
 =?utf-8?B?Wk1ZWHp0Mnd3eFUycTVERG5lSWFkU2kwSk5jUTQwVFJpQjgxN0ZCb1J6cTY2?=
 =?utf-8?B?UlczSmRkTmd2Y2l3YStVYXRhbW5xNmpIaXBiTWltRDVoUWpKbE9nZWE0dmFM?=
 =?utf-8?B?UnRYRkQzNkY1QUtXL3NQbWtKeFJPcWN6WmZGY0VBSGh4NHAyck5XNTdNZUht?=
 =?utf-8?B?T0xZdTVrdURoN0dUQjBFQjBiYW5pdWFUZlViMDhHeEQ0bktXNUdGbzdNbGND?=
 =?utf-8?B?UDdvMHpVTEtnZEtHTVJDMGlqZDVRTjNEalEza3BtVEM4bS9JZmpuNkVieHhx?=
 =?utf-8?B?MUdWdVpTU3drZTd4MVM4Q2xxam1aQnRGQUxPTWlzK2lsL2N3dXJLbDF2bGZY?=
 =?utf-8?B?T1IzMlVROEpiNFJ1bGFvdmNqUytINkNmVG4zakZPRHFsSUJvbm41b1crNHN0?=
 =?utf-8?B?dUl4dkRtRWxZS2VpVFRISm9zcHl5c0ZLdHVYVHRuVWt5eCszUUxGaVZlaTBi?=
 =?utf-8?B?UFp1SitwazNtNnIzVjd2NEhEUUhuaUFYN0VSWGs2K215UkFWRHlaZWthWlo1?=
 =?utf-8?B?ck1SWHo2MXBZdHd2bVN3YTlTQjh4OFdjY0J0S2tXVmtIalJKOFBZY3JIR3lp?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sf7EXOznAYZeirTfMXr6Z4VA"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97eba9c0-0c5f-4ad8-6100-08dd2fedf2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 14:08:38.3592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBHQU/SnjG1GV+wYh0vMa3yQO7djjPplKcvi3bu561vij6C42ltdHm1aGzzBQBeNZs0NTb0ymoN9WS56buIqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1902
X-Proofpoint-GUID: SEHbJEqu_xHdh5k-OiIe-PT4YOpXobgi
X-Proofpoint-ORIG-GUID: SEHbJEqu_xHdh5k-OiIe-PT4YOpXobgi
X-Authority-Analysis: v=2.4 cv=QIKSRhLL c=1 sm=1 tr=0 ts=677e86e9 cx=c_pps
 a=LZuDTdsCZsPzRJSF02CLiw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=20KFwNOVAAAA:8 a=V2sgnzSHAAAA:8 a=r_1tXGB3AAAA:8 a=QX4gbG5DAAAA:8
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=QyXUC8HyAAAA:8 a=6lhfo8tWfn56ydPFvjwA:9
 a=QEXdDO2ut3YA:10 a=zgiQbyd4Ybww5LVQFjQA:9 a=FfaGCDsud1wA:10
 a=Z31ocT7rh6aUJxSkT1EX:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=AbAUZ8qAyYyZVLSsDulk:22
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

--------------sf7EXOznAYZeirTfMXr6Z4VA
Content-Type: multipart/mixed; boundary="------------JwDGmXgG1m0plZus4H81m2pP";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Frank Binns <Frank.Binns@imgtec.com>
Message-ID: <f1da76a6-8d81-4e32-848a-1837e26ff94e@imgtec.com>
Subject: Re: [RFC 01/14] drm/sched: Delete unused update_job_credits
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-2-tursulin@igalia.com> <Z344gwtwvqdXW1N_@pollux>
 <20250108132705.35d8f2a2@collabora.com>
In-Reply-To: <20250108132705.35d8f2a2@collabora.com>

--------------JwDGmXgG1m0plZus4H81m2pP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/01/2025 12:27, Boris Brezillon wrote:
> On Wed, 8 Jan 2025 09:34:11 +0100
> Danilo Krummrich <dakr@redhat.com> wrote:
>=20
>> On Mon, Dec 30, 2024 at 04:52:46PM +0000, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> No driver is using the update_job_credits() schduler vfunc
>>> so lets remove it.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> =20
>>
>> (+ Boris)
>>
>> AFAIR the panthor folks asked for this. I assume they never actually e=
nded up
>> using it? Unless they plan to use it,
>=20
> +Frank
>=20
> That was for the PowerVR driver, and it doesn't seem it's been hooked
> up there. I don't think we'll ever need it in panthor, so

Looks good to us, thanks for checking!

Acked-by: Matt Coster <matt.coster@imgtec.com>

--=20
Matt Coster
E: matt.coster@imgtec.com

> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
>=20
>>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>>
>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
>>>  include/drm/gpu_scheduler.h            | 13 -------------
>>>  2 files changed, 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
>>> index 7ce25281c74c..1734c17aeea5 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -64,12 +64,6 @@
>>>   * credit limit, the job won't be executed. Instead, the scheduler w=
ill wait
>>>   * until the credit count has decreased enough to not overflow its c=
redit limit.
>>>   * This implies waiting for previously executed jobs.
>>> - *
>>> - * Optionally, drivers may register a callback (update_job_credits) =
provided by
>>> - * struct drm_sched_backend_ops to update the job's credits dynamica=
lly. The
>>> - * scheduler executes this callback every time the scheduler conside=
rs a job for
>>> - * execution and subsequently checks whether the job fits the schedu=
ler's credit
>>> - * limit.
>>>   */
>>> =20
>>>  #include <linux/wait.h>
>>> @@ -133,13 +127,6 @@ static bool drm_sched_can_queue(struct drm_gpu_s=
cheduler *sched,
>>>  	if (!s_job)
>>>  		return false;
>>> =20
>>> -	if (sched->ops->update_job_credits) {
>>> -		s_job->credits =3D sched->ops->update_job_credits(s_job);
>>> -
>>> -		drm_WARN(sched, !s_job->credits,
>>> -			 "Jobs with zero credits bypass job-flow control.\n");
>>> -	}
>>> -
>>>  	/* If a job exceeds the credit limit, truncate it to the credit lim=
it
>>>  	 * itself to guarantee forward progress.
>>>  	 */
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
>>> index 95e17504e46a..e2e6af8849c6 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -476,19 +476,6 @@ struct drm_sched_backend_ops {
>>>           * and it's time to clean it up.
>>>  	 */
>>>  	void (*free_job)(struct drm_sched_job *sched_job);
>>> -
>>> -	/**
>>> -	 * @update_job_credits: Called when the scheduler is considering th=
is
>>> -	 * job for execution.
>>> -	 *
>>> -	 * This callback returns the number of credits the job would take i=
f
>>> -	 * pushed to the hardware. Drivers may use this to dynamically upda=
te
>>> -	 * the job's credit count. For instance, deduct the number of credi=
ts
>>> -	 * for already signalled native fences.
>>> -	 *
>>> -	 * This callback is optional.
>>> -	 */
>>> -	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>>  };
>>> =20
>>>  /**
>>> --=20
>>> 2.47.1
>>>  =20
>>
>=20

--------------JwDGmXgG1m0plZus4H81m2pP--

--------------sf7EXOznAYZeirTfMXr6Z4VA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ36G5QUDAAAAAAAKCRB5vBnz2d5qsCQa
AQDWMQUx+kIg3ET1PSicPgfrKtLUrUjyK95iTQARllsFRgEA5yRl2WfOlrO0I4Te6hFDRXLnysxl
p4uxjIPp/tFgmw0=
=FBsu
-----END PGP SIGNATURE-----

--------------sf7EXOznAYZeirTfMXr6Z4VA--
