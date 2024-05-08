Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F396F8BFCC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA306113606;
	Wed,  8 May 2024 12:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="BJz9If9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3468 seconds by postgrey-1.36 at gabe;
 Wed, 08 May 2024 12:00:17 UTC
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808CD10FB70;
 Wed,  8 May 2024 12:00:17 +0000 (UTC)
Received: from rly31b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly31b.srv.mailcontrol.com (MailControl) with ESMTP id 448B2Kbm159107;
 Wed, 8 May 2024 12:02:20 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly31b.srv.mailcontrol.com (MailControl) id 448B1l7i151370;
 Wed, 8 May 2024 12:01:47 +0100
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by rly31b-eth0.srv.mailcontrol.com (envelope-sender fkassabri@habana.ai)
 (MIMEDefang) with ESMTP id 448B1khx150957
 (TLS bits=256 verify=OK); Wed, 08 May 2024 12:01:47 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTa5vfuUChzj5zHrNe8CSV8MPMtdjhoV36Kcx4NfkxtnPZ4GE5LwwNp8iI9Yh+arB+t2V7R23zU48AROB+C5r8p0lKTo+drNnzpbelfFfija2DDUYJu8wcXX+Ym3V2+z7R7hi+kiRmIOXEamC6p3ltXLbRokNPBj3EGVoOPzuKTn31t3RCTwe4vnxR7T7OXdPqAOCJqO/zrI2TGcOdkbWIabu3LaiaZEhHBzn7HurZIWh9nTikrS+Uug2NbNIAAZ2apUXkj0CQfHhNhaC5Uy5r8MjUqjWGvwzvoPkTtCmVIEtPCSnUeFDHmajw9r+m8kl5ZojDyixKcpfNfvnsbzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe++fEVhJLIVEQ+ysuU9VwUXCYyNM1hip5UIu2GET/M=;
 b=IxSeh6gzwUmeXIcx04wBIONLrzg1AbuI+Ln+NgvqrY+dETA0Lb9jbEytWyPd28HP1c74jJ1m0lHLpQ/ykWb/M61stQfvsht3EcHwb9c1Lkysl5BbV/NldcHaOTEBC4aJNrhb7MooZtZ4XVA5dtU79190XaE1PsT+WtiBpq7XvCqpUkYDaUzMkNFnOvUdDo4fo3jTzkv/T3fj6lx+3DbAtierFxCIgg0tap1bBntSTYQT95odzETPf/gPc+rjQZXa3q4KmhYOyxcWHxFqCVcq2FjG4vV+I5n9kwQ88Wi2aEar+BhX9OTttGi7TU6hx/0WYy3q928pO7IsbtSlJstqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe++fEVhJLIVEQ+ysuU9VwUXCYyNM1hip5UIu2GET/M=;
 b=BJz9If9stU7VtXb584SO38sbGtFARuQ2E46X/raWIu+Ja+uBP8Of5nw5onVk+/2TdF/HAfGK0U3werpPxpCJDQBxytYwyT7LKUdOtbIYYIlmdPb3oe0A6RU9eXFa66g9CvhTQvpUP0lZgdNMHHa3HPojpkStzTEZhRtp7xJJOXW7fHg802ddXkpOJiqShlo+pWaaNf6vgE4Haxb32twrkN6W/Af9JULUtsiDR0Yj3V0ccJtkIrTzJ8pBnvukYv3Se6NqSOu254QvROSTEWulWDacJkkCAYLOK4D1/VSz1oKitSakwBDvc4bYupRDbDQLywrwsrhy84gtF7zluiBxzA==
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com (2603:10a6:208:fe::20)
 by DU5PR02MB10708.eurprd02.prod.outlook.com (2603:10a6:10:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 11:01:43 +0000
Received: from AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc]) by AM0PR02MB5235.eurprd02.prod.outlook.com
 ([fe80::157b:473:91f9:cacc%6]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 11:01:43 +0000
From: Farah Kassabri <fkassabri@habana.ai>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Ohad
 Sharabi <osharabi@habana.ai>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: print top commit sha after loading the driver
Thread-Topic: [PATCH 1/2] drm: print top commit sha after loading the driver
Thread-Index: AQHali8wPr+ku1Hq30GGLsTxWyBiYLF/HRQAgABLVICADdlygA==
Date: Wed, 8 May 2024 11:01:43 +0000
Message-ID: <6a605dbe-53c9-416b-9bdc-728c3e155256@habana.ai>
References: <20240424100706.269523-1-fkassabri@habana.ai>
 <87bk5s4ekb.fsf@intel.com>
 <45wxpwjv6fqzbnsivojrr2dbspnftinois7um3rrtku5j47le4@lobf5qyr2f2n>
In-Reply-To: <45wxpwjv6fqzbnsivojrr2dbspnftinois7um3rrtku5j47le4@lobf5qyr2f2n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB5235:EE_|DU5PR02MB10708:EE_
x-ms-office365-filtering-correlation-id: fd688b72-33ae-4e94-6d6a-08dc6f4e3f2c
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?N1NQVnFUTFltMUdyWG9JNytyUnZuay9tTnY4am0ycEh2N1hSWE5GQWN6ODJh?=
 =?utf-8?B?dWtZMkVxT1cvc3htaWlwaW1BaUFsOWJkRGVSV21hQWg5Rk1qNUV0TmxwcGJi?=
 =?utf-8?B?T25mMlJ3aFVFZDhuQWZjczVqR1RvNUcvZ0xaRFJ2c0NNdUFJaUxRRVdhalRt?=
 =?utf-8?B?dHBLamltaXB6UjdOSkIxVlFmS0g3R3pLcnIvODUrVlJ4MUxlU2JvbUhKM05V?=
 =?utf-8?B?VHB0ZDF3WWoyTW54MU1YWGJLNUd0RFdiM0JNTE44bElxdWdQRHFrenFzWmhX?=
 =?utf-8?B?SGpsYmQ5eE14QTRlSXhQbWZNMURkaDhMaktCQkczeFdTQkUrUHZtdXMzZVF5?=
 =?utf-8?B?c3Y2RFZBQ2wreWdaMFBUNjhJT2w3Mko2ZGs0Q2VOMGJYTjdvQ1FZYkVkbXBH?=
 =?utf-8?B?L3RpYWg3eXhhSWZXcHk5endqK3RqQmFObTZnRDl1YlArcUdCcGU4OWNUTGFh?=
 =?utf-8?B?dkJFRU04SHlrbk0yR29oanIzdC9XajJ2ekhmNTY3b3ZWeGhTcHFUNGQzUjJp?=
 =?utf-8?B?c1R3c2hyZjB4WVFZM1hUVUk4T1hHVEtJQXhwM1BFZlc2WUs2algwdGJUSlJH?=
 =?utf-8?B?VXVYdVhsS05KQ05NOUVNckxEdjAyUytkZVhhaWtLdVNUcCtNTkJ3Y2ZrNUt0?=
 =?utf-8?B?U2I4MlVaZTlnM3dnbUprcjQyVnBLNE42bVpveUlwNTh4b2lQS3FZODlUL2Mw?=
 =?utf-8?B?QkdLNEpSbkplMGhGakJpbjl0N3hMeGxQNGs1VWFzcENzdm5EWFZJdGpFd1M2?=
 =?utf-8?B?QjgzTjVoR3ZWQm9JQ0prYmdzUk5nL0thZXJXb0hURVVLTW9lblZ4djA5VVJk?=
 =?utf-8?B?YnA4dlBFWGtXS0hYcUtxRlhrT2U4RldrSWg1RGdyUHN2VGt5a1RNL0h2NXJB?=
 =?utf-8?B?MUVZOGt0ZVhYVlNxV1NUMC82N3BiYkx3WnRLWjFmdUNmL3VDdUpCNHlmYnk3?=
 =?utf-8?B?WEJDdzhFYnlaMWhPc2NlbHgwRHIvb2pMOG5SQmNmZ2xaS2MrUU9uWUZNWmI4?=
 =?utf-8?B?SjlzR0E4d3RzZzFtQTJ6dzBMZSt4bkV5ZHh0YVZmanJSSzYyaXl4MG5rNFI2?=
 =?utf-8?B?MTNKWDg1RW9YNXpjREhDOHZvK0N2TllIR1UvdHV3cnRTZS9oVmJOQ0oyNXVo?=
 =?utf-8?B?N0JWUytyeGFLL1pGYVBndlh2Sk4wVEN2b0hwcGNyUEx5Vk56aHB2UkhyVDR2?=
 =?utf-8?B?MXBsbGV4SXdMaUVzLzY0aWZiN2YwUWxXcVVOcm5CRldTakRFK2NSRSsyd0tU?=
 =?utf-8?B?ck05SlVjZzdOeFk0TW95bWU1UE1vdkg3UExCZUNxbDNoR3p4WUg1WjlyWkpL?=
 =?utf-8?B?UjFxSEZpUjB1d0dXMGUrUnVNTHlqM0VJWHRoWFRZMS9HRFBFcklLd0xJVUkx?=
 =?utf-8?B?THBnMFA1aUtxSlR6THZVdUhtZnQ3VE8rVm1oOWVNcnFTY1cyeEc2bGZQQlNE?=
 =?utf-8?B?ZTNTdGR4OWpPNlV3bFpBcmo5R0d3WUkzNm0zY3hJS3UyMWFxMzY2NkhRQTY5?=
 =?utf-8?B?YlFySkR2a0pEWWVia0MzOFlha3NoTG9WTDlWZ0dqd2RVbTVpUjRsTWV0M3Zq?=
 =?utf-8?B?cTc3MU1xT082N3haZmpXVnJuL29scGNBNGFFQXRyVkdYZUxpR0MrVlc0eGJU?=
 =?utf-8?B?SWhiSGdqV1hBRHJvbVVHWXMySGlpOFZlYlU1UnRNUFZVbWJqK0dzY1RpSzhT?=
 =?utf-8?B?SVZka1NRdWNkOEFFVnZ3VXdWZ3o2WUJyTkRVQkREM0lkWUJEMGFoOXlFUDZW?=
 =?utf-8?B?YVNqdjJQZWtjS0tBOStNc2ZiWEhiTklhdmxQbWJkMmU5andKdTVsOFpLTlBn?=
 =?utf-8?B?S04weHgrMEo1ZHNWUThVZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB5235.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlVWSjl1dm9RRUErOTliVityT3cvNmFNTkZYbEZ0OENiUktGSWt5RTV3SHpJ?=
 =?utf-8?B?d2ZHRE1QMytTK0hrc2lld1NDWERiODltVi9nYzFwa2FHT3UrU0x2RlFJWitw?=
 =?utf-8?B?dkt4ellQRWRDNUJmbWJYVnhPTHRTdGJGNjVFbG5EbTcvYlkyWkRvK1hiMXIz?=
 =?utf-8?B?aXBEOGRGbTRLMDNaOUMxL2loT0w0UExrdHBDOSs4dTdZM3Ixc2Z0aDJRc0Fp?=
 =?utf-8?B?VWpncVpBVDFIeVpIK2tHRTd5ZVhTRkFtOFZPRHVkRDY1aU96c1FpOXFoUGx4?=
 =?utf-8?B?UHpTakdwMUNKMDUyMEFTODZaUDdaTHk3akpTR2x4U2FEamRzUjNlNzJ0YUhF?=
 =?utf-8?B?ZDdocXZ5cnVPZUg2bHZnRVArS1NmN2dBUHJoWThjVWtveW9kbHpnRXc3YlB4?=
 =?utf-8?B?Y0FHSmpCZkNobDJSNnBWSFpHbW1PSmFoMHBGWmVoN2RhM2xWSmU5THpDeTd2?=
 =?utf-8?B?VG5nK1lKMUxXbmpvOExZVHVBcTFpV0JCTWVIT1IzVDNlUGxBbW8xZlZid0Nt?=
 =?utf-8?B?dFFySFJHekpMaStpcGFaSVYzbUpxcWdBWGh5TCtaM2F6S0tId2Ivd3VFNUpm?=
 =?utf-8?B?T2RLYkJTcjlkNmRQQ0IrOXdicmJBNit1UXNXTEdqdXc0bG4rREROcGovZUFC?=
 =?utf-8?B?TGRpZldyK1QwNjBiZnVoTSs2RWw1ajIyUVhQeUlVVVNPOVdWdWJUUWZkOFJ0?=
 =?utf-8?B?U0RNRVFwbEhkOEEvVUVKTHFRRXU5MXZpUXBINlc2WWM1MjZ3a2FXQzByVWhL?=
 =?utf-8?B?aGRURHEzR2hRYkxyRi9qRWhVSWxod2grbURZNVpsdm96MjljengyQ0NlWi80?=
 =?utf-8?B?MkVkK3pMNXdZWmErMXhTNlhIL3ZXRXdtaURTZnJJd2QwbnZzbUx6WkF2cDBn?=
 =?utf-8?B?VnhUbkVPQzlOajM5RUwrbEd3aDJkV1I5TTNkVDJpc0NOOExhS0ZINWIwYjZP?=
 =?utf-8?B?Ny9PMVpsc0xnVFplQUZyU1FXdVdjL2Q1dHFDNGhncFh5UW9PV1FwWWhwNmJx?=
 =?utf-8?B?dWdLOXpHY3RIdVVXNm9BM2Z0VVk1UGo2OEwwUWFKVGN0bjdhNTRkWHh4dkVq?=
 =?utf-8?B?ME4rQXRaY3h5S0ExeThDSWtCb24yeTV4YWpSU0NwcVJtUGpPMWFaS0FobHZs?=
 =?utf-8?B?VCtEUVF4ekhkRnZ4ZHZMN2tKNkZ4SFlETVJqdi9iOUk1TmFmWTBGRkNzWEVK?=
 =?utf-8?B?T3ptYUtuQU9abkVHS0VyRVJhVGtrMDBXUjA3Qk83OUlMSGxkZERBRHp5VURT?=
 =?utf-8?B?UER6MVpVcEg0SEk2M0lFbTdxZHlFcnZtRUhTaHBBRzlEb2g0WjdRTVFieTdK?=
 =?utf-8?B?ZkVZbXdiT3huTzRDNDVqRVM2MFlsVU9CejRFdmtoZ2duUlhCV0FFblBXMjVD?=
 =?utf-8?B?YjVsMFd1ODA2Si82NHFJNjFXV05oTXFHSGlvMVIwT3ExRmhIcytPU21wbHRI?=
 =?utf-8?B?MDVkMndrVmpaRHpDR3IwS3BPVXF1SFVJN1Z4Mkk2T05jMkdhMWdncDhQTk4v?=
 =?utf-8?B?dm9NaHpuZ0ZTaFVUSDVxZmNYNGZmdVoyZjhSVUFMcXA3ODd5SlhLMVdsOWY2?=
 =?utf-8?B?K3dUWHBXVFZlTllINXJ6TGo4TndlRDlKQ3RLLy8xVGxWU2hIRDJYVHZTZHYy?=
 =?utf-8?B?dDVaN1Y3T0NyY21uVEkyZ2paT0ZIRmIvR3QwNEFJeTVENGFDTUpBdVJFMEcz?=
 =?utf-8?B?cFZZK3c1UmJrZ3JCdzFTd3dwN3FnSUZCTnlxUndTamREbkJja1FNREVtSDhM?=
 =?utf-8?B?eGlHa2NIbVJjMmRyTjRSSGRxQmw1RVNzcEhSdHBpY1pMdzBRYzhpeHl4citC?=
 =?utf-8?B?SmF3QzJ6eXFEL1N5c3ZHeDBHNnB6d3pzYlZkT0RSVUpEbjYwV2kreFNMWXpQ?=
 =?utf-8?B?NGNiK016UGlPYTZTQnpkcDhPV2pUdTRmUnlHVEFYU1hvUjRIR2tsRUs3YXlt?=
 =?utf-8?B?R1h2MGw1Ym9kVjNCWU5tVHR5amlsL254RFFRSUdEWXcvUXRNdVp0R3VDL2tW?=
 =?utf-8?B?Q0czKzMyS0ptUnNHcStDRTVBLzBGeVBkM2ZuTzBNL0kzUnFsR2NoMFN3ajJ4?=
 =?utf-8?B?R3NvTDRpSFloVGhpQkNaWXQzNTczS3ZSRDZwZVNoZGdrUktoSWdIWmV0bVQ5?=
 =?utf-8?Q?3cabHUxShR3Y9GX5vIy9EO4CJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D31C16CDDBBC584A9C52A1F6480DF8D3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SGtim/k5lZ7F+jkDv3adYTiqg/luIFpoLQSZX1P2MsE0dUd9nNLnUFmaiCZ7CY4+YpEPT1bQYblNXU7uBsD8LI88t9iMihmoc+AYLUIYv/5UA24vbyH7eYyc+u9LKE2C+ugVBytvAnlDylDMb/NWES5XQjxfVQFntygY7qXMtua/6dyRSac6ko0DVDYAfHk1D5A2I1SFNyA5SfZ3qe8uj9z3hS6qznj8jZXPmC3XhWx64zosUU21pdRFt6Y6IK3HqkUIR0RqY2kK27yBQkAltcj1GVMIwj15JFrG8QdDQTlTgkvz3r7yORDzN2ht7Rlnl2UAGydA3xOWkXvSoCjDCmX2yHWxcjGuwkTFbBaMlefk5HeFl2THOjUs0cjiGheU/aQhh65PDY0FS+WzW4wNqmFtQvNEZCu3sHWjx4doAPVOJ/I4ZWuBuGSVjWgaq3yTqGecGPzN+aM+EGZKIFOLWJ4nGqYoI6vL40kJz/PX5NxfwRbFP2+xrGbLZvCHRvfQ17xfZiD2f3PFmLor9UdwgcOIHx0hVdI31X8wcmXgJKOUdVXAt+vkW44xWE2SnZFzTaiFVN0h2Wrx5ufZfnu8MCJ5n6y3RW+gxfwypgyz96wF1/Bc4HPOJ0bb5RR7EemS
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd688b72-33ae-4e94-6d6a-08dc6f4e3f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 11:01:43.7467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEAblao32pVUjG2xpX1/iDQ5bZ4WKOrKIiN9ngm5anyp+3qHLHXmAe3fVZPW+TfLeH8H71moLwz0IRXFet2NBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10708
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNTE2NjE0MDpGUEtleTEucHJpdjpy6FsBNUjMFeSiqkkyxRv0N2g4J9/DXTM9ytOgDIRnEcPKqcSdxpCBw3nyCLLdtxpIsIk5QiD5jlQ7KJuCIEIx7JL0B1CksrQuJ6LokxtbdzlLAhLA5xIoRUUF6pWlqk4gGuP/0ySgQay7XwxO37ebzgKFWT26t0xtkxxwSkyRLUKjnJq6XugFnxlloQ8zR5ZmwN9Bv932xPcG0N5MZScZwOwIpKF3HyKllUrwyd4BO6Yd4meH6HoKC8C2BVTFwFEpWiOLzMg0mKaLMtyednVHhHljIXVLqcW4Slj3hGrVxIuo4bMLhpQ+3RIxzMGUrKdYALXB9l8uCDXGE7459PMx
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.66.1.141
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

T24gNC8yOS8yMDI0IDE4OjMyLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDI5LCAyMDI0IGF0IDAyOjAyOjI4UE0gR01ULCBKYW5pIE5pa3VsYSB3cm90ZToNCj4+IE9uIFdl
ZCwgMjQgQXByIDIwMjQsIEZhcmFoIEthc3NhYnJpIDxma2Fzc2FicmlAaGFiYW5hLmFpPiB3cm90
ZToNCj4+PiBBZGQgdGhlIGxhc3QgZHJpdmVyIHNoYSB0byB0aGUgZXhpc3RpbmcgbG9nIG1lc3Nh
Z2UNCj4+PiB3aGljaCBwcmludHMgdGhlIGRybSBkZXZpY2UgaW5mby4NCj4+DQo+PiBUaGUgY29t
bWl0IG1lc3NhZ2UgZmFpbHMgdG8gYW5zd2VyIHRoZSBtb3N0IGltcG9ydGFudCBxdWVzdGlvbjog
d2h5Pw0KPj4NCj4+IEVzcGVjaWFsbHksIHdoYXQgbWFrZXMgZHJtIGRldmljZXMgc3VjaCBzcGVj
aWFsIHNub3dmbGFrZXMgdGhhdCB0aGV5J2QNCj4+IG5lZWQgdG8gYmUgdGhlIG9ubHkgb25lcyBp
biB0aGUga2VybmVsIHRvIHByaW50IGdpdCBjb21taXQgc2hhMSdzPw0KPiANCj4gDQo+IHRoZSBj
bG9zZXN0IHRvIHdoYXQgd2FzIGFkZGVkIGhlcmUgd291bGQgYmUgc3JjdmVyc2lvbjoNCj4gDQo+
ICDCoMKgwqDCoMKgwqDCoCAkIG1vZGluZm8gYnVpbGQ2NC9kcml2ZXJzL2dwdS9kcm0veGUveGUu
a2/CoCB8IGdyZXAgc3JjdmVyc2lvbg0KPiAgwqDCoMKgwqDCoMKgwqAgc3JjdmVyc2lvbjrCoMKg
wqDCoCAwRUEwOEE0M0FDMzk5QTBEOTQyNzQwDQo+IA0KPiB3aGljaCBtYWtlcyBtb3JlIHNlbnNl
IGFuZCBkb2Vzbid0IGRlcGVuZCBvbiB0aGUgZ2l0IHRyZWUgY2hlY2tvdXQgYW5kDQo+IG90aGVy
IHBvc3NpYmxlIHByb2JsZW1zIHdpdGggZGlydHkgY2hlY2tvdXRzLsKgIElmIHlvdSB3YW50IHRv
IHByaW50IGl0DQo+IG9uIG1vZHVsZSBsb2FkIHRvIGJlIGFibGUgdG8gdGVsbCBmcm9tIGEgbG9n
LCB5b3UgY291bGQgcHJvYmFibHkganVzdA0KPiBhY2Nlc3MgbW9kLT5zcmN2ZXJzaW9uLg0KPiAN
Cj4gYnV0IEknbSBub3Qgc3VyZSB3aGF0IHdlIGFyZSB0cnlpbmcgdG8gYWNjb21wbGlzaCBoZXJl
IGFuZCB0aGUgY29tbWl0DQo+IG1lc3NhZ2UgY2VydGFpbmx5IG1pc3NlZCB0aGF0LiBQbGVhc2Ug
Q2MgZHJpLWRldmVsIG9uIGNoYW5nZXMgb3V0c2lkZSB4ZQ0KPiBhbmQgcHJvdmlkZSB0aGUgbW90
aXZhdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClRoZSBtYWluIHJlYXNvbiB3aHkgd2Ug
bmVlZCB0aGlzIHNoYSwgaXMgYmVjYXVzZSBvdXIgZHJpdmVyIHdpbGwgcnVuIGluIA0KbXVsdGlw
bGUgZW52aXJvbm1lbnRzIGFuZCBzZXR1cHMgKHdoZXRoZXIgaXQncyBmb3IgY2xpZW50cywgb3Vy
IGxhYnMgb3IgDQpkYXRhIGNlbnRlciksIGVhY2ggc2V0dXAgY291bGQgd29yayB3aXRoIGRpZmZl
cmVudCBkcml2ZXIgYnVpbGQgYW5kIGl0J3MgDQp2ZXJ5IGNvbnZlbmllbnQgdG8gc2VlIHdoYXQg
aXMgdGhlIGxhc3Qgc2hhIGluIHRoZSBydW5uaW5nIGRyaXZlcg0KaW4gb3JkZXIgdG8gc2VlIGlm
IHNvbWUgZml4IGlzIGluc2lkZSBvciBub3QgZm9yIGV4YW1wbGUuDQpUaGUgc3JjdmVyc2lvbiBp
cyBub3QgZ29vZCBlbm91Z2ggYXMgaXQncyBkb2Vzbid0IHNlcnZlciB0aGUgcHVycG9zZSBhbmQg
DQppdCdzIG5vdCBpbmNyZW1lbnRpbmcgYXQgdGhlIHNhbWUgcmF0ZSBhcyB0aGUgY29tbWl0cyBz
aGEuDQpOb3RlIHRoYXQgdGhpcyBhcHBseSBub3QgdG8gYWxsIGRybSBkZXZpY2VzIG9ubHkgeGUs
IGFuZCBpdCdzIG9wdGlvbmFsIA0KZm9yIG90aGVyIGRldmljZXMgdG8gc2V0IGl0IG9yIG5vdCwg
YW5kIGluIGNhc2UgaXQncyBub3Qgc2V0IHRoaXMgcGF0Y2ggDQp3aWxsIG5vdCBhZmZlY3QgdGhl
IGV4aXN0aW5nIGRybSBsb2cuDQp5b3UgY2FuIHNlZSB3ZSdyZSBhbHJlYWR5IGRvaW5nIHRoYXQg
Zm9yIGhhYmFuYWxhYnMgZHJpdmVyLg0KSSdsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLCBh
bmQgdGhlIGRyaS1sZXZlbCBhbHJlYXkgaW4gQ0MgaW4gY2FzZSANCnRoZXkgc2VlIGFueSBpc3N1
ZSB3aXRoIHRoaXMgY2hhbmdlLg0KDQpCUiwNCkZhcmFoDQoNCj4gDQo+IHRoYW5rcw0KPiBMdWNh
cyBEZSBNYXJjaGkNCj4gDQo+IA0KPj4NCj4+IEJSLA0KPj4gSmFuaS4NCj4+DQo+Pj4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBGYXJhaCBLYXNzYWJyaSA8Zmthc3NhYnJpQGhhYmFuYS5haT4NCj4+PiAt
LS0NCj4+PiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgfCA2ICsrKy0tLQ0KPj4+IMKgaW5j
bHVkZS9kcm0vZHJtX2Rydi5owqDCoMKgwqAgfCAyICsrDQo+Pj4gwqAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KPj4+
IGluZGV4IDUzNWI2MjRkNGM5ZC4uZTBmN2FmMWI2ZWMzIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5j
DQo+Pj4gQEAgLTk0NywxMCArOTQ3LDEwIEBAIGludCBkcm1fZGV2X3JlZ2lzdGVyKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIA0KPj4+IHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+Pj4gwqDCoMKgwqAg
fQ0KPj4+IMKgwqDCoMKgIGRybV9wYW5pY19yZWdpc3RlcihkZXYpOw0KPj4+DQo+Pj4gLcKgwqDC
oCBEUk1fSU5GTygiSW5pdGlhbGl6ZWQgJXMgJWQuJWQuJWQgJXMgZm9yICVzIG9uIG1pbm9yICVk
XG4iLA0KPj4+ICvCoMKgwqAgRFJNX0lORk8oIkluaXRpYWxpemVkICVzICVkLiVkLiVkJXMgJXMg
Zm9yICVzIG9uIG1pbm9yICVkXG4iLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcml2ZXItPm5h
bWUsIGRyaXZlci0+bWFqb3IsIGRyaXZlci0+bWlub3IsDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqAg
ZHJpdmVyLT5wYXRjaGxldmVsLCBkcml2ZXItPmRhdGUsDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqAg
ZGV2LT5kZXYgPyBkZXZfbmFtZShkZXYtPmRldikgOiAidmlydHVhbCBkZXZpY2UiLA0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgIGRyaXZlci0+cGF0Y2hsZXZlbCwgZHJpdmVyLT5naXRfc2hhID8gZHJp
dmVyLT5naXRfc2hhIDogIiIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgZHJpdmVyLT5kYXRlLCBk
ZXYtPmRldiA/IGRldl9uYW1lKGRldi0+ZGV2KSA6ICJ2aXJ0dWFsIA0KPj4+IGRldmljZSIsDQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldi0+cHJpbWFyeSA/IGRldi0+cHJpbWFyeS0+aW5kZXgg
OiBkZXYtPmFjY2VsLT5pbmRleCk7DQo+Pj4NCj4+PiDCoMKgwqDCoCBnb3RvIG91dF91bmxvY2s7
DQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9kcnYuaA0KPj4+IGluZGV4IDg4NzgyNjBkNzUyOS4uNzU3OGExZjRjZTc0IDEwMDY0NA0KPj4+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cnYuaA0KPj4+IEBAIC00MDcsNiArNDA3LDggQEAgc3RydWN0IGRybV9kcml2ZXIgew0KPj4+IMKg
wqDCoMKgIGludCBtaW5vcjsNCj4+PiDCoMKgwqDCoCAvKiogQHBhdGNobGV2ZWw6IGRyaXZlciBw
YXRjaCBsZXZlbCAqLw0KPj4+IMKgwqDCoMKgIGludCBwYXRjaGxldmVsOw0KPj4+ICvCoMKgwqAg
LyoqIEBnaXRfc2hhOiBkcml2ZXIgbGFzdCBjb21taXQgc2hhICovDQo+Pj4gK8KgwqDCoCBjaGFy
ICpnaXRfc2hhOw0KPj4+IMKgwqDCoMKgIC8qKiBAbmFtZTogZHJpdmVyIG5hbWUgKi8NCj4+PiDC
oMKgwqDCoCBjaGFyICpuYW1lOw0KPj4+IMKgwqDCoMKgIC8qKiBAZGVzYzogZHJpdmVyIGRlc2Ny
aXB0aW9uICovDQo+Pg0KPj4gLS0gDQo+PiBKYW5pIE5pa3VsYSwgSW50ZWwNCg0K
