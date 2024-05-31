Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B118B8D619F
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5458310E156;
	Fri, 31 May 2024 12:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="AFpI+dLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1D610E156
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 12:23:27 +0000 (UTC)
Received: from rly15d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly15d.srv.mailcontrol.com (MailControl) with ESMTP id 44VCNCVK273622;
 Fri, 31 May 2024 13:23:12 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly15d.srv.mailcontrol.com (MailControl) id 44VCMI54255956;
 Fri, 31 May 2024 13:22:18 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by rly15d-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 44VCMGP6255354
 (TLS bits=256 verify=OK); Fri, 31 May 2024 13:22:18 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEUVXE6Po08iBl1LAAO29bBfrZFHDxJveqjCW2a4tZKcTle59cpaR9QH2gEJRwUdGwBDsn8GCarz5oVlRgqN8eEb3eenbOs31vmJaxHJmu+o4QZp02TNABBMR3UuDna2i9C1bcftvQQIESTTE8JKYtwBJO6t2aX/J0ZJmETmplJ4IovoXOQNEWyNQxQo7Da3JSz0hvdsCcYFhsp+TfQK+WCrV6JFRL/xVl8cxPAYjbDAMADleH/6JPJwR3XSyYR1aQqbnYFthXPzn+tbLx3lq3UD13czfBdsth2PGX2TjjO4xTi3kfNVGuwCati1zcxWuyUS3HqJyL6Cv+JprAuLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48e4nmYhVHYKWzGD4MjpbGPmIeaMQypgqOFB3c6VXIE=;
 b=BnHfcDBOQw3nre4m1GGqgBmEBQ6tZltX7pgDwdJWb1rS3kQ9UmLtrxDLm5JSkGxYCf3cNnq7nkjyLA4nWJwAeFhy3fQMtZSuUjqruXxbSaY6SMHSm95DtpJj/QnqAN4uoV5gV2UxorYfDrnfqVmDsc2ZEvx15bKVZgzlyM1U9Ei90fxOjq2T1raqGYV3LyELfkkZehi25oLfz5bVp7r39N1EIGXAhsGePauRtyHjFvo7hxq2XrVDTAZ/SY2+EqaXYWAcs93IdenWCt90jqDj2O+bZaMalpoAMlK42oLpN42HYrahap0djJelmwOTPBfqY4NxQIKdOaKQU1SZihqACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48e4nmYhVHYKWzGD4MjpbGPmIeaMQypgqOFB3c6VXIE=;
 b=AFpI+dLOyWC8XWCTX3nrZMsfVNtniovvXAkjQV4hfKsyb5ugabrZmiNbfHrmlelDhVNek+q5mcBChQldyEAgB96oWALJElu2o5KflOnb5NCno6DUULz1v957pVBccyFpEwHhlZeexknuR+rW7U+ez43bimNYxLuI5BxtYIdAKwkHuYQ5XA8hQgYQr1SCnFmDJLUhEP1B+dwG2lkBrUpEcD6ljPl2GisF4lXctwFEBNSUtkHIWr3NwP2K2eQFsQD01icAGQXt2yOMGkqVGptgp4wo0gwcWlJ7M1LC63Hk366ghJmsbYYlYIGpZRxFwpo6Xh7eLN/W1SF9rZ9qCWGssA==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AS2PR02MB10123.eurprd02.prod.outlook.com (2603:10a6:20b:64f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 12:22:15 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288%7]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 12:22:14 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Thorsten Blum <thorsten.blum@toblux.com>, Oded Gabbay
 <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>, Farah Kassabri
 <fkassabri@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Koby Elbaz <kelbaz@habana.ai>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Thread-Topic: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Thread-Index: AQHas0fWLF66teHlgkiZI7Wgrd1Z3LGxQ8YA
