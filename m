Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D889ACB6E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 15:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52910E7DF;
	Wed, 23 Oct 2024 13:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ai25xfZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0FF10E7DD;
 Wed, 23 Oct 2024 13:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO97VTopZcSDig7KlBw2+8iVcexXEcGg5X1xQHBB2Q3nKWQzONM0CshkIbSl1ndkFwXhselrAOKQoCOEgaSRzAH2d8r+ea5E7GgTx9GvIJ77CA8anamF1Z8XqoOYNtdhs1cxYr894Qq3LJkHql418/QJuBYD+C/4r/xMnPvu7oGuYcTQDTaztRjB89toFchalk+oK9cFJz7wV4cQpOVoE+5snkhJPJ4JnpsdnmEUnhhoAt0/mDiq5UZEfFIqU7B5BKtEI+sGDcP8zpR2bI9ZxKfYhZgc0oajhlLux2Fz6UI8ppOHWIqAjBRINbSbfqKpgFG+l/72661unkxyPSnFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EX5R9XbxqXPpUBqZ7EUqIGEuJ3dFNIKdYs7cVEHRXyc=;
 b=KJgJcpP1anWsD1EqgD1PvrMvIOGkJeMXWzAeUCCISDBtLTfMoGNhaKOeY/CRYSABPK/PL3zvXHJtc0IZm3/1fb4iHe7Gr8dLz2ltZaRNWSMwmgHnwV5jC3Wt9iqzryCTqP51FtgvbYGZzTWeu5I/hQXRe7Dchn2bHSqPJfYfSLRK3Foht/c6nUuViq4OJ6cFZjCn/QZnYCQLqsusqqZ/DuKEAx+VT17zFZOQcOSI+9C8TV0QtxRXY+EGBRjt72e6KDKz8a95mBJA7erEW1ZcSE2/dvt4jKX2UWARjCwOc2Rpi3g0wLzIRNLVrFg/uNIQ6VTONkmjQUphGXYjrDgr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX5R9XbxqXPpUBqZ7EUqIGEuJ3dFNIKdYs7cVEHRXyc=;
 b=ai25xfZRMHj3WLMJvifUQ7PYEPqKsdsDEfTY2qJOE9RWkF4sYv25eN8YMJF+gtNEF7SMi375jZWWqSHNEbbrHDfmMTjYBfjSvhwuQb/h/eGORGUVlwk5tnT4QpbfstXc/7GxP39+dgsiHZxSJABR/kr8Ep3MgWsGRdRYnRIfSJk=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 13:40:37 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 13:40:37 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Topic: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Index: AQHbIWJhHP+NzSvtr0Wud0WRwWwvcrKSaWAAgABzHCCAAB6NAIAA/2oAgAAavQCAACfTAIAACe2AgAADXQCAAA5OsIAABnjA
Date: Wed, 23 Oct 2024 13:40:37 +0000
Message-ID: <SA1PR12MB8599C26BF99A595E536C57DFED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
 <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
 <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
 <SA1PR12MB859920867E49C80E5059C97BED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB859920867E49C80E5059C97BED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8fea7a6d-92f9-4ef8-8b3f-e663cec44db5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-23T13:15:53Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|SA1PR12MB7038:EE_
