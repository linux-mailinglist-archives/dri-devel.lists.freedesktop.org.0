Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AB7DD447
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282710E4BA;
	Tue, 31 Oct 2023 17:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 15457 seconds by postgrey-1.36 at gabe;
 Tue, 31 Oct 2023 17:09:19 UTC
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46910E4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:09:19 +0000 (UTC)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.1.59])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id A8A972C031
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:09:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rjwh7 (unknown [10.108.1.233])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2E18C1FE88;
 Tue, 31 Oct 2023 17:09:12 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.109])
 by ghost-submission-6684bf9d7b-rjwh7 with ESMTPSA
 id VI0wBLg0QWWXLgEATp+Mog
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 17:09:12 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003fe2eeb36-42a8-47b4-a769-4c5c4cb96913,
 68EF3BC41A3FAA3930AA1D7F8F8F567988DEB53B)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 213.216.208.215
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH v2] drm/radeon: replace 1-element arrays with flexible-array
 members
Date: Tue, 31 Oct 2023 19:08:47 +0200
Message-Id: <20231031170847.23458-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3800193661057803942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpedtudethfeghfegfffhtdeuhedukeduudeuieeiteegkedtudegvdektefftedvffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrddvudeirddvtdekrddvudehpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported by coccinelle, the following patch will move the
following 1 element arrays to flexible arrays.

drivers/gpu/drm/radeon/atombios.h:5523:32-48: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:5545:32-48: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:5461:34-44: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4447:30-40: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4236:30-41: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7095:28-45: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:3896:27-37: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:5443:16-25: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:5454:34-43: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4603:21-32: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4628:32-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:6285:29-39: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4296:30-36: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4756:28-36: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:4064:22-35: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7327:9-24: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7332:32-53: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7362:26-41: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7369:29-44: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7349:24-32: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/gpu/drm/radeon/atombios.h:7355:27-35: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
[v1 -> v2] removed padding and hinted sensitive cases from original patch

 drivers/gpu/drm/radeon/atombios.h | 42 +++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 8a6621f1e82c..2db40789235c 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -3893,7 +3893,7 @@ typedef struct _ATOM_GPIO_PIN_ASSIGNMENT
 typedef struct _ATOM_GPIO_PIN_LUT
 {
   ATOM_COMMON_TABLE_HEADER  sHeader;
-  ATOM_GPIO_PIN_ASSIGNMENT	asGPIO_Pin[1];
+  ATOM_GPIO_PIN_ASSIGNMENT	asGPIO_Pin[];
 }ATOM_GPIO_PIN_LUT;
 
 /****************************************************************************/	
@@ -4061,7 +4061,7 @@ typedef struct _ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT         //usSrcDstTableOffset
   UCHAR               ucNumberOfSrc;
   USHORT              usSrcObjectID[1];
   UCHAR               ucNumberOfDst;
-  USHORT              usDstObjectID[1];
+  USHORT              usDstObjectID[];
 }ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT;
 
 
@@ -4233,7 +4233,7 @@ typedef struct  _ATOM_CONNECTOR_DEVICE_TAG_RECORD
   ATOM_COMMON_RECORD_HEADER   sheader;
   UCHAR                       ucNumberOfDevice;
   UCHAR                       ucReserved;
-  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[1];         //This Id is same as "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
+  ATOM_CONNECTOR_DEVICE_TAG   asDeviceTag[];          //This Id is same as "ATOM_DEVICE_XXX_SUPPORT", 1 is only for allocation
 }ATOM_CONNECTOR_DEVICE_TAG_RECORD;
 
 
@@ -4293,7 +4293,7 @@ typedef struct  _ATOM_OBJECT_GPIO_CNTL_RECORD
   ATOM_COMMON_RECORD_HEADER   sheader;
   UCHAR                       ucFlags;                // Future expnadibility
   UCHAR                       ucNumberOfPins;         // Number of GPIO pins used to control the object
-  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[1];              // the real gpio pin pair determined by number of pins ucNumberOfPins
+  ATOM_GPIO_PIN_CONTROL_PAIR  asGpio[];               // the real gpio pin pair determined by number of pins ucNumberOfPins
 }ATOM_OBJECT_GPIO_CNTL_RECORD;
 
 //Definitions for GPIO pin state 
