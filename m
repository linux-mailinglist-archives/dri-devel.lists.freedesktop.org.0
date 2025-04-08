Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE142A812BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279FC10E297;
	Tue,  8 Apr 2025 16:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PtiCc1PJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4027910E289;
 Tue,  8 Apr 2025 16:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8yEzohj7tHUTuX2mCjerbSEAS0/IelwhqH0l3iWNW+sPsWRmUo7JChl7HP7mY+JcgLl+LdBYl34EC1jeJeMdxdJD1RQIRxhq/QGh4qe1A1Yddztb3hbV8CeSbHYlFvOxy+ntaW0xCCtGEziwPFIgA+XVCPhBfP7QC16p7ROkkwC67QjDXVb6kobHyHUtQN8itwNdAUf84wahagg/3rDPyQ/rJ5dGlEzk7Khk6T/gTHLYa5uoc4begNTTgmGwZ3WalmW76bOsb1O99Z32rwL32t3NsYY8NOKlCtzRlUTAtyL/lxqt+107zHbf0+u8HphsXpr54TaA2V652Ukn90oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUI5XU5pvLXcekqd0YJ4as8i9wLhV71zut+l2xUUunU=;
 b=jmLZNKwP6n3myOeObx4H5hVgM6+GdBQ3gvb4/aPQXS5RFigHCPA5q9cEubnHkmlTMifJwnE2DDDpzs0OsUH5LK500tUPxuufaspC6IkFg6eRivhBh6Kk6iQqnJU6k7m0or9YCNLxm7LdEGCAyWmoXWKVy/5ek7kzLYsBF15rl5A5serHUiKwQvuoPm6HyKTocnU1lIs9uYOZHTvTf6fF5/p4eFrIeA1FK4mPxETXFDFUC5HHxCg0l+ddYL9UygTvxIqebQksXMblnOJQeT1PxY5aaKXbePsDm4WPvyc3K97cJCrLYYy5It+VX9if/acwp2apwArItrGjlK3RgpUczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUI5XU5pvLXcekqd0YJ4as8i9wLhV71zut+l2xUUunU=;
 b=PtiCc1PJmHtt5WeGgQx+jTHe7e2S/ebA5PZilRyAAalkqxhL34bsDtDjniOdKv1pPqnqepEmYYRT7+djUUVk/Q7U/aSa091iW8y0Xm3QlpsCGVFdlGixuWSOa0tvTCMEnekXBPZ4BMl8jZpZWZuIDERYT68hBvR/kihMdeb6iF7b+nGfqKocbBN1mlVeRVpQmvNdjm242pWAHopkhQWPnMu72+pBYRVVmxOVZ/de9ylkklOv4nDXDA0ZCm+awTuj3zmWuH87dhhfcZcBBT4jgequhcZokogHZAlNh71Qs6ZKCl3nIYFV5sAwQE8TbTNfQCqw1u9V8ydDd07X6PezuA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Tue, 8 Apr
 2025 16:46:27 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 16:46:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWAgAACUACAAAJUAIAADx4AgAAC2ICAAATUAIABTLUAgAAGEwCAAAJYAIAAA4KAgAABEwA=
Date: Tue, 8 Apr 2025 16:46:27 +0000
Message-ID: <42b856605c340547d5e27df99db57f7b6e61e6a8.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
 <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
 <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
 <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
 <5B682A0A-C81D-47F4-A0A2-BA81A6281413@infradead.org>
 <c5bf5cf5a6d0d9020c6f7f0adb1b68c6d9598c23.camel@nvidia.com>
 <a5f5cf79aa72c18c6921192b3a8355d14bd5659e.camel@infradead.org>
 <a469b8f67ec6291e261eca0ff4c0f5fe697731b6.camel@nvidia.com>
 <22fbb2813a38c5848b457b7f08a3058a1a0ebb3e.camel@infradead.org>
