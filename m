Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3490C452
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9018310E5B8;
	Tue, 18 Jun 2024 07:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="g5ZyW7OE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E910E202
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 05:51:07 +0000 (UTC)
Received: from rly09d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) with ESMTP id 45I5ovX7121238;
 Tue, 18 Jun 2024 06:50:57 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) id 45I5oJQd115397;
 Tue, 18 Jun 2024 06:50:19 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2046.outbound.protection.outlook.com [104.47.13.46])
 by rly09d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45I5oHJa115013
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 06:50:19 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVUnbwW32euXsGqEq12vkzubucVK35YQPVuNUUUYeENnXTSYyXiavUxbb+rHd/VghgNFcboc7CiXQ/DNeq9wXXflQNGO9rLDmHRXXXaIR8sm1z1ceVdWRDBeGbIjYjKaFwWMFcQO5mlqodmt4K2ahHhd+Bxsy7wvbEiRuiTkJNyjDQFxf0j5htUQwaE93uncxqLd244dbmjmciJdUw4ZuSy594SHA4yYqYuZRgrCDD276EAt4XAKAwXFmjK7emjJ8LXEqvPmdu3LKtgPPiRdOVe6eGb6yOj/dviJKs/r9/tLUfls3MeZNfc16hGinhidRSBhauFIXl6FcHfSMUjgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09RqLUwZxHiLG+Kqlv4lJqaUbCmHwZ1MhPRKWcrTI6I=;
 b=SnJ5o7esvFs/SCBRJfexqWROudGLNoYlUi7h0uSLpPGhnSl8dbJH+QXLgFm4fkaaJVDNzVQDD1Z7gisEiK0SGy7bytdhfXjPCXoPeq1UK6bxskS2f/B7QLpEtZNxVTqAZ2PVJjezbBb8B1YlVyW+K8O7SPgR+r1HEXlEoBH2T4qx1Gn4m7ZiAzyxxev8Sami9Fy2eiyQw6/1l2SG72MZSU3k5KejT4Bh1sQCsx4aktS1GHxMTRFLa2KQSneX/bzyLk93h7gMrgrxF1USpdyq3g2Yes5E5LHpW8RmGVAn01HNOgS0HLCuk+QSGf3GOe+M5xjOq3DABAvwGOxfR49dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09RqLUwZxHiLG+Kqlv4lJqaUbCmHwZ1MhPRKWcrTI6I=;
 b=g5ZyW7OEm/4+YPuaVYbaGOugo3BlXHxMSXBhoyGRWXlQaDh9DJt6DR1yRC3nI5MQTTm6tkjS8ZQtous4DTtY0RYb1QLHvPXZEdtg84Xud0AqmUbxnKEH5jM3x8Yw+J1fTk21WyTafaHOz57BVfrYdCQLYcWEd3mojBztKSUZQ4lehs1pMD2BKwc4w0cF8HBQCB+e611lQzY1+fWmZJgbEj96B69bcTzSjHB/V5UyPvzA3iXcJTY0zlYKvkskGbC12YXMUcbbD5XPG+fSCvFmZgRHhQyb7QDwgpUNxEP1kMeqEt0xgXTfgDh/tqgbqYrHDpfsb5QMnL6IBttkUoj/Zg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PAXPR02MB7373.eurprd02.prod.outlook.com (2603:10a6:102:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 05:50:15 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 05:50:15 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 04/15] net: hbl_cn: QP state machine
Thread-Topic: [PATCH 04/15] net: hbl_cn: QP state machine
Thread-Index: AQHavWrPJze4juUNfEuFiVLDSv8hgbHL9sCAgAEVMQA=
Date: Tue, 18 Jun 2024 05:50:15 +0000
Message-ID: <a43d2eaf-e295-4ed4-b66a-3f2e96ea088c@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-5-oshpigelman@habana.ai>
 <20240617131807.GE6805@unreal>