@@ -4444,7 +4444,7 @@ typedef struct  _ATOM_BRACKET_LAYOUT_RECORD
   UCHAR                       ucWidth;
   UCHAR                       ucConnNum;
   UCHAR                       ucReserved;
-  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[1];
+  ATOM_CONNECTOR_LAYOUT_INFO  asConnInfo[];
 }ATOM_BRACKET_LAYOUT_RECORD;
 
 /****************************************************************************/	
@@ -4600,7 +4600,7 @@ typedef struct  _ATOM_I2C_VOLTAGE_OBJECT_V3
    UCHAR    ucVoltageControlAddress;
    UCHAR    ucVoltageControlOffset;	 	
    ULONG    ulReserved;
-   VOLTAGE_LUT_ENTRY asVolI2cLut[1];        // end with 0xff
+   VOLTAGE_LUT_ENTRY asVolI2cLut[];         // end with 0xff
 }ATOM_I2C_VOLTAGE_OBJECT_V3;
 
 // ATOM_I2C_VOLTAGE_OBJECT_V3.ucVoltageControlFlag
@@ -4625,7 +4625,7 @@ typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
    UCHAR    ucLeakageEntryNum;           // indicate the entry number of LeakageId/Voltage Lut table
    UCHAR    ucReserved[2];               
    ULONG    ulMaxVoltageLevel;
-   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[1];   
+   LEAKAGE_VOLTAGE_LUT_ENTRY_V2 asLeakageIdLut[];
 }ATOM_LEAKAGE_VOLTAGE_OBJECT_V3;
 
 
@@ -4753,7 +4753,7 @@ typedef struct _ATOM_POWER_SOURCE_INFO
 {
 		ATOM_COMMON_TABLE_HEADER		asHeader;
 		UCHAR												asPwrbehave[16];
-		ATOM_POWER_SOURCE_OBJECT		asPwrObj[1];
+		ATOM_POWER_SOURCE_OBJECT		asPwrObj[];
 }ATOM_POWER_SOURCE_INFO;
 
 
@@ -5440,7 +5440,7 @@ typedef struct _ATOM_FUSION_SYSTEM_INFO_V2
 typedef struct _ATOM_I2C_DATA_RECORD
 {
   UCHAR         ucNunberOfBytes;                                              //Indicates how many bytes SW needs to write to the external ASIC for one block, besides to "Start" and "Stop"
-  UCHAR         ucI2CData[1];                                                 //I2C data in bytes, should be less than 16 bytes usually
+  UCHAR         ucI2CData[];                                                  //I2C data in bytes, should be less than 16 bytes usually
 }ATOM_I2C_DATA_RECORD;
 
 
@@ -5451,14 +5451,14 @@ typedef struct _ATOM_I2C_DEVICE_SETUP_INFO
   UCHAR		                        ucSSChipID;             //SS chip being used
   UCHAR		                        ucSSChipSlaveAddr;      //Slave Address to set up this SS chip
   UCHAR                           ucNumOfI2CDataRecords;  //number of data block
-  ATOM_I2C_DATA_RECORD            asI2CData[1];  
+  ATOM_I2C_DATA_RECORD            asI2CData[];
 }ATOM_I2C_DEVICE_SETUP_INFO;
 
 //==========================================================================================
 typedef struct  _ATOM_ASIC_MVDD_INFO
 {
   ATOM_COMMON_TABLE_HEADER	      sHeader; 
-  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[1];
+  ATOM_I2C_DEVICE_SETUP_INFO      asI2CSetup[];
 }ATOM_ASIC_MVDD_INFO;
 
 //==========================================================================================
@@ -5520,7 +5520,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO
 typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V2
 {
   ATOM_COMMON_TABLE_HEADER	      sHeader; 
-  ATOM_ASIC_SS_ASSIGNMENT_V2		  asSpreadSpectrum[1];      //this is point only. 
+  ATOM_ASIC_SS_ASSIGNMENT_V2		  asSpreadSpectrum[];       //this is point only.
 }ATOM_ASIC_INTERNAL_SS_INFO_V2;
 
 typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