Date: Fri, 31 May 2024 12:22:14 +0000
Message-ID: <324610c0-b9e7-4807-92dd-c887c135ca12@habana.ai>
References: <20240531104622.564778-1-thorsten.blum@toblux.com>
In-Reply-To: <20240531104622.564778-1-thorsten.blum@toblux.com>
Accept-Language: en-IL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AS2PR02MB10123:EE_
x-ms-office365-filtering-correlation-id: a5baa9bc-0d6d-4da9-7f38-08dc816c4e0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?OHFMY3F0U1BaWHU0WVJWcTk5K3lGdjhVMXF3NyszcFhuVFFUcU5LL05WTGFz?=
 =?utf-8?B?QTVCdzZsM0xVRWVvWWpLYURYNmYxaXh5dks1R3Z2dkJtcHg0c3dnenE3Ykww?=
 =?utf-8?B?Z0lrOEVSb0kvRkdlWFBydWhwZjdlOVN3UUdodXdIaVNLdzZxVk9WdG1oWnJo?=
 =?utf-8?B?TVd6eUhMTW5yZFZnbE9pcG5hUXhEejdyTDgvdkxyOHppU3RqVS9tcWZ3QjR4?=
 =?utf-8?B?NXRZdENtUk0yRmNKRkJNQzR0MVRBaEJkd25WTmdSMWpCa2cxNWpodjFUQ3pP?=
 =?utf-8?B?UWkvbnVVdkwyaHhsNlNwNmlaczBzK3pMQXVEYzBJYkJYNUFNMWFsQjZTWkQr?=
 =?utf-8?B?Z3VoNHhYMW9GbnBmSVp4QlNTMkxaaWpaRUpiUzFNTXEyNnc0MmNtR1phVkl0?=
 =?utf-8?B?cm9YbkZ6TERUUnoyUTNuVWMveUNFMnN4VW0wTHVkV25SbnNGcFIyV041UDU5?=
 =?utf-8?B?R1E2SGw0T3NxelZzYUV0TDltdzVDTlB2NExGYTZkY2ZLYTJ5eEl3UE8wNTcy?=
 =?utf-8?B?OEtvZGxOYlVIbkhiYVRIT0dFbmxMNjJhYU8yZytlMFU1OGZFayttamkyTytN?=
 =?utf-8?B?Wi9oWDNtT2JCenU0Ykc4M0VVZUdLQms4OW1NVExEOXlaak5FSkVFanJ3cjYv?=
 =?utf-8?B?UVpLbnFpZExZbGU0MXA0NDRtRWdleE5DNXdXTWRpc3o0MXc0ekNJdGRyN1Q1?=
 =?utf-8?B?dTY2cG9YNXY3L0d2ZFgvd3hqSWFDd0d4SEFKQzFnMk5PSlNDU2h1Q1RyVGRD?=
 =?utf-8?B?SmczME9Fa1U5MWF3NGVRNFh5OVl1T2NDdllybXd2OHBlSlJrYlFmWUpUblVj?=
 =?utf-8?B?a0lMWGVUdHJRMytjOUd2V3IzeUdib1U5YkxvbWp5Vk5qZmZNdElXNXZ6d2pa?=
 =?utf-8?B?cisvcUJDVWVtRDgxbndTaDZ2MXgxWGRuQWRjSFkxSTZSOGR4d2FMdmluSzFh?=
 =?utf-8?B?WHE5cnhtUW9QbWlJWGRZZTVSKzNNWnhnZi9xblBrbGRjVzdVb0NPRzJJcitE?=
 =?utf-8?B?ZHREcWM0Y3hqMWVKbE4vaU5VZmxNSUNMaklFcmxqWnNOeVovUVdEbDQ3Zm16?=
 =?utf-8?B?SzBnWjQ2b3RObHU3MHVhbml3REF0N1ZhaHFZVFVXUUs4VG9FcjMxeUVOT0Ir?=
 =?utf-8?B?bHI4RXpYbUxQeDRPa251ODZLMkZlV2d5R0NYL0xjeDlZeFRZaG1yZ2ZrOHdH?=
 =?utf-8?B?cDVJZm5ZS0FySHdaTGpqMExnQ1BCN1NVa2RIUytSa2pKUW1VTlpvOWwrbG1U?=
 =?utf-8?B?aXZENmVUVFRvVUFPZHVaNXRBbHhnWjNkSFZrcFBNQUFpcktxRXAzdm9yTE55?=
 =?utf-8?B?WWlBcG8vMmQvSXdHbDcwbFVXeWk3QmZsQ2lIa043U0xVKzUwdmlPRmdwVUJL?=
 =?utf-8?B?TFUzQlFZR1BCMlVFYWMvTnptY3pCVHhEMG5KTVBHVmgrOHg5RndDNXJ6OTdQ?=
 =?utf-8?B?ZGFHWVQrdTZIalVoeU12Q3FxM21OVmgybzdNVDlzUjVKb2ptd0VqeHlaMWVH?=
 =?utf-8?B?b2lrYmFmWnBWcUI4djkzMmtwYWZpbldiYnVHLzNjZ0RpdGx0TitQTzM2Y2N6?=
 =?utf-8?B?NzR3SE1IYkFtODhPU2xpWkF6OVZnZlRGeUs5K0VJekcySERUZ3ZyUllRWEZm?=
 =?utf-8?B?S2h0WFh3anI5TTE3dlVZbW5uV1R1UUhVS1lCS2lqOHprVG42TzVqLzQ3bTQx?=
 =?utf-8?B?ei9zeGdVck5Gd2I3ZEFjSm9Xc3NGQmhxSmFjNklzRm1wd1JSdGNoSDZVd3BX?=
 =?utf-8?B?di93czJwQ3VXeEVNTWpENVNVUFJGaXNYN0xKWnRXY291TlozQXZITVZDVUlR?=
 =?utf-8?B?Q0k0bDQrMGlRellZNmFRUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEYyUGx3NU8zdkxnSVAzckwvUUdoamFYWExzSUU5Q3pkb1N2alZWY0ViYkVB?=
 =?utf-8?B?blplM0pURGVvRE9SeWFzYTJOSy9iNjJPbVNjams1VXZqMGZyVVRJaFl2UXFs?=
 =?utf-8?B?Sno3Y3lsb2lEUnk2OGhEOGV3OUkwRTFrQ2dhV3NCZGtpaTlSeGV2dnJLMmEy?=
 =?utf-8?B?cGRFTHltaWlTZitYU1h2SzlwdDBqa0xOWVhKYlp3MnVBZHNlaVo5WFlETnVa?=
 =?utf-8?B?elRMWEVzSHJZYVg1Zk83MU0yMXRyMU0yb1FISTJOL25BODY2WTlXSlhNcm1M?=
 =?utf-8?B?UlVJemxZZHNzT29JZmNIMUR5aXNlOXZPYUV3bzg4ZDhXWTlNOExpeFdlTjFZ?=
 =?utf-8?B?VXgyczVUZGh2UnBvd3dPMC9OTnAxVHp1dzBwb2lka3RoRkM3N3Z0YTZtcnZj?=
 =?utf-8?B?VmdiNUZMWFhxaThrK3dQbXBPTFBDd2sxbWUxaFNLVDY4THlzeXFSdWJjQWl0?=
 =?utf-8?B?ZmxseUxQdTkzdVgxYjVIeG1zZUx2bDFpUjhOZGdOSmo3aERMazlGQVN6cWlG?=
 =?utf-8?B?ZThrUlQ0KzBPdEwxSHgvWmpTVHZHTWErbjRaRXdkNHlaV284SlJBZFZxbnJF?=
 =?utf-8?B?SEVrdzB3bldqdlNPbXBVeDE0QVFlRllzMW1WSmZqT3RQd0RoaGRNNy84cDVz?=
 =?utf-8?B?U0poMHltbXgybjZIS1NoajU4elkraG9vR05ob1FkdXUrYnVHS2pUZno1UVNJ?=
 =?utf-8?B?V2hPZ2pXUHMwVHJKR3RDUHdmemZ3SmNqWkd1aTQwYkorSUc2YktyZnZMQmUz?=
 =?utf-8?B?MGlYaWUxVFhvOXAzM1hPTWdYdUNuV2NQT2R1QjhUOWNjVVVjL1ZXUFVIZG4r?=
 =?utf-8?B?M3BqN0c0a3lMSWkzUVMxalNYcVFRVEJzVks2TGNQd3E3ejZEam9LT08zUkNC?=
 =?utf-8?B?R2gyK3VhRUlhZlZsTUw4ZDE0bVpDRytSeUpqVmtWZ0VrQUp2eFFJVC9OVHo5?=
 =?utf-8?B?cnI3VENsbytmbHFTT2xWMGUxRlVucDlDdTlRZHRpNWJhZXNFaTY1OXBWS1hU?=
 =?utf-8?B?KzNpc2dsUjBuMWlDMVhkNlR4ajcvUmNCTHB4QWpwTXlwcFcyMFhGTmZhdEFZ?=
 =?utf-8?B?Rm44bGtKQnNhNDNVWXdLOWQ5Vm9BSlY1cEVHRVJFTXIySHBhWUtwTFBaRCtL?=
 =?utf-8?B?OUJDcEJ1dE5SdmZnZE5tTWxiWVJ1c3AvTVA5TUEyeC8wT3l2cHY2VmtiQXRp?=
 =?utf-8?B?eHI2STBRRVIzSFREalFoSlpHU01QeXp2bXN2TkwzMnNVOFZlYkMwY1BWMTRs?=
 =?utf-8?B?Tm9MZmIwZEZtOERIZ1dQZGtqRlZ6QUY5R3EveS83TGRRZENadmdwbm5LcFpO?=
 =?utf-8?B?Yi82VmNCNWR6aWpZR2p6ZUN3TlJsbHdhSzdLMlA5QW1oYkJSZFI5amVaN3lT?=
 =?utf-8?B?SGQ2ZU1WVTJVeTZGLzliRFdvbmg1NVhkQTdSU21GVndJcDl1YW44RjBvLzkv?=
 =?utf-8?B?WktmeTBsaFJCRE0zYm11Z205RDFWMzZISlJnRTVLVE5kc2FvNlkxMlkrTXVR?=
 =?utf-8?B?UzNzRzVQN2QxNmtiZ05DdVV3cDFFanQzZFdLRHhJZVNNSExnbG5pdkhFQUFr?=
 =?utf-8?B?TFpUV1gxYmhDbjZHOTBubmYxKzhHQWFTQnpqVVBWTDZHU3BXVTBsK3B4Ulk1?=
 =?utf-8?B?d2JWWW9CTG52RVBnOWtRZ0FJVUc4OXhEbDJib29aRE50TmV0S3RyR01OcW1m?=
 =?utf-8?B?UFd3TGZNTE9hY3c4ZDdiTzNqWElCVjFTemZqNkMwQzF1eWkyUWNlaHl5ZGtL?=
 =?utf-8?B?L3BGd0dTNnJUak0vbjFPdGRoMnF1TzI3LzFteTFrajBjall0NUNaQTgzY0ZI?=
 =?utf-8?B?ZXc5NFpOd1NCNDlIaHpiajFJaThaMWNFOUxLUlcvcHJqczNTcnkwaG9NVlJV?=
 =?utf-8?B?bVlJaUU4S1M3UXo5Q0NRaTNPWG1Ldit6NytrTmpNUVZWUmMrYVVYdUxMMzhi?=
 =?utf-8?B?Y3NSN0o2TWFINUg4S0gwZjRvQk9Rd2hNSW92NUFqKzh6SjEybzhPMzhKTzVT?=
 =?utf-8?B?OW5vK0o0cWxmQmVqTWx5ci9XYmhvT203NFIxaWJHU3hMNXNlTm81eTJpc2di?=
 =?utf-8?B?NjBQOGpNWjRySUQyb2dxOTFxWDdFZ1ZsREoyZ0dtSFUxTmF1OTdIUzh3Mnlo?=
 =?utf-8?Q?JZiQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48B39C4B578A044D9EC8BA3071A055DA@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hqu+vIQ0XD86JnfeWg+aYgg6+z3LoLsmufef+i0N4WAvFnWmZiDXp3am0O72xbB8HZHpKloU4Zpe5h1IMBmlHqp3ajoVX8Nvdc/sVOlt7e8XN+P2BZjOlNbLf+NodbK+OkazhNoTRR9Ctq1hcXAZHja19R6Tjw5Uu6KyzO/8zOWvLVj5ivUYbp0cQjeyTFyCQQZU6CjIkc4Edj2HzMQikNKovsTIEvQW9JLFeUugqEJsCQKB7jOl15ZvgZgvpgvowMkne/CwTMhWAragqLoya2H2AyA5+SNcNhV4BeSlebdnr6Jfv3RLK61jQ3FOYrQksdYR1TWOeGsZ+dXdzRcoztxyBlQZzmHtTPi2B44FTZ/Yk4dYpIVsNm9o/tIe34fCN03ubByDWHniPgn9jmtW5TxUegVdwC7ae7uiruE1aMFeNG83IdxvKI2SC9jl0z726xiJ783/4Nm9t32w89Ch9tA+tYKbwDG2wY3mSWZQPknzKR290eZNqdOyiHkIhRPtRuPGD8gcVTFcKthop3JXGlD2aICzHwnUGDJSQBM0pIHBKbmVjLLZCGQs460dDMsVRFP50EdqCY5IS7W+Lx1fkPqO4u7M1/asLZmbwsCm4cxH9VuD1WA2FhofzZ7/+wgW
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5baa9bc-0d6d-4da9-7f38-08dc816c4e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 12:22:14.5524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5J4r5RxPXayqGvmqNhU3Gz7Jq6e7XjZvFJMr/F0b+DRrBwO85nfghGVIoULlSPFzydgIwjAguxa2SnDtcKxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10123
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxNzE1ODE5MzpGUEtleTEucHJpdjp/oV7l2ofVVE2K1D37pWypGcZZRuroWnb8holqFCpKMbDXhZvy6filsrB41+oeJI5r3E0CInei0/0vqWP0atvbPbz25lEV9MGONgRDiFjMxpehkILFH7xckrK+/k5BLzAUUvo2CgprjKa0Mbogcvnp/kzcKAoW8gm5x7UyrKU9kRMklgWYV/Z1tRGJe/5tIoLOTCGBrsRQ4YBDycRC28omo14osSKGNEVGNKypJWC0cXFfGBb5ZqY6M7Ez+nwKh0tpVFXeSc3SmZM6RPQ9eFQfPnOIpUXfUlJQEyG4ewMtBbdw25P0VaynZ8ak5q84Vn4y/u0GB2ETDkFZjem4OFFH
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.68.1.125
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