In-Reply-To: <20240617131807.GE6805@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PAXPR02MB7373:EE_
x-ms-office365-filtering-correlation-id: f9c7dbd9-af9f-44c8-eb2c-08dc8f5a86cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?MUR6QnBXbzhlNE1CUVlualcxTVJIbkpBTWVHK0NYY2lCN0EzZGZQQVlZZVln?=
 =?utf-8?B?SzlTMURtTTV5NXhKT3VBdXpCdG0yM0tkaUhzRmU1TStGTXFwaXdYRytQWTUv?=
 =?utf-8?B?enJVUW0rSlRCcXJtSUliN085VkJsZTM0ZGd4alYyYnFSa3RMYTF2ajJJNXNJ?=
 =?utf-8?B?N0VxRXNUVDdUMy81RS94N0cxTld4TWFtL3VmeVlmRjJ4S0V3UjhiRjVBcXh3?=
 =?utf-8?B?MGV0NHB2cUkyWUxqbk55VUg3WjZXK0duSVE4ZTdzWS85YWp3U1haMFBYb0F1?=
 =?utf-8?B?cW5DNS9GaFJieHA1RmFGWGorclBDd0haMWtIUHJydlA4cUNZbzZJYTlrc29Z?=
 =?utf-8?B?ZCtsOW9MdEtid2FLQ0RjTVp0Z0loMG5GMGExcEMrZXJJYzc4blN2ekZTcVNy?=
 =?utf-8?B?cTU4cHFoN2R6bGMwY3Z0SHZZeFcxZmFOeHlabmxNUERxOVFQZHNjNHJ5SWhC?=
 =?utf-8?B?Uk90M3N0OWgvN2JzWmhnZHJJVGFBS25tYS9RaFR0Sm5iRytqN3pyRysxM1Fq?=
 =?utf-8?B?NXdEeCtZbmtIMnNKQ01kSXB4dHB0by9YZ3lTS2hXOEp3bWwzb1VVK3lqU0x4?=
 =?utf-8?B?RWlJTy85NndRYmpqT2lZdktTL0pHcFlQSnArd0NCL1h6SVpHMExlS2dlTTAy?=
 =?utf-8?B?UkdHUWhCaU1QT2N4d0tjcXRQczdORVJ0OGhBQ2NWY243V1B1L0c2Q3RoL0xi?=
 =?utf-8?B?bnh6aGsyRWR3a3ZiR2t0Q21Nbkx1aC95dlJ4S0daRW9SWXRuT3V1QnJXSjBR?=
 =?utf-8?B?ZTVuaEF6RVlHM3ZYTk0xclI1d2I5V2tVclo3RldpNHBZZnA1VGZjVVBqUjgy?=
 =?utf-8?B?d3gxT3NqbnNsMnJ3QkpWeVRlcXJ6UzBEMGM0MExvSHlxTWJIL003MU1XNld4?=
 =?utf-8?B?SVo2dy9Udmp4eXlMRUxZUWNxLzVUWFZwVUg0YlpUeDM1M0RNRmhxZ0daUkIz?=
 =?utf-8?B?d1ljTjZycnpRQU91cDkzL3VuUENCRmFMVDQ4VEZtV1RhMGFPU3F6QVFXR1do?=
 =?utf-8?B?NGlmSFVsR1MwYmEyamtMOHE5U1Y1Wk5OREE3TXR6ZUNXdThjZ1BxVjJ1WHcv?=
 =?utf-8?B?UEpTNVp0OEpoVW9qS0lzcUhrSkhQY2h0bklqWTBTRlh1SEZkUHlGZmsxZFhF?=
 =?utf-8?B?MnBSSTFqR0gxdUhEbXRETGxqa2JyUDhyTUR0aER2b1pUV1RFWjI5a21VZ20v?=
 =?utf-8?B?OGxTUyt5SnM0ZmRFTmhiOHdKKy9KMnVZcnFibTQzcUxhYmlqVHJGZ0FkVzU0?=
 =?utf-8?B?VlZINSs1Q3ZhVEQ3d0VJQkZ1L1hJRmc1NGYxRkxJZDUwTko3cFYrb1MrODFS?=
 =?utf-8?B?ODJFNUtGcXNid1Awck5RV0lBRWpTcDRnT2VUZkhiQWFDVGJTOG9DR3JWUUVD?=
 =?utf-8?B?UXlHd1p3ck5XVDI4RmZla3cxN0dEWGlJZDBRaXRMNHc0L2pTTk1RaGdkZ3gr?=
 =?utf-8?B?NlJQMkRjYmhLQkE4ZXZpOGswMG9ERHRINlpMRE1IdVZFVkROU09FQmg2eTc0?=
 =?utf-8?B?OEQyU0hacE9uWlNGNFdudVJwbVp5eDQ1SHJBNTNGakt3cllRODBncTVvWEhQ?=
 =?utf-8?B?OUZPZWszUHBxSG9CUTkvbXY0NHl6Nk5PY0RHSndJd2t0aWlIM1gycUgvTll6?=
 =?utf-8?B?YlFaUTZwdWZTMHduL1pnSGNIM0FvbmcvdzNLV1oxd2E5M1RWeDJqb3FNNzJ3?=
 =?utf-8?B?WjVySUpUUUh6bmQvaWZ4dG9XL2ZJbVRCRWdPRis3SUJmNld3dEFLSzVxVVBv?=
 =?utf-8?B?V09iTDJPZzBLdnEvdFlKL3VvdE1kdGxSd3dxVUIzQTcwb05DM2hyZHRPR09D?=
 =?utf-8?Q?LGgROxnRuSRDb2U1dO8rF3oEDMzdzcccZrqug=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWxKLzF0MHJmOWpZak50U1dWNDBHVWtCV082WmNRaFBzZUwyRm5hRW5oS1Zz?=
 =?utf-8?B?Q0Nwa3JoVWR0YmRBazRVMG1iUk1vellISVhoeVNrZmY1cDBCMTdhSDg5b3BJ?=
 =?utf-8?B?S1FMbEtNWmhlUTB0Z2FEK3lLK3JyVnhOaUFpTWRHZTdYM0ZjRktXUmpBR3l4?=
 =?utf-8?B?dDdzVmM2d2VJUVF1OVBBem9aS09oRHdKdm5iMXNqVXdJUThpMWVBTDlzNXE5?=
 =?utf-8?B?eW50anZjbzNlSjdpbFJNU3JnckhXVWd5OUU1S0RBdjBhdnFjQldwNXl5eDU3?=
 =?utf-8?B?SERhU1VOaFM3TStuWExtV3VJdjRmU1I5QVRyVmZRWnovNmFUWkVaRTZ5aU04?=
 =?utf-8?B?RVEwMC91eUtKZWhiUXBGdXpjck01YzRTaStvVlVXclkwbERjVExTbktRNGFv?=
 =?utf-8?B?TlNlOTBibTFlK0RvK3FuWGU2L0lvaEdieldVZUdJMy95UmpOZ3RBekhNdjVE?=
 =?utf-8?B?QWl5ZFordzNLUXZ5QTIxTThPM0VJU1FhZUM3L2xnaXRVSHBsVXVjbm40eDFO?=
 =?utf-8?B?ZFhuekEyM0o3RnFXT05QbXdnZ2IxT3BJVnNoWCs1a2p1aVVVZTZ6RDFhS1Vh?=
 =?utf-8?B?T0x2ZldQZkZpbTRVQjZrR2hZQlRVdUxQQVF5ajJsQk9wdlh4VklLZzQ3S0NI?=
 =?utf-8?B?K2czZ0ZnVXdycVhGVHd0Q0N3dTNIL3lOZHFyMlJHVFBLTnZPcmtqR0ZGZ3JF?=
 =?utf-8?B?cExNN3c5U3JHUmNwSVp3c08xc3BLUllPRStJalFLckNET3JNb1ZJY2svLytH?=
 =?utf-8?B?ay9zK3dtRjJvVDBqTWFEcGVwekJralN3WEdrbndZVW1aWWcyanMwVDkwMUxa?=
 =?utf-8?B?bDEweHJiUzhMbG9tY0J4a3gwRkphQk9oZ2JVaUFUTm9tQzdXSDJWbEkySVhK?=
 =?utf-8?B?ZFNYdlJnN0VMZytBZWdoY2VhZ2dxeHRQU0JhNHpvYnFlOXZxbHJSSEVnV2Rp?=
 =?utf-8?B?eGkrNFNqVE5tNk44TUFyV3ZiaTZBQlpGR1Y5V1pmbkpwbnVPSDBGOGlnTXQr?=
 =?utf-8?B?Wjc3TnllRERWb296ZDRZWmRscC9Zcjh3RDZuMUhZcjl1K09qQURVZ2Q2dWx0?=
 =?utf-8?B?akUzaEN5OU0rUG10QWNnOGpFMkpYWDRGazJXMkxyN3Q1NnhmdG9iZDUyYWVy?=
 =?utf-8?B?bnFpU1liTjVUeklyYXQwLzhJN1RDZnhYUlF4WVBLb1dPSGRtcmd1RXRQaDh2?=
 =?utf-8?B?eFF3RVhLMng5TjJMbmp1aXJXNnNuelJPSm9kN25EWEk2YVNiZnovUS9LM2Ra?=
 =?utf-8?B?R2hHcmI0VTR1QkFkdnpYODl4RDNFclVqc0xpYjFXYnRtNVVwbUt1NVVReUxo?=
 =?utf-8?B?YWVHcXA1b3FROWI2Rm9WUEZTY1lOT0orOW55NlhheXBZbThYYUJLU0hLZlJw?=
 =?utf-8?B?ZFgxYzNhZ3ZWckhreStQRzBaYmdOcS9IbkJsWWFlcmREbHFyN0dWQVlYQmVF?=
 =?utf-8?B?OEF3YzNtQzluRm80cWF5WGRBR2pETkNDeC9pY1dsWGplNFVBM2JES0syL0pS?=
 =?utf-8?B?cHo1VjVlMEo3emlHSHNWakVtMDBiOGNGbit2WU5TdldWQkpQZTl0Q09iTmpO?=
 =?utf-8?B?dThJRG00d0Ywb3NLVE1ORitYUDE5ckxKY1U0cHN1RVNoM1d3c2xkV3FuYlhj?=
 =?utf-8?B?MFRJQzk1djU4TEZta2Q3SU5GamZpcyttWWdTanpvQlkweUFldTVMTFdvMmdQ?=
 =?utf-8?B?TkhHK1FLNnY3ZlNOalgxUTNCc1FMVWtqTEZtZEdZcEQ5OEU5V0U4THY0UTVl?=
 =?utf-8?B?a2NzNURWMmd4R1MyUmR1NytiYmVENnZuYUowaW5qaHlWVDQ5Z0UxR2lPM2ty?=
 =?utf-8?B?RVhIL1VSK21aSlVudHFvSGtaQ3FleDh3SHpiSWdKSExqZmZ4SFE4RytqSUdv?=
 =?utf-8?B?Vms2bDF1alc0cXpMK2J4TkpjMVRzcm1vbkRXSkF4ZzFmYWpTZlFqMHB3YzVN?=
 =?utf-8?B?dVluYmdUZ1ZKL0ZoUXFHWDR3L3NHcHZWTDZWdTVDZ1p0ZUkvRU1MTFF3dVVN?=
 =?utf-8?B?anlDMEdNcm1RbElDK2tMRVM5QXdwUGlBR0dJVWlmYnF6VDFpMktDd29EMjdN?=
 =?utf-8?B?ZnFKbkhTeFc0UEJSd2E4d0dxY3NGdVVQWEFFc0xRTUJnN1pieVorL3J4a0NM?=
 =?utf-8?Q?64ccWqsnlwpv+SHR/i843uhhC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45E14DA5DD8FB94192B258FADB14844B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2YXZ1Dq9yjKW0ulsIJ38j+uabjaJMUCbfMj2OMu9IGk9V57TY92kqzXf49dTcjEJ7n+UapbtpUSBN07sMRg27+1HMwXKu96iXfKTVjHN54GQbe3sV/etkcLjf/yEOtU2pKcesv1ND4MCTmDH6DWIvkTMgxJshHP2Bsi+u/0yepbhxpo/1aJsVxQJ8UNEs7XvgzZ3qedfLRcxKbxh8HxaMr6g+tgRIDEVSXWwRzEFN1moyLG1EMNx4P9gmkIGFSXfc28m8yW5V+17Z0ue7J636I3tSoJHhzUvRU5MBvj9ENChbqVufdOae6PMZowJwHfsGJfJK0bGPaucxfv90IaW6YXg6YWB2tBQVS7FNMewcmM+Fyg2JYc4z5uguIgVxAwPZraYmtjDPclfmqjzZ187KNsxmyt6lgi0qlUucycqh2vcPZq0cgv31Ti9/lQiDMsmzw+ZSLwAIs/tfZJWYf19mX1HIhMJKPMl4KHXH4t93cxzb4PnRz+ynOppO9CvMdIffdbA8XBP5FOjB/Z296bjZ0KmR1oCeLyKRdJ/gYNieCerimxK1MxW+PRSTWgBoKz+V5C2wcAbhdmZrtSMWfm5FLQKrMDCTi8wjDZ1nnVnT8Mx4GS5yWMYjBt0SQGuJ6SM
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c7dbd9-af9f-44c8-eb2c-08dc8f5a86cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 05:50:15.1151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmMRRLyA0uKX+2eMG4qE81yGQo2zAI1Dj4T+Jj6s+Ns09Vv76X/OTYCBiLqnf1fkJ142fwyrmsTR6JXlZxoiwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7373
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODY4OTg2MDpGUEtleTEucHJpdjrXyK5HK2eEpVHOkbtVfGj3iqKRTB8Tvfe/ImiTe+/nKgeVtV8Yizq/FgFSDlcAeSAwUeHsEi6RimDvx2UMW+oXiYpClfF/6LaOyWYOLxckNpFjadG/6cvJTYtzYOXyCxVtdQEf+QR68p0HmA9k8qPVQf1WHRE92BFvBhg129BCZVThroAPZwmx/bfHFH2RqpPkWHDylXt9tVAbOM2xC39swbDYDAfyslrrNgfrkB/N0G3Iil8VJtXxd+PKp1KasBufGhb4M2s1VY7AxCXNPmiAiEEMn0IXDHNuL5ZX+MwexyOXHMwCnb2jvDkSV7UE7d/tkyH0FZ/k0Ct7HjKQtpIN
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.119
X-Mailman-Approved-At: Tue, 18 Jun 2024 07:29:33 +0000
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