@@ -5542,7 +5542,7 @@ typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
 typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 {
   ATOM_COMMON_TABLE_HEADER	      sHeader; 
-  ATOM_ASIC_SS_ASSIGNMENT_V3		  asSpreadSpectrum[1];      //this is pointer only. 
+  ATOM_ASIC_SS_ASSIGNMENT_V3		  asSpreadSpectrum[];       //this is pointer only.
 }ATOM_ASIC_INTERNAL_SS_INFO_V3;
 
 
@@ -6282,7 +6282,7 @@ typedef union _ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS
 
 typedef struct _ATOM_MEMORY_SETTING_DATA_BLOCK{
 	ATOM_MEMORY_SETTING_ID_CONFIG_ACCESS			ulMemoryID;
-	ULONG															        aulMemData[1];
+	ULONG															        aulMemData[];
 }ATOM_MEMORY_SETTING_DATA_BLOCK;
 
 
@@ -7092,7 +7092,7 @@ typedef struct _ATOM_DISP_OUT_INFO_V3
   UCHAR  ucCoreRefClkSource;                    // value of CORE_REF_CLK_SOURCE
   UCHAR  ucDispCaps;
   UCHAR  ucReserved[2];
-  ASIC_TRANSMITTER_INFO_V2  asTransmitterInfo[1];     // for alligment only
+  ASIC_TRANSMITTER_INFO_V2  asTransmitterInfo[];      // for alligment only
 }ATOM_DISP_OUT_INFO_V3;
 
 //ucDispCaps
@@ -7324,12 +7324,12 @@ typedef struct _CLOCK_CONDITION_SETTING_ENTRY{
   USHORT usMaxClockFreq;
   UCHAR  ucEncodeMode;
   UCHAR  ucPhySel;
-  ULONG  ulAnalogSetting[1];
+  ULONG  ulAnalogSetting[];
 }CLOCK_CONDITION_SETTING_ENTRY;
 
 typedef struct _CLOCK_CONDITION_SETTING_INFO{
   USHORT usEntrySize;
-  CLOCK_CONDITION_SETTING_ENTRY asClkCondSettingEntry[1];
+  CLOCK_CONDITION_SETTING_ENTRY asClkCondSettingEntry[];
 }CLOCK_CONDITION_SETTING_INFO;
 
 typedef struct _PHY_CONDITION_REG_VAL{
@@ -7346,27 +7346,27 @@ typedef struct _PHY_CONDITION_REG_VAL_V2{
 typedef struct _PHY_CONDITION_REG_INFO{
   USHORT usRegIndex;
   USHORT usSize;
-  PHY_CONDITION_REG_VAL asRegVal[1];
+  PHY_CONDITION_REG_VAL asRegVal[];
 }PHY_CONDITION_REG_INFO;
 
 typedef struct _PHY_CONDITION_REG_INFO_V2{
   USHORT usRegIndex;
   USHORT usSize;
-  PHY_CONDITION_REG_VAL_V2 asRegVal[1];
+  PHY_CONDITION_REG_VAL_V2 asRegVal[];
 }PHY_CONDITION_REG_INFO_V2;
 
 typedef struct _PHY_ANALOG_SETTING_INFO{
   UCHAR  ucEncodeMode;
   UCHAR  ucPhySel;
   USHORT usSize;
-  PHY_CONDITION_REG_INFO  asAnalogSetting[1];
+  PHY_CONDITION_REG_INFO  asAnalogSetting[];
 }PHY_ANALOG_SETTING_INFO;
 
 typedef struct _PHY_ANALOG_SETTING_INFO_V2{
   UCHAR  ucEncodeMode;
   UCHAR  ucPhySel;
   USHORT usSize;
-  PHY_CONDITION_REG_INFO_V2  asAnalogSetting[1];
+  PHY_CONDITION_REG_INFO_V2  asAnalogSetting[];
 }PHY_ANALOG_SETTING_INFO_V2;
 
 typedef struct _GFX_HAVESTING_PARAMETERS {
-- 
2.39.2