T24gMzEvMDUvMjAyNCAxMzo0NiwgVGhvcnN0ZW4gQmx1bSB3cm90ZToNCj4gVXNlIGt2ZnJlZSgp
IHRvIGZpeCB0aGUgZm9sbG93aW5nIENvY2NpbmVsbGUvY29jY2ljaGVjayB3YXJuaW5nIHJlcG9y
dGVkDQo+IGJ5IGtmcmVlX21pc21hdGNoLmNvY2NpOg0KPg0KPiAJV0FSTklORyBrdm1hbGxvYyBp
cyB1c2VkIHRvIGFsbG9jYXRlIHRoaXMgbWVtb3J5IGF0IGxpbmUgMTAzOTgNCj4NCj4gU2lnbmVk
LW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8dGhvcnN0ZW4uYmx1bUB0b2JsdXguY29tPg0KDQpSZXZp
ZXdlZC1ieTogVG9tZXIgVGF5YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNCj4gLS0tDQo+ICAgZHJp
dmVycy9hY2NlbC9oYWJhbmFsYWJzL2dhdWRpMi9nYXVkaTIuYyB8IDIgKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMgYi9kcml2ZXJzL2FjY2Vs
L2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5jDQo+IGluZGV4IGZhMWM0ZmViOWY4OS4uODAyNDA0
Nzk2MmVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dh
dWRpMi5jDQo+ICsrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMN
Cj4gQEAgLTEwNDg5LDcgKzEwNDg5LDcgQEAgc3RhdGljIGludCBnYXVkaTJfbWVtc2V0X2Rldmlj
ZV9tZW1vcnkoc3RydWN0IGhsX2RldmljZSAqaGRldiwgdTY0IGFkZHIsIHU2NCBzaXoNCj4gICAJ
CQkJKHU2NCAqKShsaW5fZG1hX3BrdHNfYXJyKSwgREVCVUdGU19XUklURTY0KTsNCj4gICAJV1JF
RzMyKHNvYl9hZGRyLCAwKTsNCj4gICANCj4gLQlrZnJlZShsaW5fZG1hX3BrdHNfYXJyKTsNCj4g
KwlrdmZyZWUobGluX2RtYV9wa3RzX2Fycik7DQo+ICAgDQo+ICAgCXJldHVybiByYzsNCj4gICB9
DQoNCg0K
