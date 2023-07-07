Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102774B24E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93E10E59B;
	Fri,  7 Jul 2023 13:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1938 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jul 2023 13:57:28 UTC
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7140D10E59B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 13:57:28 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3678VHca019371; Fri, 7 Jul 2023 06:25:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=NHhX1rf0gLbcPmMbuOzeP+6cerwEUDcnqnlTteldTAg=;
 b=pwe1hRYvhUzthYqV0dtAKPCExrv9rlAv9+a2v0fyaWQddlettMgkjM5BnJYnJG61JbZ9
 cfHpmSneLJhURvKoUagccU13BA5MbEDV3aJpTHjOe36/HyehpfjRxBvkwNQIiTjbXGps
 GKN2B0RC1lYQGGj7wAPDub3FDc74eegxm3XEK3AxVCT4GxJpFSBSeALBpDMtzW/NOsqR
 UKKpkwqMfzzqqeJlbDGT6XlhjRJfbegMuNuNafRTLTVPYOGPri3Opl7DLjh1873CS+hB
 pMV0zsKInAxUfshCBk4xFbMn4D/k8mLM2gHyvfyhiL6EwumqTxZ08cijbT9bJvGY87BL og== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rjjse3bxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 06:25:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1688736306; bh=NHQBET++DR02clCs7udFbo6PplKW0xdyFx424uX2i4Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=OAMwNL98BTeV3KYDa+KUsgAMO4aalQcEtP0HAtUN/fw5Quv/pZhT5ORIhzDP+Cf+H
 oLKt/QRj/eD+bgiZPBAWrTtp+l2pMEHAd7MkAaddetlAAYLLT+X1EGUi98GF5AkOTC
 NQChtSSgTB7LNOVaHslrBAWoDnS2LUCOqXlGchncsS3MTCAPYKBIkyV15PZcK8eiz2
 vQSz4XsFIpD8O3VahfvGpiOreST4TR8qLgJl55EO/LsSvB5q0Ez9+oXBxxxBrHYw9m
 xZUz1xHvlCREfEBPo8bknIqkPN8j42HHVjUNFX5Jv8+Id/agvN+dQ7/hhxqSv8Qc2W
 uccrgZdsLhV7w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D43A640408;
 Fri,  7 Jul 2023 13:25:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7712DA02B8;
 Fri,  7 Jul 2023 13:25:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=D8xTz9iL; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B3DDF40640;
 Fri,  7 Jul 2023 13:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moSF7yKVh/v58HxX0PyRbxzT5ZUJK0C8z3YMDXSzDNNluJWdYcjHJvjVmfWgq3Y+fp8F14rB0TNep2EF5iYlUxUG/P6K+nQH9sgHVmFlES+sFSPYevtcbKqJbhzvRkv+ooJDcJJjkr663Djrk9WEhpCyDI85OdOhjLVMUsGG4OgaGmyWTZWr2CdrWZjn73K9vCNd4ep7KUmIApPIjlVsXoqslfG5UqNp/9uzag3aq/3j6BCQN318WA3GNe2sJJvqMHfoRAURKP+VlQOB042Cx7UB8Aoi2TsSQufGUz4rFzjbIs7ToRpO/GSCPVgjiVObtzVS2Un/uWkxEn3feBtxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHhX1rf0gLbcPmMbuOzeP+6cerwEUDcnqnlTteldTAg=;
 b=I2Pe6FQyATOUwDGKamKWvKJgl/1dmPXMUTC7iUbXoOvOxDMdYj9pO5r+UtghXaDqzPOPkalPn0OGu9NINgtjPYyJjQDlpfcsVXML9SKpEgYjWcFR8eN0ipNLzYnGILRpb1bV+n5IfJYYnK1Wo0X81G/KFRRpzfeIgulHx60W3QzvWWEsx0anJoUjgoL7ADytoMHTCKtmYKSxd+9LtOAdbH3KKf8a/9sC5sgCk8lnSh9E2bUe6TIVZXONFJcwKJIX1PAiqGDS3D0s5TmmUSej+Q8TA7Q2l3b9puNsEZqbCQT6Bs/EFR6Xdir8I7AWUhHvmi8/cqppdi88RAo8I0zzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHhX1rf0gLbcPmMbuOzeP+6cerwEUDcnqnlTteldTAg=;
 b=D8xTz9iL2u7GPUHEyBvNdWHL36gW58Bxz+Lxw2YGQXTEEBezizPRAdOX3kawqs2ZA3QiJz3N/yIqcJVnk5LunpXyepFGkCI9JSMcPJLHEjWJKWU7kf6yBM7OFI++qreZgCvbQhQbumu6cfT7COSL6sfxKkQxdelL3QXEDLq1BFU=
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24; Fri, 7 Jul 2023 13:25:00 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::fbeb:9151:c36e:92cf]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::fbeb:9151:c36e:92cf%6]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 13:24:59 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 17/18] drm/arcpgu: Convert to
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH 17/18] drm/arcpgu: Convert to
 devm_platform_ioremap_resource()