In-Reply-To: <22fbb2813a38c5848b457b7f08a3058a1a0ebb3e.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB7503:EE_
x-ms-office365-filtering-correlation-id: 19e36543-0c45-4422-6757-08dd76bce7e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ckc4TFNPclRyN1VocHJjWEJIVDFqdTA2SVVqSGtwZHVLWkIrNWt0bk4xZU1R?=
 =?utf-8?B?VGhzQWN5KzFVb1ZncCsyaE44N2x1TEdFWFhvOE5CMytLZDVWZHpLa0gyR0Z2?=
 =?utf-8?B?N0FORHh4U09vWXprK0M4R0VzQzhabDQzSEpBVDg3Sks1ZFY1Z2hBYXNxMEFC?=
 =?utf-8?B?NGcybkljTjNuS0U5ZThBSzE5cm03dXNsTEpUR0pGaEhXYVJadmUzNGFVeGMv?=
 =?utf-8?B?U0c3MzdoZVptaUpxV0hDOXA4QUJiWTBiQURLdzl5d0VMZTBIMUViYjY0aDNu?=
 =?utf-8?B?d05tR3QvTFRzV09jTm1GU2c4dkVTZklWVU56VTF3ZTdWV1BrZHg4aDI1Mmgr?=
 =?utf-8?B?ZHNRWkZmbDRNMWlqbnhHNzR0WDZIN2xud0JIVlZFRSsxQ3hSZ2l3TmYxTy9r?=
 =?utf-8?B?bUhpbTMrbFFkMTJzRmFncEtZY21SdEU4b3UreU0zMUZOZURTc2VSdldVWm9W?=
 =?utf-8?B?NGRtMmtuZ21DbWxWMzNTZWpIeDFFUDMzMVZ4c1JlVUpKYk9mL3ROZGdkSWFh?=
 =?utf-8?B?QlFVY0tIeG1zUFdmcnFNam1XbSs2Y2ZFTU9mZVhJWjlLMHo0K3MwbHU1aXF1?=
 =?utf-8?B?KzU5dFlFVkl5OGF2NWp6cEhaVjVrZWtwQkw3ZldINmFQZm5OT095ejlkaC9a?=
 =?utf-8?B?TnBSNlB1ODJPMEd3YWZYZVVoWVV0bzg1TXQxNStwL012YU5nMjU1bEVTSGM1?=
 =?utf-8?B?Tzc4b3pwWXppSHI3ZFBOYkNiS3dyeTg4RHBPWEtTelNtMithemRDcDA2VHhY?=
 =?utf-8?B?V1B6TGJhNU9wWFEvcllEWnlITzFIdnQwdGlsNFdkWEh6cGhQT0FMRGJsbEpv?=
 =?utf-8?B?UEd0OTZzK2ZlZXZqS3hSUFNGRkxvbGFqQ1NMTi9yK3FTOW8vTG5yNGUvMTZE?=
 =?utf-8?B?Y2RLSnZzSkNQK1Q0Q3RWdlUxUHNQeDVWb1IrS3lNTGZ6NUd3SWYxVmd5a1ZW?=
 =?utf-8?B?SUpNcHN0RzgvRHdDaCtxbERncTRiSE9nMlprWUNHN2tQQ1FQbzcyQk9NbUFV?=
 =?utf-8?B?NldXZnFoM29sM3dhVUx2V2ZCazJ0REFKUVJvR2pNM2trZnBUakVnOUQzNUNG?=
 =?utf-8?B?eVRHUEIySTg2UTFuUjREOFJ4UU91MzM0Qmk0K0dpTkhRU1ZzOXRJaXV0T3VM?=
 =?utf-8?B?VWRHeW1aRGpzK0FCSnJXbmhzQU83elJmOWlWcUlzNGFvRTEwQXczbWpUaVRl?=
 =?utf-8?B?T2YrMDhaalkwRXlzN09ad1lqTVh1UG8yLy9tL3RPcTllU3Z1K1F3dGx5WkFh?=
 =?utf-8?B?elR1cGV3MHc4WjVEd0d5SjdGbUtvNXVydzVHRkVZMTdHTGVjd0hkcmcrODFL?=
 =?utf-8?B?WmJPa0ZFekRRemFRM0NMU2hBRzRwN0ZKRXdrMFZ3VmRUU2NDWEZLWldQdlR6?=
 =?utf-8?B?TWliMndONHF6WjMxU0FxSmZUUG9NWEthSC9neWM1aVpuRFhHWktwVEpQbWtE?=
 =?utf-8?B?OUpHbFJZWGpaaUFIanFsck9WTU43dEdxLzdZemJHOG1Mb1hneUc4ZmQ3bXRw?=
 =?utf-8?B?RHNLZjU4Q0Ywc083OEZsTmFHN1ROTDZvRjFGU0trelpxb0t4aEZsUFdmRWdB?=
 =?utf-8?B?VStadVIyaXpoRHdnT2tjeW5lQTIxVWlVcXUwRHBnUStaZWJ3dkVaRGlRN21D?=
 =?utf-8?B?aGE1d0ZCeVo4ampLdjRtYzBETCt6NmgzZ3pSbHE0RVV6b1J6bUE1OGxPWjA1?=
 =?utf-8?B?dytBTCs1cFBQZ0RUblhXTUhzWlZEVyt5ZDBDNGM2eGJYN3crcWYyWThoM0RL?=
 =?utf-8?B?UHc1OHNRa1dlRS9MMFk1WVZLVFhBSmJJOTBQazQ5YXVLQ2IyWEhJd2V6VzBr?=
 =?utf-8?B?d2pXd0VjVzBGMGFibFUrOFZDVFY0ckM1ZjNjR2NTKzdHNEQrRUdtQWJ5UE5E?=
 =?utf-8?B?cGlCaXh0V1Zaa09aYmZYVCttMTRkZytRaUpjME83cFJVczNNZWhscUJMMDY4?=
 =?utf-8?B?LzcySEYvTnU2emFSdkJDSmw3ZWRITHl4eVNQU0FyUEVVa0ZwRmt1ODJVOXZR?=
 =?utf-8?Q?QNjNrbSNyVYyq0nQz0yubeKPFxzlsk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWpEQ1RsWGMwL2h3aTJKbjZWN3Zna0JBZWNSL2xMQ3o3bFJCRnloVGpMckpN?=
 =?utf-8?B?OEI4bjBBQytBTGdrbmNzVlRVOVprMzU2dkNodUJzNzBIc1dYeUVtZHdwYVhS?=
 =?utf-8?B?V2h6QllQN0NrNUpHRnk1bzJtRld4dG5EY0tyMTl4MGRodmJQbXRGbDMvN1Fr?=
 =?utf-8?B?MFZ6ZXdxUDBYRkxZazhBMGpSZU16RnQzNFdPVy9iQW5waGxJYmFxaHVQb2Mv?=
 =?utf-8?B?SkkrNzRtbjdZUlRVQmQ4OHpSTWduSWdmaDExWENxZVRvdEVLdWZjY0dHMlhy?=
 =?utf-8?B?STlKWUdUbXk1UlFTYlovYmhuMThGUUx6WkhQdmFETzIrMlZiSVVvdkI1bDlw?=
 =?utf-8?B?ZVhXaFJVVmoxM00xaS85RWZ4SXdyaWhxVlRvem5iVlllSExzSFJ5ZjJuVU1m?=
 =?utf-8?B?bmtYamxJdWtka0VNMDBoTk5NSnpNZTVINTVPRmUyV2V4VlF4K3JYMGZxVTdD?=
 =?utf-8?B?ZjdjTEswcDFSQ05sMndJKy9pZmdyTU5NNW1pOXNNTno3MS9kdHY4eXF0WVlB?=
 =?utf-8?B?R0x1UjJJZUxpclp5RlJmaS9YSFJabTFvWUt3UUZndytqQngzQkF4MkNlUWNv?=
 =?utf-8?B?LzVFYUpzVmhmUlJzQmZZZWZzY214UnR0VlkrbUc0TlRhTmI3NmQ5azdPVG9J?=
 =?utf-8?B?UEZXeWxPQnVMbUtRMHdBN2NuSDIzWE5WQmNvRUZ6VnVyaXBnMDFGQlVqd0pr?=
 =?utf-8?B?MTk3a0M4YTNwdERRellLYkptZ1EwcVBIekxhR09TTTZTZ1EzS2cyWDhFT2x2?=
 =?utf-8?B?RHJDVTlYeklod3duVXRpSzVPNHFCMEgrZmh3Z2Y5VXRpbWRXS1BIem9HK1pj?=
 =?utf-8?B?b2xZQWd5R3pWNTU1bktIalN0b1RLK25jdEFyODh0MjNUdyt0RDY4aWVaQU1z?=
 =?utf-8?B?djNhYnNhelhITGxsU2NIa3FQVVR4bDBucjBaSDlXNU1haFgrUXpsbkw4d2lv?=
 =?utf-8?B?Y09TTUtiejBpMmlZbGNSQnFIN2xEZVFGY3R5WEx1R3Y0RlpQU3Y0c0tyT0Rq?=
 =?utf-8?B?blh2V0hoU2FucEh2UWRuZ3ZwRkJ6OGFoTHE1cXF0S0VVSlNkYzNDMTFPMTVy?=
 =?utf-8?B?ckpJTlZlWEd2U3pvUWU2dkpSQUErZTNVMDYxaElDV2wrbVNUV0E0Nkt0Nnl3?=
 =?utf-8?B?RE5oWGJZVk9qWUtUak52YThjRE9MQXNCSERYMzhrbUxGLy85aW5iY3R0YnQ0?=
 =?utf-8?B?RDFXWVRvaTBKajJmK2FpQzUxWmZkUzNVTDFnd3VmMCtDMzJwUW4zV3VtU05B?=
 =?utf-8?B?eHIwTjVTc1V5L3gyQnpqRGZjZk9STnJOR3hWK2NMY2dJS2NsSHE5UkMrM1Ez?=
 =?utf-8?B?YWtTMjJZbHFjU2hRdkY5bk1EZVplNGExSzNiWVFuUUU4OFpCNE43YVdIUXRP?=
 =?utf-8?B?S3ZTbW53djhQVXlOZXFldnNmeWRPVG9mZjM5TDZGTmRtUzFhbWtzeDJFa0xJ?=
 =?utf-8?B?VXNuVk1vajM5anVsVGZXRjNkc1RnL2F5TnVSQ2RaUEEwTER3S0hoUys3Slpn?=
 =?utf-8?B?RkRsLzRuWTlnUld5RXV2dERTS0x4VDFPVUR2Qi8xNU4vd29qMzJBenBBdTh0?=
 =?utf-8?B?cGswUVBHaGhKTEloYkcvSDVVMVZoYURBc1ZBQnVVelZKQ1B6aHI2OVhQYlBI?=
 =?utf-8?B?UDdjNjJOS0lHbjU5czdHOHdQakVscXg4ZStwdXBGYWtzM3lYVWQ2QkdxU3Ri?=
 =?utf-8?B?N2FGSzg2T0duVklZTmRDYlRDdUJlc2VuSDhkTk4zeWFxcERMbmMvc3dDeEti?=
 =?utf-8?B?RHNCa2Y2TEM1MGRISUZPYmUyNVZ3cTcrOE41UjlGNS90VmNlbDg4akZUUnFT?=
 =?utf-8?B?ZTMrUHl4RDF2N1JJSEpIajI2Vys1czJEenZtdkpqOTFvUEZwbURYV0pWTHhN?=
 =?utf-8?B?UjVSMXZmVnpCNERVeDM2eGEzQmhOdHZzdnVXNStROElmdDE4aXBuNDN6YXJi?=
 =?utf-8?B?QkNyRVRzRTRjZzc1THNVNXBiSHNNcGtxY09oazRWSkJhb0VVbkJJSUV3YnpZ?=
 =?utf-8?B?cE96QXJkVHJhRzZUbXZhblNWUFBZZklaMFlPNWVRSHY0RVZxWWY2dnhoVjds?=
 =?utf-8?B?SlJ0ZzdTK1Vsc3gwQnN3T0xUMDl4QkhDdG9JYkw1WTIxNnhSd3JVbGpmRUJz?=
 =?utf-8?Q?UzyJ/9v+2nlHyeLgs9MJkL2ch?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F043471757410745B6B9B481206DD33C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e36543-0c45-4422-6757-08dd76bce7e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 16:46:27.2578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCp0xqUNG3OeFmUDhwEH980XMxS1ayifwgj61gTXgghsTD8kt+BBgFqKGlZvObO+Ri/+2clPD4RKH0O2EOFgnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503
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

