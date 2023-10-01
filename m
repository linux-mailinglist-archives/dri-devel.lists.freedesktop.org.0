Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AB27B46A3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 11:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A92A10E0D2;
	Sun,  1 Oct 2023 09:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2578 seconds by postgrey-1.36 at gabe;
 Sun, 01 Oct 2023 09:52:57 UTC
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1F610E0D2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 09:52:57 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly04b.srv.mailcontrol.com (MailControl) with ESMTP id 39199mtA083038;
 Sun, 1 Oct 2023 10:09:48 +0100
Received: from rly04b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 39199kW5082908
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:09:48 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly04b.srv.mailcontrol.com (MailControl) id 39198mFx072975;
 Sun, 1 Oct 2023 10:08:48 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2106.outbound.protection.outlook.com [104.47.11.106])
 by rly04b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 39198m9M072911
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:08:48 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z83IuMdRCnaklFo1xCwLY379i0piYAIxOSLPrtDHzHR51qdJD9QMLYz3f6TltHqjFtqYEE5jAQKOSlACTL9WPGVi3yqa0bLVbXXie2D2hbcWCJDBSmc4bVfGDCFtXk0WS80Z0shppkQmP34oE9RfulRQr/kyqt2n2oppS8NMqWq3z/C+VdEQJ6d0m6/JXwkZ7U92a3yFiIC9It3k+KJffuwkHs2xWUbc28IORfuSw2zr3amNxxEpnUch5EKQApj3mG1GVrrwCfrBoS9WYNwT8TXmfXZqyPuAIGOlbhvCScpy+E8KekggM+54JqW8Lm0G15m6cY7l8W/xiSoc/dM51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EyuJYYaEdq0FvUo7eO7zOxXmRoFrSpWbQYYOFWBerQ=;
 b=IyCiHZQ04ZkNzpRdTsKKx560FYMy1kF6e77mj3nZpUlM/SfzJachKNFS5I0enKLqd+QGUbmVhSfFzQBNVOQcXcHiSERKqzgcY8caJ5oQ0BaiZqEuyqyp1oxDWEFn6hLpNL/xM3JdU5ZDZOdQ/ETSPlp4jbGB0PwpowqbcCaxaj+HeX/3kBSCsh59nwqs40m2ADgSnHelA9aXeTkB61V78M8EK0cZm5KKWOPRCSAs0vR8DnVuw6BzIrgIWVM2Escq34bxq3WopIiuXa8AOS0brOmnidB99RT3+qNwX3ep/QBFyXyOeLfRPIH33g4a5ugbsCqHBpH+7zLNUnELmIATZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EyuJYYaEdq0FvUo7eO7zOxXmRoFrSpWbQYYOFWBerQ=;
 b=kYcCRnBHJqlzicztAlJKwN2CdOuk/kcFuUY20PfQwGqqBTzMZkdgHw/RCdnpfivB+TDpmZ/LiCwTI/VEN+CYLMEfiFZLDrfgKEWSL853P5TJalqXVmFJYts2lSjFoeJtV8JsjnLcJfE13k7NOZWvX6G8QF02c73IUrmrBgRGxB+cCFiCqGIAM5qfNVpzHiCBbbIUaf0KxiWyU7Xm1CcF6sr2fSEP2B8JHQESEIxw7EM7wnEmeWizS+Me75PVJPOmLYKzTjZ+W/NouWAjXLHgwNx15v3SvWvkkHiCxiu8JFJp9YKCoxOb/43A7/3VDWgfTmWQdgETJbXIPFo3DfG2sA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM9PR02MB6771.eurprd02.prod.outlook.com (2603:10a6:20b:2c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Sun, 1 Oct
 2023 09:08:46 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6813.027; Sun, 1 Oct 2023
 09:08:46 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] accel/habanalabs: remove unused asic functions