Thread-Index: AQHZsKOzyL8hyObJekyqbo39+sWVwq+uSwb9
Date: Fri, 7 Jul 2023 13:24:58 +0000
Message-ID: <DS7PR12MB90414173AA812CA294A4B1A7A12DA@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
 <20230707072034.48977-17-frank.li@vivo.com>
In-Reply-To: <20230707072034.48977-17-frank.li@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|SJ0PR12MB6904:EE_
x-ms-office365-filtering-correlation-id: 25f6f417-a874-4ac7-69a6-08db7eed8fa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Os8QJWt4mYjZIH67nLtYwzOSJVRrGwWlgRcmV83N6tEBe1wJYT6MEW7t3sudhsTWE6ZklloerNKWL/TQn2aFauhB6IxL7MPsCTGSk2xJ2ci6YizcNtHcNGPaZq25iNU1Ih06jit5YKYRw6THEYu8xRm3oiVSyw8+t316CdnwsuXNmtgHH6acacATKcS9Ab2XXcy+PjMD2Z/Kht+i6ww8fjH/2JhnZfF3Br+VJL62YdrI1exGSrqVDlDwQu0xYXEguhV5kImkmzLJLG7wzQzWmdC5J3GtNAbg3U0AWlCH2FUt6TtIEWaqVtnZN4yGy/JWo8MMl+mnPLP2OJIbkqZAqWDlQzGLgkCdesTmqsrK9wYLMWoKVoimLaGEL+jEkQp5UPU69uTsojnpwPXgKs1KRVan8IGbJsSqg23OL4Whcb2eW4/Hhl2O7n5WQzUpXXSZ+MfKefc+KlxZ2Y+J8mIhfsWjrokqzA4slIE33oXPaY53ECC3+p1EWLmNKrlYMvUSfZkaseP2D600QW00PxWkyRuPs1/PTPRQ964Lm8jItfuiNv0ji47LKHLKWxQksX+muqmx9Ac6219BLIwo+SKgdTX8oa9G+YM/F3Wk5E2VVek=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(66476007)(66446008)(91956017)(52536014)(64756008)(66556008)(4326008)(6916009)(5660300002)(66946007)(41300700001)(38100700002)(76116006)(316002)(8936002)(8676002)(86362001)(33656002)(55016003)(2906002)(38070700005)(186003)(7696005)(83380400001)(71200400001)(26005)(6506007)(9686003)(122000001)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?piAfKsC0UAoQN7EEg1F7hB20gzKJbPiEDCCvnW+XlaFF2K+N0lXHLfBsjq?=
 =?iso-8859-1?Q?ZzPLJcHfn4Ee2CK3rRrAyate2ffASljK/3FlOVsZIUOZ+e3lnwidYNvzzt?=
 =?iso-8859-1?Q?TUmjnpfJO3tudA6eOg8WXOuSi7xvPttEsqybCp/tMwP2o6jDoKKi9u+qUb?=
 =?iso-8859-1?Q?rRLRxCmyUIXJKbIqfcj8n6EoGlRZdI0CM868Hsaji8BsTn81mJaSBhhEL1?=
 =?iso-8859-1?Q?mOtc3dFJT7B3uezPVvVa3Iv99eWcX1G0z1zvtmlES/zrYPXF9BjL04/bW/?=
 =?iso-8859-1?Q?UCwg5k7dLwEmDXz/KsvWIPeYadi8pX7BIejOLNJQhYUeXyo1/HpQMUjc1X?=
 =?iso-8859-1?Q?Itse2pEYaXDUbrGkUvmDm+WuOr2oS3aLWhXHVd/KKn0B21Y+yKffO99hUh?=
 =?iso-8859-1?Q?NbHE1k8IeeD+OUnl7kVFlFNbIZ8J7Zq6MFbjsRs/tR883WeyZ58227IQMa?=
 =?iso-8859-1?Q?lc/vtfZ9Gn/1ky9MBy9V5wIn/nSNo0yT6qLiUemL6fNOwkx4xIOlk5TxP3?=
 =?iso-8859-1?Q?BIDS1tH3o6sfo1SYc48zzEdEz90fp6JXeZyUfy2NuG2hg0GTCN/g6HF6CH?=
 =?iso-8859-1?Q?f90UlhMr3ZKdLLsmkxzydiWHozXWYCddtywXgvQ3/+ItC07gh7jP6XovfN?=
 =?iso-8859-1?Q?o0gZTmCNOUUNaeMsOhJFQ4KFNF8CEpb/POlu1Jf9Sii23fHDx0mmm3jF97?=
 =?iso-8859-1?Q?aEDqe7BzJkQyQOzarZmKHbRl9HczJEWWRz/efYcj1LqgbOLk6iGisCVrSX?=
 =?iso-8859-1?Q?N0SehS+pQE3cUrRxdIprqyihG5Sn1NBr/fvN0O8aN+s5qQjwzDN31KmESo?=
 =?iso-8859-1?Q?DcYXpjD0hvBPwWDBEva8s7Gb5cZH4z7MKLHEFmKK2EgFymKRla6oCd9y8f?=
 =?iso-8859-1?Q?Lvjj6exb93b4gQ/b10qs0Q9b13zND7m/DOBSNxrb8/2PpgbX8Z0gSEr+d6?=
 =?iso-8859-1?Q?0X+hT+Ugr4J78uYZqSDd2bQ4EcjTZxm/8dXaUlVOUWpzxmE18o6vuuRiFC?=
 =?iso-8859-1?Q?QzNMzV1QVBOOR4XeWYApTI4cmg3AHJhrgz9uwhNsyu2wOVmohmkIEViLo1?=
 =?iso-8859-1?Q?vONugQRXlRNzsAW/9ccUebfU4g09h9LUcwsy2S3I+0XrXxpZtwSR1WoH/n?=
 =?iso-8859-1?Q?imTMlh9776wVTrmblt768cSQOqVP8zKzvduRzYFklSGADukhokKZZodhoW?=
 =?iso-8859-1?Q?HnOptOdHlBfWduo0PSjaArkdLESagT6XitdHF06+kFLarerS/n1EepEE8p?=
 =?iso-8859-1?Q?9GjLuco1XClhalkzTpD0Q8i0NdyVmCzrrmkQqVYtogV9QOqNTdpTgcvLrk?=
 =?iso-8859-1?Q?c6wbkZVZR5vHIp6bP3NBEYP04JvxS7gnDX383v3d7ZaUm0v730roZhVrep?=
 =?iso-8859-1?Q?ndoPyqTeHe4Q5P7cJkaU4F7iU80OhzDjZzIOhu+zqwrGKYXrVG6v1dEfAv?=
 =?iso-8859-1?Q?cwwzOns9/Prjl8IqSxMvWImMrEHFD+i/PODc4AeUAdaP/5YSjNDXuko82C?=
 =?iso-8859-1?Q?hsqwDxTBwiI9e7JV9f4yrUD51h8TbZ9dZkSCy330NrpObu38OpP36c9NFz?=
 =?iso-8859-1?Q?c2HtLVuM9130b98xsz6XANcMEffbu7W9GtPmKnLtpGpgqfdx/aTitE6UCj?=
 =?iso-8859-1?Q?5UV8zJLlmhGkFSmZoiv6HRx3nf4Axu4g70?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-8859-1?Q?VXIeOVfoIc9XzyWQ66cfLvZIU5WA6uUyUFpY6DVY2c6EIlW8WJRCzcncwk?=
 =?iso-8859-1?Q?Ti3sN3IJTwPxcQt72LzgzL9Cng3Hhc0CsgN48m6Qvv2stOeVN2Ug0odeu1?=
 =?iso-8859-1?Q?yMVPAodI3nl22LnMQPsNAQttrzl+M4mlELITFylnajoLsJTiNwFibQhIpX?=
 =?iso-8859-1?Q?KUmezGZpuDWMbI/QwB2trGULSNi7UlZb5tqxzAK8YfOd67FXJZu08xyrMV?=
 =?iso-8859-1?Q?B00h+2nnnvGwaFMm5b5N3YNEaDuHYSXHggio79F53OzwLZACZ3HFQmv3pX?=
 =?iso-8859-1?Q?UUd3JLygnoNHHj3ZURYmGve1HaeFcPMxAvdgN7ZgLjoUSeHxTC+NF9RrP8?=
 =?iso-8859-1?Q?HxmpAaEa8Q/FmItD76zg9+BI4skvyp+cTFRl2DQ8L4Mmqt4b0yRcSxOdj6?=
 =?iso-8859-1?Q?Zirak8dmCa+lb+cMZ94Yrzc6HHHqazEGVZzAWIRk0fYVJmZ6WmUHeRNYyb?=
 =?iso-8859-1?Q?NGml7aUzAmx9+TymsWfbQbVBrJFEq5fJE7NJpEj/xU8Yz/AdlDOnrouxH7?=
 =?iso-8859-1?Q?aXY8/dZizdkhi+t8lN//mjcmQkazdNwGI0YqaFeTg7uQJA2HDNMyhNQ6io?=
 =?iso-8859-1?Q?wQB6tEyzHpJ/sBCD6Aeo6b2QdXp+9Ukgln7twz1SEeNrlj8rgljqIXcmIj?=
 =?iso-8859-1?Q?OsfM63kkFwOSDD4AvX/PGT6foUkpHOF9CXkf5RDJaX90r8a4v722P8O1bF?=
 =?iso-8859-1?Q?3kYHhZEnCTkwVUvHf7BJ3KMDLC1yH3ZhlAdzZaNDRfwYaVxg72t80NjeOF?=
 =?iso-8859-1?Q?xYnTwjhSrQyEfYw6IPcMmkDs8FOhcYeOl7AlLuXxJOjOdL315DVFhM2c54?=
 =?iso-8859-1?Q?1J/GlGZNS21am1f/BHKGfnebBWoVYooDeTI5I4GJMPNERYOTH9jGHcLLoc?=
 =?iso-8859-1?Q?qby7Orc5efnNHFiGc9ly6u1nNPwq2eWrMBcK70IzG8wmMY4bfbpBHreqGj?=
 =?iso-8859-1?Q?ZDVAhDhKgNiX6uIlF7cABItTfb/CiRRd?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f6f417-a874-4ac7-69a6-08db7eed8fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 13:24:58.5015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RrEalqQa0fmWS77RK+bujJ+NqJlsg3+lRpLlhK9GWwofYO7aduqCDB14cA7yHHDCGvSCm4ufQYKBENiSDoegg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