x-ms-office365-filtering-correlation-id: de97f61b-6031-4d64-8eaf-08dcf36846dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Rk5zdmxxMVR4STlRbHB4T3hnUUVtMmwyVE1nU1I3RytXVUcvZ2E1RVJVcFgy?=
 =?utf-8?B?Qnk4dlFVRjZNYncvc2xCVjBiT1Z6dXpFRG9KNGVNT3MxUUVpbFBLVTU1WFJp?=
 =?utf-8?B?Uy9zS0phU3dsRGkvbHVIWFBBRFgzenpwTWNzeThjWGltYXp4b3RVbTQ4VHJz?=
 =?utf-8?B?bWdCajB4UmxPWW8zUWJNdUs2VUpvR0MxT2VNQ1VFZU9nYy90WDBVaEVpRjB6?=
 =?utf-8?B?YVdIY0NPTEt3ZGZRN2JtQjI2MEZBZVU0b0gvYkxhZmdDRktDQUNwUFZsU2hQ?=
 =?utf-8?B?ckJVSXRrb2tXNk9Cc0tOVXB5RlFXVDlDZ2FyWU9iZm93U1l5VHZrZHhudEgv?=
 =?utf-8?B?U2NyRmlab1NsT21pUTBzZ3U0YW5HU0ZoU1BiRGpJTmxqUVpFaVhKVFM1ckRm?=
 =?utf-8?B?bmdHMkhSRDhpdkFOYlB2QlFsNnlxQ1ZYMitqWmZDUE00dUp3dDlTLzltVlho?=
 =?utf-8?B?STBoamlFcGlPU1pmT0N5SGVETFVYbVBSeHB5QjJlT3VWVmxpTVFVQUgwRVhV?=
 =?utf-8?B?cEx0dkhyOXJlajlyTDFpUWwzYlE5eEdrSGh6QXdBMDY1SHlMZ2xDRXJEVFZG?=
 =?utf-8?B?NHBzd1d0c0hmajh4L0pGSnFqb2tWeDluelNYNW9rNGxndC9vMzhnQ04zSmtp?=
 =?utf-8?B?U0t1aXNFamJNaVhMd3ZENzRLb2lBOWcySWdodFBMWDZsczdkZ3FWcWFNRDhu?=
 =?utf-8?B?Uy9hcUwrRWdNNTNKUFpwRENSVUdNNFp4YWhUVjRtU0dnS3pVTVQycGdPTVVh?=
 =?utf-8?B?L2dQRFJmWWhKWFNhT0ZrQ3U2QU9CemhsVU1jU3daTkI1U2RWTmJmSllKY0FY?=
 =?utf-8?B?T01JcEZhaWJmb0hSVTd1OVN4RExOTEFTRnhhMDQrYmZseEpFYkw4MnBQbVNs?=
 =?utf-8?B?bnhkM2NrK2s4aGdHSkVGbW5FK3Y3THpFQ1l3ZkhyaGJtUFk3S0pJbkp5UzY2?=
 =?utf-8?B?Mk1XNXpJRWl6K2hGL1U5cGg4ZkIwRTR1VUpCUHd1eC8waEltTXYrQVRqWlZ2?=
 =?utf-8?B?QjhXY3FlQmM3QWo0Y1BiYzBpMnFCLzFtVktCSGYwUzhIKzRBcThkSUwwNERl?=
 =?utf-8?B?Q04xZ0J4bWZYVU9lcjFwM0dXejhGMzZMTldTS2ZuenZVQ3B3MXdxdEtqb2Jm?=
 =?utf-8?B?WUc2VHZscnBxWFpncG0xbGMzUzR1WjNTNTh4dXZkTDU3MzBJSDlDeCtrMUlR?=
 =?utf-8?B?Wk1oU1A0Vjk3SWVpRDVmUzhWSWt2Z2tuV1REeHdIUkhtbmtlbUo0UTVEYSty?=
 =?utf-8?B?RlhDUU13UmxmR0l5dUhPUkV6bE9TdDFLTVhLanJNNngwM2VSU1MwTjFrbjNl?=
 =?utf-8?B?SUwvWXcwWWFZWEgwT1V4SWdnWk9YTHNDbEgwblBBY3R4MmxWQ2R4UjhQeUNy?=
 =?utf-8?B?RXpvbksxWCtDQXNWY2pyQXh6RE1NdTcvSE9UcXlNMkQ1c1ZjT1JpT003WGJU?=
 =?utf-8?B?ODhvby9USmZZR3dDZ1plcFFQQ1JadnNqSnZkUDdScGJpRW5YampaWmc4WmRa?=
 =?utf-8?B?eXkrNm5taWRlK09SSjE2aldOaEVRN0IzQXUzYzNlT0ttNitQVDRWTmxtUFFL?=
 =?utf-8?B?bndMSGZKYm1qbDQ0R09DZy8ySndzajVlUFBpMUI1ellMaHh4aU5jYVFDeGRV?=
 =?utf-8?B?bVVDUFZzanpEZUZ4eGtla0dVcTFJMjVDdzIzSXVUenJYNTJoekwxaHdONXJU?=
 =?utf-8?B?RmtrL0NiZ0U4ZG9rVmVSZjF1a0ZUNUFpcXRQUjQ1QzJYS1k4MWlqQ0h2R3h1?=
 =?utf-8?B?WnFVb25zN0dGS0tZMklSVFdncVhRbzFURFRwR0pXajBRL0l3VTBFYUUxZjVO?=
 =?utf-8?Q?SLh2GzAU0LnVBrav3jxGnFGr8Q53M/uf189Fk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEZ3N0N4WnBwT2MzTGZlMDNEYnZKdDlrQW9iY0tqbFRGMEp6eVlaYjExTUJN?=
 =?utf-8?B?MlJZM0dzVVlBVkQvRWRxWm9BdERyK1hpTDdXeGR5cWJodjNFYnhnREJndTNk?=
 =?utf-8?B?RFRMZ0xLbkpDZEFXbm1GLzMrTDUrck52T3VCZTR1dmJab25tdUU3WVdITzZK?=
 =?utf-8?B?cUtqM0hLZG10cGkxUGZ3RjdZRXE3R2NpaEVSOUUreFZ6WUkzQTlzdER6TXpu?=
 =?utf-8?B?QlF5SDlJT3B1dGt0dmN5VW10UTZJeU9UTk54WHI4Y29xMFlQWDlUT0pUcFM1?=
 =?utf-8?B?dytVRnVSZFk3K2tjaUJNTGFOSFZ0NklHRklsQ2xBbmZpdXdHNy9YK2dZcjRD?=
 =?utf-8?B?MlpzTExvbVpIYWx0QlVZQ01ZVFp4d0czZ0ZQMjhqTEpuNXRNYWlSNU4wQTh1?=
 =?utf-8?B?UzFYUE5CMEhCa012UjR6UkR4aXMvUU1xQTFROCtrNDBXNjBLVTMzTEJIM1lx?=
 =?utf-8?B?MFFDbzhyRXBZemdxZlZHbTZCZFhTZGFqclFoQ1k4ZUJrbzNhYVQxa1kreGNt?=
 =?utf-8?B?QUgvWTVrTlRDd0Vlb0pKZi9oMWorV0grWmd4Y1hjcnRRcm9FWHJFSUJtVDBW?=
 =?utf-8?B?UUNHV3NHTFJVYWpwRENld3JzbWNMMnRlcGl0VWovV0t3U0NHcHl1d25PZksx?=
 =?utf-8?B?eDY3cng3V1RrNFltOHpaeVM1a3pqNEhFbzlHNVJnNEVsSXIrYXJYYTBpelNH?=
 =?utf-8?B?SVZJaFoydUJIaXIvMU9UUWtvRkYwc2Zvb3QrTzNER01hZGFlem5vb29JVWw5?=
 =?utf-8?B?cDM5a0ZtS0t1QmFycTZ0QkFyMW9MUGJsTnA3bm9XOVJ5TUI3elBJektjM013?=
 =?utf-8?B?TnQwenFZS2xUSXJ3aU9sekxOMHBOM2ZraHBDdm1uSVVZU2JBME12Vmx1UnVD?=
 =?utf-8?B?SXB4cWY1Rmt1N3hXQ0dnVjlxWHJxY2h6dndJTkpGZGZhOGlhMHh6dSs4L3JQ?=
 =?utf-8?B?dE91aFBuMnRyZ3RnMFl2TGVmdXI4VTRzZjR4c3NQdGFwcWZRNjVpd3lobWtQ?=
 =?utf-8?B?Rmc4VjdpVFFFek9ZK1dYZ25mT0FaUXpxWW5PZ1R4eWwvZUpzaGc1WTBPMkk5?=
 =?utf-8?B?RFFjMXhGNjdVUGI4YllVS1k5Nzc5TkNTcHBtKytjK095dFp4RkMvYjdaMlFy?=
 =?utf-8?B?eTVXVFVSc3JHUXlFWWN5alNnODdPTVdMWWhpMUdVeHhYd2FtT1VvUjdKdXFy?=
 =?utf-8?B?TFFSSWZvcStMcC9mYktFTnYrR2RBSUJKeXNWZGpIRG9RNWtrQ1lIQTZySHNq?=
 =?utf-8?B?b01YVi9uYjV1czNOUWRyQmdteHdrbVdEbVRra0hXWTROVGRzSWE5eU9mZ2sz?=
 =?utf-8?B?TWJ0NHRrbVZJMExKN1BqRm9KcjhxZEZnaldZMVNvbjgzalVNcWc1TGxWOG81?=
 =?utf-8?B?UGxDZ3BSeXBHU2t6Sm15LzNGdGl3b1IzR0lMTjhGT0NJdWlCQnJHbStQRzRk?=
 =?utf-8?B?eFZmT1FrSVBCZmoyRTdUcDFlWDBxZmtvOEFkNGpLMzJjVGV2OEFMU0dMN3lu?=
 =?utf-8?B?bHJoSkRnejVVdkpnQjJLSklNUENkUmp4VFpkM3d5YzhPbS9OaHA2Ti9mS1pI?=
 =?utf-8?B?YUFlM0pORExrUFp5dDRMSEl5bHZhMUw4bjdvRUVXWkpWN0k3VXVNR0U0clRQ?=
 =?utf-8?B?aGtRa2NKWlRXZDIvV00vMUZxRHZmaEMvd3djUEVFeUVHSWNVQmRKeE9zQmpi?=
 =?utf-8?B?YTk5MXNRSVVkYkhPV1BIR3Z1bkg0MEg4V205akFLcWw3NHdPZTJ6YUNiQ1F2?=
 =?utf-8?B?Wm5VdkdEblpZaS8rVlBlUXRqZnAwdmRCUGZGaU8vK2xuS3VkQzVTTUlQcnd4?=
 =?utf-8?B?OW5DSEJXcm5XOFJucTdkbDdGK0VZVktxSGtsUHdoK1lDenREV05zL2RaaUtY?=
 =?utf-8?B?clpzL0FzcEFla1Q0WStYdHRyME83M3hRZGNJWnBtbG5ic1p6Y2EralErOWlU?=
 =?utf-8?B?T3U0NmVxbVhOM0UxRXhzb2hGdnE0VnQxMC9xTG1QRUlpWlBBVHdpSHNaSDFC?=
 =?utf-8?B?MnZSWVhmdzYzVE5TYVJyS291MG1MeE8vbUhpRmtLbFQ4SUkzZ2U3aDh4YnZD?=
 =?utf-8?B?NXd0aktOVExZREFXUjR0dml0Yk9DZHhzdGZCcnA5NWFIeEJ0SWUrczZNNmNy?=
 =?utf-8?Q?4eRM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de97f61b-6031-4d64-8eaf-08dcf36846dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 13:40:37.0445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmLN1IOTprU4KUJLJ4uBl06m5i/CUv8yzUr0abLihPOP+EYdAuTBC3U8jhyErFge3Zdx26nS5ETUjzAe4bMPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KWWVhaCBpdCBsb29rcyBsaWtlIEkgbWlzc2VkIHRoZSB3aG9sZSBhY3RpdmUvcHVyZ2VhYmxl
IHRoaW5nIGFzIHdlbGwuLi4NCg0KVGVkZHkNCg==