T24gVHVlLCAyMDI1LTA0LTA4IGF0IDE3OjQyICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IElTVFIgeW91IHNhaWQgdGhhdCBpZiB0aGUgcHJvcHJpZXRhcnkgZHJpdmVyIGRvZXMgbWFu
YWdlIHRvIHVzZSB0aGF0DQo+IHBvcnQsIHRoZW4gd2UgY291bGQgYXQgbGVhc3QgbG9vayBhdCB3
aHkgbm91dmVhdSBkb2Vzbid0Pw0KDQpZZXMsIGJ1dCB0aGF0IGlzIGJleW9uZCBteSBrbm93bGVk
Z2Ugb2YgTm91dmVhdSBhbmQgR1BVIGRyaXZlcnMuDQoNCj4gQ291bGQgaXQgZXZlbiBhbHJlYWR5
IGJlIGZpeGVkIGluIHRoZSByNTcwLWJhc2VkIHVwZGF0ZSB0byBub3V2ZWF1Pw0KDQpJIGRvdWJ0
IGl0LiAgTGV0IG1lIGxvb2sgYXQgdGhlIGxvZ3MsIGFuZCBpZiBJIGRvbid0IHNlZSBhbnl0aGlu
ZywgSSdsbCBnaXZlDQp5b3UgaW5zdHJ1Y3Rpb25zIG9uIGhvdyB0byBiZXRhIHRlc3QgcjU3MC4N
Cg==