X-Proofpoint-ORIG-GUID: 1r7rWGqSMJz3v19FXuOF4Pa-A3HE01RY
X-Proofpoint-GUID: 1r7rWGqSMJz3v19FXuOF4Pa-A3HE01RY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307070124
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yangtao,=0A=
=0A=
> Use devm_platform_ioremap_resource() to simplify code.=0A=
> =0A=
> Signed-off-by: Yangtao Li <frank.li@vivo.com>=0A=
=0A=
Thanks for the improvement.=0A=
=0A=
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>=0A=
=0A=
> ---=0A=
>  drivers/gpu/drm/tiny/arcpgu.c | 4 +---=0A=
>  1 file changed, 1 insertion(+), 3 deletions(-)=0A=
> =0A=
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.=
c=0A=
> index e5b10e41554a..3a5e66d909a4 100644=0A=
> --- a/drivers/gpu/drm/tiny/arcpgu.c=0A=
> +++ b/drivers/gpu/drm/tiny/arcpgu.c=0A=
> @@ -251,7 +251,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arc=
pgu)=0A=
>          struct device_node *encoder_node =3D NULL, *endpoint_node =3D NU=
LL;=0A=
>          struct drm_connector *connector =3D NULL;=0A=
>          struct drm_device *drm =3D &arcpgu->drm;=0A=
> -       struct resource *res;=0A=
>          int ret;=0A=
>  =0A=
>          arcpgu->clk =3D devm_clk_get(drm->dev, "pxlclk");=0A=
> @@ -268,8 +267,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arc=
pgu)=0A=
>          drm->mode_config.max_height =3D 1080;=0A=
>          drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;=0A=
>  =0A=
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A=
> -       arcpgu->regs =3D devm_ioremap_resource(&pdev->dev, res);=0A=
> +       arcpgu->regs =3D devm_platform_ioremap_resource(pdev, 0);=0A=
>          if (IS_ERR(arcpgu->regs))=0A=
>                  return PTR_ERR(arcpgu->regs);=0A=
>  =0A=
> --=0A=
> 2.39.0=