T24gNi8xNy8yNCAxNjoxOCwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBbU29tZSBwZW9wbGUg
d2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBsZW9u
QGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5t
cy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gT24gVGh1LCBKdW4gMTMs
IDIwMjQgYXQgMTE6MjE6NTdBTSArMDMwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4gQWRk
IGEgY29tbW9uIFFQIHN0YXRlIG1hY2hpbmUgd2hpY2ggaGFuZGxlcyB0aGUgbW92aW5nIGZvciBh
IFFQIGZyb20gb25lDQo+PiBzdGF0ZSB0byBhbm90aGVyIGluY2x1ZGluZyBwZXJmb3JtaW5nIG5l
Y2Vzc2FyeSBjaGVja3MsIGRyYWluaW5nDQo+PiBpbi1mbGlnaHQgdHJhbnNhY3Rpb25zLCBpbnZh
bGlkYXRpbmcgY2FjaGVzIGFuZCBlcnJvciByZXBvcnRpbmcuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogT21lciBTaHBpZ2VsbWFuIDxvc2hwaWdlbG1hbkBoYWJhbmEuYWk+DQo+PiBDby1kZXZlbG9w
ZWQtYnk6IEFiaGlsYXNoIEsgViA8a3ZhYmhpbGFzaEBoYWJhbmEuYWk+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBBYmhpbGFzaCBLIFYgPGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4gQ28tZGV2ZWxvcGVk
LWJ5OiBBbmRyZXkgQWdyYW5vdmljaCA8YWFncmFub3ZpY2hAaGFiYW5hLmFpPg0KPj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEFncmFub3ZpY2ggPGFhZ3Jhbm92aWNoQGhhYmFuYS5haT4NCj4+IENv
LWRldmVsb3BlZC1ieTogQmhhcmF0IEphdWhhcmkgPGJqYXVoYXJpQGhhYmFuYS5haT4NCj4+IFNp
Z25lZC1vZmYtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBoYWJhbmEuYWk+DQo+PiBDby1k
ZXZlbG9wZWQtYnk6IERhdmlkIE1lcmlpbiA8ZG1lcmlpbkBoYWJhbmEuYWk+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBNZXJpaW4gPGRtZXJpaW5AaGFiYW5hLmFpPg0KPj4gQ28tZGV2ZWxvcGVk
LWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5haT4NCj4+IFNpZ25lZC1vZmYtYnk6IFNh
Z2l2IE96ZXJpIDxzb3plcmlAaGFiYW5hLmFpPg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBadmlrYSBZ
ZWh1ZGFpIDx6eWVodWRhaUBoYWJhbmEuYWk+DQo+PiBTaWduZWQtb2ZmLWJ5OiBadmlrYSBZZWh1
ZGFpIDx6eWVodWRhaUBoYWJhbmEuYWk+DQo+PiAtLS0NCj4+ICAuLi4vZXRoZXJuZXQvaW50ZWwv
aGJsX2NuL2NvbW1vbi9oYmxfY25fcXAuYyAgfCA0ODAgKysrKysrKysrKysrKysrKystDQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDQ3OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2hibF9jbi9jb21tb24vaGJs
X2NuX3FwLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9oYmxfY24vY29tbW9uL2hibF9j
bl9xcC5jDQo+PiBpbmRleCA5ZGRjMjNiZjgxOTQuLjI2ZWJkZjQ0ODE5MyAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2hibF9jbi9jb21tb24vaGJsX2NuX3FwLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2hibF9jbi9jb21tb24vaGJsX2Nu
X3FwLmMNCj4+IEBAIC02LDggKzYsNDg2IEBADQo+IA0KPiA8Li4uPg0KPiANCj4+ICsvKiBUaGUg
Zm9sbG93aW5nIHRhYmxlIHJlcHJlc2VudHMgdGhlICh2YWxpZCkgb3BlcmF0aW9ucyB0aGF0IGNh
biBiZSBwZXJmb3JtZWQgb24NCj4+ICsgKiBhIFFQIGluIG9yZGVyIHRvIG1vdmUgaXQgZnJvbSBv
bmUgc3RhdGUgdG8gYW5vdGhlcg0KPj4gKyAqIEZvciBleGFtcGxlOiBhIFFQIGluIFJUUiBzdGF0
ZSBjYW4gYmUgbW92ZWQgdG8gUlRTIHN0YXRlIHVzaW5nIHRoZSBDTl9RUF9PUF9SVFJfMlJUUw0K
Pj4gKyAqIG9wZXJhdGlvbi4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgY29uc3QgZW51bSBoYmxfY25f
cXBfc3RhdGVfb3AgcXBfdmFsaWRfc3RhdGVfb3BbQ05fUVBfTlVNX1NUQVRFXVtDTl9RUF9OVU1f
U1RBVEVdID0gew0KPj4gKyAgICAgW0NOX1FQX1NUQVRFX1JFU0VUXSA9IHsNCj4+ICsgICAgICAg
ICAgICAgW0NOX1FQX1NUQVRFX1JFU0VUXSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+PiArICAg
ICAgICAgICAgIFtDTl9RUF9TVEFURV9JTklUXSAgICAgID0gQ05fUVBfT1BfUlNUXzJJTklULA0K
Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfU1FEXSAgICAgICA9IENOX1FQX09QX05PUCwN
Cj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1FQRF0gICAgICAgPSBDTl9RUF9PUF9OT1As
DQo+PiArICAgICB9LA0KPj4gKyAgICAgW0NOX1FQX1NUQVRFX0lOSVRdID0gew0KPj4gKyAgICAg
ICAgICAgICBbQ05fUVBfU1RBVEVfUkVTRVRdICAgICA9IENOX1FQX09QXzJSRVNFVCwNCj4+ICsg
ICAgICAgICAgICAgW0NOX1FQX1NUQVRFX0VSUl0gICAgICAgPSBDTl9RUF9PUF8yRVJSLA0KPj4g
KyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfSU5JVF0gICAgICA9IENOX1FQX09QX05PUCwNCj4+
ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JUUl0gICAgICAgPSBDTl9RUF9PUF9JTklUXzJS
VFIsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUURdICAgICAgID0gQ05fUVBfT1Bf
Tk9QLA0KPj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUVBEXSAgICAgICA9IENOX1FQX09Q
X05PUCwNCj4+ICsgICAgIH0sDQo+PiArICAgICBbQ05fUVBfU1RBVEVfUlRSXSA9IHsNCj4+ICsg
ICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JFU0VUXSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+
PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwN
Cj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JUUl0gICAgICAgPSBDTl9RUF9PUF9SVFJf
MlJUUiwNCj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JUU10gICAgICAgPSBDTl9RUF9P
UF9SVFJfMlJUUywNCj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1NRRF0gICAgICAgPSBD
Tl9RUF9PUF9OT1AsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9RUERdICAgICAgID0g
Q05fUVBfT1BfUlRSXzJRUEQsDQo+PiArICAgICB9LA0KPj4gKyAgICAgW0NOX1FQX1NUQVRFX1JU
U10gPSB7DQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9SRVNFVF0gICAgID0gQ05fUVBf
T1BfMlJFU0VULA0KPj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfRVJSXSAgICAgICA9IENO
X1FQX09QXzJFUlIsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9SVFNdICAgICAgID0g
Q05fUVBfT1BfUlRTXzJSVFMsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUURdICAg
ICAgID0gQ05fUVBfT1BfUlRTXzJTUUQsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9R
UERdICAgICAgID0gQ05fUVBfT1BfUlRTXzJRUEQsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9T
VEFURV9TUUVSUl0gICAgID0gQ05fUVBfT1BfUlRTXzJTUUVSUiwNCj4+ICsgICAgIH0sDQo+PiAr
ICAgICBbQ05fUVBfU1RBVEVfU1FEXSA9IHsNCj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRF
X1JFU0VUXSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9T
VEFURV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+ICsgICAgICAgICAgICAgW0NOX1FQ
X1NUQVRFX1NRRF0gICAgICAgPSBDTl9RUF9PUF9TUURfMlNRRCwNCj4+ICsgICAgICAgICAgICAg
W0NOX1FQX1NUQVRFX1JUU10gICAgICAgPSBDTl9RUF9PUF9TUURfMlJUUywNCj4+ICsgICAgICAg
ICAgICAgW0NOX1FQX1NUQVRFX1FQRF0gICAgICAgPSBDTl9RUF9PUF9TUURfMlFQRCwNCj4+ICsg
ICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1NRRVJSXSAgICAgPSBDTl9RUF9PUF9TUURfMlNRX0VS
UiwNCj4+ICsgICAgIH0sDQo+PiArICAgICBbQ05fUVBfU1RBVEVfUVBEXSA9IHsNCj4+ICsgICAg
ICAgICAgICAgW0NOX1FQX1NUQVRFX1JFU0VUXSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+PiAr
ICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+
ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1NRRF0gICAgICAgPSBDTl9RUF9PUF9OT1AsDQo+
PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9RUERdICAgICAgID0gQ05fUVBfT1BfTk9QLA0K
Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUlRSXSAgICAgICA9IENOX1FQX09QX1FQRF8y
UlRSLA0KPj4gKyAgICAgfSwNCj4+ICsgICAgIFtDTl9RUF9TVEFURV9TUUVSUl0gPSB7DQo+PiAr
ICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9SRVNFVF0gICAgID0gQ05fUVBfT1BfMlJFU0VULA0K
Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfRVJSXSAgICAgICA9IENOX1FQX09QXzJFUlIs
DQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUURdICAgICAgID0gQ05fUVBfT1BfU1Ff
RVJSXzJTUUQsDQo+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUUVSUl0gICAgID0gQ05f
UVBfT1BfTk9QLA0KPj4gKyAgICAgfSwNCj4+ICsgICAgIFtDTl9RUF9TVEFURV9FUlJdID0gew0K
Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUkVTRVRdICAgICA9IENOX1FQX09QXzJSRVNF
VCwNCj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX0VSUl0gICAgICAgPSBDTl9RUF9PUF8y
RVJSLA0KPj4gKyAgICAgfQ0KPj4gK307DQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IElC
VEEgUVAgc3RhdGUgbWFjaGluZSBpcyBkZWNsYXJlZCBpbiBFVEggZHJpdmVyDQo+IGFuZCBub3Qg
aW4gSUIgZHJpdmVyLg0KPiANCg0KSW1wbGVtZW50aW5nIHRoZSBhY3R1YWwgdHJhbnNpdGlvbnMg
YmV0d2VlbiB0aGUgc3RhdGVzIHJlcXVpcmVzIGZ1bGwNCmtub3dsZWRnZSBvZiB0aGUgSFcgZS5n
LiB3aGVuIHRvIGZsdXNoLCBjYWNoZSBpbnZhbGlkYXRpb24sIHRpbWVvdXRzLg0KT3VyIElCIGRy
aXZlciBpcyBhZ25vc3RpYyB0byB0aGUgQVNJQyB0eXBlIGJ5IGRlc2lnbi4gTm90ZSB0aGF0IG1v
cmUgQVNJQw0KZ2VuZXJhdGlvbnMgYXJlIHBsYW5uZWQgdG8gYmUgYWRkZWQgYW5kIHRoZSBJQiBk
cml2ZXIgc2hvdWxkIG5vdCBiZSBhd2FyZQ0Kb2YgdGhlc2UgYWRkaXRpb25hbCBIV3MuDQpIZW5j
ZSB3ZSBpbXBsZW1ldGVkIHRoZSBRUCBzdGF0ZSBtYWNoaW5lIGluIHRoZSBDTiBkcml2ZXIgd2hp
Y2ggaXMgYXdhcmUNCm9mIHRoZSBhY3R1YWwgSFcuDQoNCj4+ICsNCj4gDQo+IDwuLi4+DQo+IA0K
Pj4gKyAgICAgICAgICAgICAvKiBSZWxlYXNlIGxvY2sgd2hpbGUgd2Ugd2FpdCBiZWZvcmUgcmV0
cnkuDQo+PiArICAgICAgICAgICAgICAqIE5vdGUsIHdlIGNhbiBhc3NlcnQgdGhhdCB3ZSBhcmUg
YWxyZWFkeSBsb2NrZWQuDQo+PiArICAgICAgICAgICAgICAqLw0KPj4gKyAgICAgICAgICAgICBw
b3J0X2Z1bmNzLT5jZmdfdW5sb2NrKGNuX3BvcnQpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICBt
c2xlZXAoMjApOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICBwb3J0X2Z1bmNzLT5jZmdfbG9jayhj
bl9wb3J0KTsNCj4gDQo+IGxvY2svdW5sb2NrIHRocm91Z2ggb3BzIHBvaW50ZXIgZG9lc24ndCBs
b29rIGxpa2UgYSBnb29kIGlkZWEuDQo+IA0KDQpNb3JlIEFTSUMgZ2VuZXJhdGlvbnMgd2lsbCBi
ZSBhZGRlZCBvbmNlIHdlIG1lcmdlIHRoZSBjdXJyZW50IEdhdWRpMiBjb2RlLg0KT24gb3RoZXIg
QVNJQ3MgdGhlIGxvY2tpbmcgZ3JhbnVsYXJpdHkgaXMgZGlmZmVyZW50IGJlY2F1c2Ugc29tZSBv
ZiB0aGUgSFcNCnJlc291cmNlcyBhcmUgc2hhcmVkIGJldHdlZW4gZGlmZmVyZW50IGxvZ2ljYWwg
cG9ydHMuDQpIZW5jZSBpdCBpcyB3YXMgbG9naWNhbCBmb3IgdXMgdG8gaW1wbGVtZW50IGl0IHdp
dGggYSBmdW5jdGlvbiBwb2ludGVyIHNvDQplYWNoIEFTSUMgc3BlY2lmaWMgY29kZSBjYW4gaW1w
bGVtbmV0IHRoZSBsb2NraW5nIHByb3Blcmx5Lg0KDQo+IFRoYW5rcw0K