Thread-Topic: [PATCH 1/3] accel/habanalabs: remove unused asic functions
Thread-Index: AQHZ6uVe13tnK3DOfU2I2t2Rzy1OXrA0t/eA
Date: Sun, 1 Oct 2023 09:08:46 +0000
Message-ID: <07b655e5-5f83-ffa3-59c0-4f34ee28e236@habana.ai>
References: <20230919103747.955418-1-ogabbay@kernel.org>
In-Reply-To: <20230919103747.955418-1-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM9PR02MB6771:EE_
x-ms-office365-filtering-correlation-id: 8077380c-b0c3-4cbc-9a1d-08dbc25e0485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GZ4LwGc+AvgV9JmlUmXMZJl4R4alfr2dkbL/yE+ptuYn87aN4Jpba5U8YaHe34Qe2AibChOAHkNgpEakqd6716MH60LOdBf9sYuNJ6Hm+GBSRSR2uMg+PU6di94Q32OTpKuUOtB61obBHLeHzlQXaARIsMfwKc6PyyeaWCsqZ/YKhlhsrRJunHUYvw6gaGkcFzImtoHRusjL13s+/SgYrQ1m/9RyXwO7sxIHAicebhsrIEsrS0pkcnnypH5M+foIol1RbwZxi9uLfe8+7Vq11wMjEuWXVDwkaU8Zds3mPysSH7mDvpF2SZAPpqJ6YIpWAgoP5N5p5d3MDQRZABoO+JFCCrPwL1Db+YyMKLMrQcQnmxw7d3q3YR7KZfoh02r1yyZy94HTtwyufh0fQYilspyZTDMtDzVh9nDFX7WtX1mRPi6Ks79oJcBGKWBLeIjrYbsUAnXbDttdvj8Jmn8cW27eEf+VcuwkfkorxX/KL6US9/4J4nSuFprW2b6Y0W5ylKq6SwoY8NJdSs9WQUG/RxDq+eRANof4NUGXcaBQLCaqBV5volPoMRKn225Aw0PnDo6LN4xQLUMOTG1spmn8spitjidhBN3BIn9DM9SkUj3h5TN/UBk9tU1q1dYiDX8L1+7lSzZWAvzvoOwLngKdYXaCdhR0OuFdMR18sPW3Fffbm7tJRi9XcfPXe/BN/5bT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39850400004)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(26005)(38100700002)(82960400001)(38070700005)(122000001)(31696002)(86362001)(36756003)(83380400001)(316002)(64756008)(8676002)(8936002)(5660300002)(41300700001)(66476007)(66446008)(66556008)(66946007)(91956017)(76116006)(110136005)(2906002)(31686004)(6506007)(53546011)(71200400001)(6512007)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkxnWXp5b3pYTU9MeGplTFRRUVgvS05RTDU5NjJsTjRrSGJPbnpNelZ0bE9W?=
 =?utf-8?B?Z2NNdG1PQ1o1UUwzM2ZpWEl5MjFqVjJJUGVhUjNYSzZSNEp1Q2ZQU3kvNHJ6?=
 =?utf-8?B?SWhUU0E2TUJXVXVqeHdNUStFZ1B6MTNFMldWMVM2dEdLcHU1VVQ3TDMyODdH?=
 =?utf-8?B?Tkxmb0RleXJYQzd0Nnowb1FYakhRU0xaVm91WjNaYTVPOEJNdGhJUTFyTFd1?=
 =?utf-8?B?QmlvTEJCRXc2TEs4R0g2c0wrbTBjMzFraDM1TEEwcnBsbTRqOG5FbGJ3TW1M?=
 =?utf-8?B?aVNNS0dUQzFJN0QwZHJMYWIwc1ByQUtvSjJPdlFvZHBKbFBpd0gxV1R4UHVE?=
 =?utf-8?B?MlVjYVRKMmgwVDlaM2tFRDZLQ1V6bmxhbkpkTFhqRHE0dE1UNEF0VjFPSjlQ?=
 =?utf-8?B?TFdySkVaVi9GNFpIYnRaZjhqbmN1Uk4wcWFEUWkwWnRnUUhaYXJVclBLcVlS?=
 =?utf-8?B?RXZnY1dFZVVWUUpwck1VemNneklZSmF3b1VmWEtjUXR2NS9zV2xQdnBlVHBH?=
 =?utf-8?B?L251NkNTdEpRUmNJT0doNVB5eFhCMEg0MTdqY0szdEwvSkR0by9QSjBVRjJN?=
 =?utf-8?B?UnZEU2pxY3o4aWJCcnE0b0FzQ1RRcXh5LzU5MnhSYlIzUEV3M2w0RkM1b1Fp?=
 =?utf-8?B?aEhLNWgyS3VQSzZxc01UWVN0cmlmeTVXdFY0N2VCYkUzSXdWZmg5b2ZwZEdC?=
 =?utf-8?B?NGdtNmYwdnZtemZyYnYvalB3RWJaYnRhdXJoQTZhcmJ1d0h2ck1LL1pTODll?=
 =?utf-8?B?VDJDTzlEanhyaUZaVTdLREVHVkd2ZjlZSlZNK1BIQUx3K25Sdzh4RUZORjBZ?=
 =?utf-8?B?ZjBud3hjVGgzNzNubHAxcHVHOEhaYjNzd3gwazNXTm1MMHZkVTBxRy9TZ0Uw?=
 =?utf-8?B?WFk5TDZHY3BvbEs1eGVFOHoyYnRXUkZQU2ZDdE1EUzMwNWdpdzZJUzBlMjRS?=
 =?utf-8?B?SUx3LzEyRXhLa1N4alNURWZXMTVsNnZSZmJkWmptNXd3MWpNWSt6RTYzS3ZJ?=
 =?utf-8?B?WFVRWE9IWEFqWnBLdlRIaitaUFJqM2RMQ25vQkZIc09KS09mTnFTSEs3Sm9K?=
 =?utf-8?B?UmMvYkQyY3M5NGtqTjFFM0ZORldELzJ5ankxRSszeldxQWdtR0NkN3lkbkFy?=
 =?utf-8?B?VWhtL0VuTW82NjF5RHUyaGJXdkFtVHU3eVVjaERNOFBjQnF4QXhUaHZrejdm?=
 =?utf-8?B?RytXRmxvVFlqZ3ZQS0VEQ3RNeEVNaGpKTVFOcmFOWVNQRjFnMzVLbE1CdEE3?=
 =?utf-8?B?dURvY2FCZHZUNFJMcDAzTVlJTjZKWDE3SXFRdnd4Q3J2TFJ6UGpQQXVoQnJJ?=
 =?utf-8?B?ZllIUzBDamV4endGRVR4Y1UwZDBITTJSWjNBMGp2amtKdG14Ym5tbTY3eUVR?=
 =?utf-8?B?bDQ2bG5OY1RXRUNSN2ZCVDBPblNxK3hGTE5Tb2ZReHNjYk1FRkNWR3JubHNM?=
 =?utf-8?B?eEU3YkR1SHIzdmVOdFJNWU42M2VhRFRzSk42WCtSb0pFUytwWEZCbW0zVkJN?=
 =?utf-8?B?eE1vRHpVQkZiZEZDWW4xamRDTnRBeXNvRUxINGxxT3hCWFV3WWUvRW1rMEhu?=
 =?utf-8?B?UWUxYklLYjRidTF4QTU1ZnJxR1dIN1JmZXdrQXQrUk1zSGZqS2R0MlgrYlg2?=
 =?utf-8?B?ZkdVWVQvaFdEUGFWWTZ3RklzaXVKTE5SNS9yM0ZSWCtjcXlKSUpUT3pJT3lR?=
 =?utf-8?B?S0dteWptSE5VeGxYWlh4dnl6M2dUQlBhdE8ycUFSa0pyU215UEU2S2RpRW1q?=
 =?utf-8?B?ZUVralJMRmNPb2xpRlZjbkRrUVFsZTdEWWZrTGhxV1Y3eDlXaWxiV2lqMXRw?=
 =?utf-8?B?N1FJRHd5VFNxd1NIYTNTQnNjZ2NUcDEydmROMEV1NVhJUm40YU5qL3NuOUp3?=
 =?utf-8?B?Z1A1S1ovT1ZUVE9Lb0dvaTVVT0oyTDlEVWgxZFNSNU9DeGsyLzBJenkrZ0JL?=
 =?utf-8?B?THhlMmZNQTRWa25jL05qaEJLQ3g0VHdCSzVQZVVOKzV3ZitSYkNaL3huYlpR?=
 =?utf-8?B?NE1KdWpsUklLdnFHUWFGdGdmclZoU1ROQk1BaFRDOFBUaDlkMmZFSUYxVCtX?=
 =?utf-8?B?VWVKZjdjOGdDb05ERThGbGhMY0IyMFlFV2JGMWN4eDcwVWRKZXh3cnprS3Nm?=
 =?utf-8?Q?XlTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B566C4E08A525744BADC7D011EC29D1A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6XImmKRrNI8RFB3Bt8bRgDSYXPMWlkXgRXyZ6jnTY1IikREn12MPPHujOSpHPVMxvbMYOCFZGr0Hj8KARAZ/1DoJreTdU+jLm6RxMeLrRfz0+wPky6lKIDRtDkqiG3fI/QC1kKD47walFrSZwLkovrSBaYHiBIkfeth43BzTR4fS1p54gLFwryV3hC0IhKh5xPxKTO46R7ZiKudDcCJd0TwLm38XcUkCynBgZI2SjXVVj1JuxrNDQrP6YwP+D7nTK08+xY8vkfdxn4nzyEYhe/JMkzujhcY9wkl8/2bM1cyttXzWcYV3ceWLjOant5WjwZkuRDtFXYqOFsVsp1i1uYwvs8FuyX+29mKrzgFgNlFPCE+EdKRK7+Td01wxNPHXj1ezYrmynOSJHJ0ddWyQc6lQnzIQo8KCemEHkxnkiFCu33YSayXYMg49yrpUDjqxit8mXgKT84Bnit/9ZkxpQ/VSi1iBZCtc93lnIIlMMaASyyZYobo5A4vP5rYuLzzXmPWXhm+/+7gIUwpf49q4f5Xa7hA7EnY9BqKHvaIk0aSRCP2t09RfKCd58r/SaHxuR38SGHLFeI+I8VYMmi19skaxHJmgObDMERXgYtCQj8YKJW5Ly/ibek535PsLKj6IAj9XdLC9tSw18NlKbGXTCtL6Z658R/VHh/I8vtgb4nPz0bA89l2JyMD/jZPPhd9OgO73wboHZaMMK6Qzu+ieWw3QLvkqbbU6DT0owTxTUZnbU9T52tnv6Jq71kDYhIXAjdMps1rfEJxKpAxgkKti2aiAS00DQGFH/FCLytY3i+PSalmc7KIEz64szmQeKFfpynnqQdBQTfCUIGb2FxZm6Q==
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8077380c-b0c3-4cbc-9a1d-08dbc25e0485
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:08:46.1223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mzm2J7pkd1KRzr52m9UeKNgnOnS39qnPo79Z/hTrP/HA2VLiQL9fyfP4/X6irHipeBImDMGbkGJBAEAO9jX/1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6771
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NjE1MTM4NzpGUEtleTEucHJpdjpFKHzDQ+GEhrEdf7W7TqzeExTwJyn36rDjZ0ivJDLEd3tgzTUH5emz0B9xb/ZwUotgRvElLn7UWEbh+Mkq789McYPOkwH7OlAcyt7qjJApHo/H7zJd8tkj/ZTOL7MZ4/GKmkrsSDARlryImAiIlVR7HE5PeqX5uSEpomCoIaOxHMAtwPwBsHNKvhKy45+u7OT6WIHb0zC+TB+AV3OdFkrFqCFLGXJiBkd7U7eKL/zwCaNLSKGpcgso6PItvAat+vy2zF5oIyQTPPn03kX5oWkgO2n4S35AId9oVaSJXcMKzvgcudFp8Q59iQeYFsNHhc0xj+F8d65VHe1irq+86ACU
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.11.106
X-Mailcontrol-Refers-To: 39199kW5082908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=3EyuJYYaEdq0FvUo7eO7zOxXmRoFrSpWbQYYOFWBerQ=;
 b=3JXlhD8WlRqRNIWMG5zdkSc3XFeL82L7tSF0hSPDJrupCQF/oRAU91ApfioW4sEgIiQ8lw8miqYSQoV5nlXqLwLrScN6psQiVlQpY7iIni2X9jujcSE6ad4lKtqoqCXRlREANCdb8fVclNhKqQZXVyLAuVGDIo/0tGiglmxSrwjmhSupbJLClMf/gTY6PSJz84oKkD7WT8KgcrXFZwOqHLH4ODMpHEpA/TiXfiWJ6EjLBxH9Z3boRJc56E6OtQOZMbNDhhdn37e7MXYG8ZnQITktwfdNO7bqWPnM6LCKOSA7PGtMpQVGP6/oowgCN5A0+5TR8B5bKXAmFilywgu1Yg==
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

T24gMTkvMDkvMjAyMyAxMzozNywgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IGFzaWNfZG1hX3t1bn1t
YXBfc2luZ2xlKCkgYXNpYy1zcGVjaWZpYyBmdW5jdGlvbnMgYXJlIG5vIGxvbmdlciBjYWxsZWQN
Cj4gZnJvbSB0aGUgY29tbW9uIGNvZGUsIHNvIGRlbGV0ZSB0aGVzZSBmdW5jdGlvbnMuDQo+IA0K
PiBJbiBhZGRpdGlvbiwgZGVsZXRlIHRoZSBnYXVkaTIgaW1wbGVtZW50YXRpb24gYXMgdGhleSBh
cmUgYWxzbyBub3QNCj4gY2FsbGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2RlZCBHYWJiYXkg
PG9nYWJiYXlAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJz
L2NvbW1vbi9oYWJhbmFsYWJzLmggfCAgOCAtLS0tLS0tLQ0KPiAgIGRyaXZlcnMvYWNjZWwvaGFi
YW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMgICAgIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vaGFiYW5hbGFicy5oIGIvZHJpdmVycy9hY2Nl
bC9oYWJhbmFsYWJzL2NvbW1vbi9oYWJhbmFsYWJzLmgNCj4gaW5kZXggM2MyMjQ5NDJhNzU4Li40
ZjY2N2FjNDYzMDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21t
b24vaGFiYW5hbGFicy5oDQo+ICsrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24v
aGFiYW5hbGFicy5oDQo+IEBAIC0xNTIwLDggKzE1MjAsNiBAQCBzdHJ1Y3QgZW5naW5lc19kYXRh
IHsNCj4gICAgKiBAYXNpY19kbWFfcG9vbF9mcmVlOiBmcmVlIHNtYWxsIERNQSBhbGxvY2F0aW9u
IGZyb20gcG9vbC4NCj4gICAgKiBAY3B1X2FjY2Vzc2libGVfZG1hX3Bvb2xfYWxsb2M6IGFsbG9j
YXRlIENQVSBQUSBwYWNrZXQgZnJvbSBETUEgcG9vbC4NCj4gICAgKiBAY3B1X2FjY2Vzc2libGVf
ZG1hX3Bvb2xfZnJlZTogZnJlZSBDUFUgUFEgcGFja2V0IGZyb20gRE1BIHBvb2wuDQo+IC0gKiBA
YXNpY19kbWFfdW5tYXBfc2luZ2xlOiB1bm1hcCBhIHNpbmdsZSBETUEgYnVmZmVyDQo+IC0gKiBA
YXNpY19kbWFfbWFwX3NpbmdsZTogbWFwIGEgc2luZ2xlIGJ1ZmZlciB0byBhIERNQQ0KPiAgICAq
IEBobF9kbWFfdW5tYXBfc2d0YWJsZTogRE1BIHVubWFwIHNjYXR0ZXItZ2F0aGVyIHRhYmxlLg0K
PiAgICAqIEBjc19wYXJzZXI6IHBhcnNlIENvbW1hbmQgU3VibWlzc2lvbi4NCj4gICAgKiBAYXNp
Y19kbWFfbWFwX3NndGFibGU6IERNQSBtYXAgc2NhdHRlci1nYXRoZXIgdGFibGUuDQo+IEBAIC0x
NjQ1LDEyICsxNjQzLDYgQEAgc3RydWN0IGhsX2FzaWNfZnVuY3Mgew0KPiAgIAkJCQlzaXplX3Qg
c2l6ZSwgZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSk7DQo+ICAgCXZvaWQgKCpjcHVfYWNjZXNzaWJs
ZV9kbWFfcG9vbF9mcmVlKShzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LA0KPiAgIAkJCQlzaXplX3Qg
c2l6ZSwgdm9pZCAqdmFkZHIpOw0KPiAtCXZvaWQgKCphc2ljX2RtYV91bm1hcF9zaW5nbGUpKHN0
cnVjdCBobF9kZXZpY2UgKmhkZXYsDQo+IC0JCQkJZG1hX2FkZHJfdCBkbWFfYWRkciwgaW50IGxl
biwNCj4gLQkJCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIpOw0KPiAtCWRtYV9hZGRyX3Qg
KCphc2ljX2RtYV9tYXBfc2luZ2xlKShzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LA0KPiAtCQkJCXZv
aWQgKmFkZHIsIGludCBsZW4sDQo+IC0JCQkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKTsN
Cj4gICAJdm9pZCAoKmhsX2RtYV91bm1hcF9zZ3RhYmxlKShzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2
LA0KPiAgIAkJCQlzdHJ1Y3Qgc2dfdGFibGUgKnNndCwNCj4gICAJCQkJZW51bSBkbWFfZGF0YV9k
aXJlY3Rpb24gZGlyKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9n
YXVkaTIvZ2F1ZGkyLmMgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5j
DQo+IGluZGV4IDM1ZGIwMmU1MDEwYi4uYmU0YTc0NWY4NTQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMi5jDQo+ICsrKyBiL2RyaXZlcnMvYWNj
ZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyLmMNCj4gQEAgLTY3MzEsMjQgKzY3MzEsNiBAQCBz
dGF0aWMgdm9pZCBnYXVkaTJfY3B1X2FjY2Vzc2libGVfZG1hX3Bvb2xfZnJlZShzdHJ1Y3QgaGxf
ZGV2aWNlICpoZGV2LCBzaXplX3Qgcw0KPiAgIAlobF9md19jcHVfYWNjZXNzaWJsZV9kbWFfcG9v
bF9mcmVlKGhkZXYsIHNpemUsIHZhZGRyKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgZG1hX2Fk
ZHJfdCBnYXVkaTJfZG1hX21hcF9zaW5nbGUoc3RydWN0IGhsX2RldmljZSAqaGRldiwgdm9pZCAq
YWRkciwgaW50IGxlbiwNCj4gLQkJCQkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQ0KPiAt
ew0KPiAtCWRtYV9hZGRyX3QgZG1hX2FkZHI7DQo+IC0NCj4gLQlkbWFfYWRkciA9IGRtYV9tYXBf
c2luZ2xlKCZoZGV2LT5wZGV2LT5kZXYsIGFkZHIsIGxlbiwgZGlyKTsNCj4gLQlpZiAodW5saWtl
bHkoZG1hX21hcHBpbmdfZXJyb3IoJmhkZXYtPnBkZXYtPmRldiwgZG1hX2FkZHIpKSkNCj4gLQkJ
cmV0dXJuIDA7DQo+IC0NCj4gLQlyZXR1cm4gZG1hX2FkZHI7DQo+IC19DQo+IC0NCj4gLXN0YXRp
YyB2b2lkIGdhdWRpMl9kbWFfdW5tYXBfc2luZ2xlKHN0cnVjdCBobF9kZXZpY2UgKmhkZXYsIGRt
YV9hZGRyX3QgYWRkciwgaW50IGxlbiwNCj4gLQkJCQkJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24g
ZGlyKQ0KPiAtew0KPiAtCWRtYV91bm1hcF9zaW5nbGUoJmhkZXYtPnBkZXYtPmRldiwgYWRkciwg
bGVuLCBkaXIpOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIGludCBnYXVkaTJfdmFsaWRhdGVfY2Jf
YWRkcmVzcyhzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LCBzdHJ1Y3QgaGxfY3NfcGFyc2VyICpwYXJz
ZXIpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXNpY19maXhlZF9wcm9wZXJ0aWVzICphc2ljX3Byb3Ag
PSAmaGRldi0+YXNpY19wcm9wOw0KPiBAQCAtMTE1MTUsOCArMTE0OTcsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGhsX2FzaWNfZnVuY3MgZ2F1ZGkyX2Z1bmNzID0gew0KPiAgIAkuYXNpY19kbWFf
cG9vbF9mcmVlID0gZ2F1ZGkyX2RtYV9wb29sX2ZyZWUsDQo+ICAgCS5jcHVfYWNjZXNzaWJsZV9k
bWFfcG9vbF9hbGxvYyA9IGdhdWRpMl9jcHVfYWNjZXNzaWJsZV9kbWFfcG9vbF9hbGxvYywNCj4g
ICAJLmNwdV9hY2Nlc3NpYmxlX2RtYV9wb29sX2ZyZWUgPSBnYXVkaTJfY3B1X2FjY2Vzc2libGVf
ZG1hX3Bvb2xfZnJlZSwNCj4gLQkuYXNpY19kbWFfdW5tYXBfc2luZ2xlID0gZ2F1ZGkyX2RtYV91
bm1hcF9zaW5nbGUsDQo+IC0JLmFzaWNfZG1hX21hcF9zaW5nbGUgPSBnYXVkaTJfZG1hX21hcF9z
aW5nbGUsDQo+ICAgCS5obF9kbWFfdW5tYXBfc2d0YWJsZSA9IGhsX2RtYV91bm1hcF9zZ3RhYmxl
LA0KPiAgIAkuY3NfcGFyc2VyID0gZ2F1ZGkyX2NzX3BhcnNlciwNCj4gICAJLmFzaWNfZG1hX21h
cF9zZ3RhYmxlID0gaGxfZG1hX21hcF9zZ3RhYmxlLA0KDQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0
b24gPG9iaXR0b25AaGFiYW5hLmFpPg0K
