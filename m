Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A491B92A0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 20:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3635889C98;
	Sun, 26 Apr 2020 18:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0145.hostedemail.com
 [216.40.44.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EEB89C98;
 Sun, 26 Apr 2020 18:06:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id B5871181D341E;
 Sun, 26 Apr 2020 18:06:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:1:2:41:355:379:599:960:973:988:989:1028:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:2915:3138:3139:3140:3141:3142:3865:3867:3868:3870:3871:3872:3874:4052:4321:4384:4605:5007:8957:9108:9592:10004:10848:11026:11473:11657:11658:11914:12043:12048:12291:12295:12296:12297:12438:12555:12679:12683:12760:12986:13018:13019:13161:13229:13439:13972:14659:14877:21080:21433:21451:21627,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: soup82_389f1b58a7502
X-Filterd-Recvd-Size: 10978
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sun, 26 Apr 2020 18:06:28 +0000 (UTC)
Message-ID: <8b9bf44c9f823b887ca3477f3b6bca383c0eba4e.camel@perches.com>
Subject: Re: [PATCH] drm/radeon: cleanup coding style a bit
From: Joe Perches <joe@perches.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Bernard
 Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sun, 26 Apr 2020 11:06:27 -0700
In-Reply-To: <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
References: <20200426131244.22293-1-bernard@vivo.com>
 <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

btw:  the debugging macros in atom.c are not good.

It could be something like the below as the output logging is
at best poorly formatted due to the many individual printks
without KERN_<LEVEL> that are emitted on separate lines.

#define ATOM_DEBUG

should probably be commented out.

The debugging macros and #include file should be better formatted.

The no_printk macro is useful to verify formats and arguments when
not debugging and removing the ATOM_DEBUG from atom-names.h does
not cause the unused char *arrays to be added to the object file
as the compiler elides unused arrays.

---
 drivers/gpu/drm/radeon/atom-names.h | 266 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/radeon/atom.c       |  23 ++--
 2 files changed, 218 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atom-names.h b/drivers/gpu/drm/radeon/atom-names.h
index 6f907a5..055775 100644
--- a/drivers/gpu/drm/radeon/atom-names.h
+++ b/drivers/gpu/drm/radeon/atom-names.h
@@ -27,74 +27,218 @@
 
 #include "atom.h"
 
-#ifdef ATOM_DEBUG
-
 #define ATOM_OP_NAMES_CNT 123
-static char *atom_op_names[ATOM_OP_NAMES_CNT] = {
-"RESERVED", "MOVE_REG", "MOVE_PS", "MOVE_WS", "MOVE_FB", "MOVE_PLL",
-"MOVE_MC", "AND_REG", "AND_PS", "AND_WS", "AND_FB", "AND_PLL", "AND_MC",
-"OR_REG", "OR_PS", "OR_WS", "OR_FB", "OR_PLL", "OR_MC", "SHIFT_LEFT_REG",
-"SHIFT_LEFT_PS", "SHIFT_LEFT_WS", "SHIFT_LEFT_FB", "SHIFT_LEFT_PLL",
-"SHIFT_LEFT_MC", "SHIFT_RIGHT_REG", "SHIFT_RIGHT_PS", "SHIFT_RIGHT_WS",
-"SHIFT_RIGHT_FB", "SHIFT_RIGHT_PLL", "SHIFT_RIGHT_MC", "MUL_REG",
-"MUL_PS", "MUL_WS", "MUL_FB", "MUL_PLL", "MUL_MC", "DIV_REG", "DIV_PS",
-"DIV_WS", "DIV_FB", "DIV_PLL", "DIV_MC", "ADD_REG", "ADD_PS", "ADD_WS",
-"ADD_FB", "ADD_PLL", "ADD_MC", "SUB_REG", "SUB_PS", "SUB_WS", "SUB_FB",
-"SUB_PLL", "SUB_MC", "SET_ATI_PORT", "SET_PCI_PORT", "SET_SYS_IO_PORT",
-"SET_REG_BLOCK", "SET_FB_BASE", "COMPARE_REG", "COMPARE_PS",
-"COMPARE_WS", "COMPARE_FB", "COMPARE_PLL", "COMPARE_MC", "SWITCH",
-"JUMP", "JUMP_EQUAL", "JUMP_BELOW", "JUMP_ABOVE", "JUMP_BELOW_OR_EQUAL",
-"JUMP_ABOVE_OR_EQUAL", "JUMP_NOT_EQUAL", "TEST_REG", "TEST_PS", "TEST_WS",
-"TEST_FB", "TEST_PLL", "TEST_MC", "DELAY_MILLISEC", "DELAY_MICROSEC",
-"CALL_TABLE", "REPEAT", "CLEAR_REG", "CLEAR_PS", "CLEAR_WS", "CLEAR_FB",
-"CLEAR_PLL", "CLEAR_MC", "NOP", "EOT", "MASK_REG", "MASK_PS", "MASK_WS",
-"MASK_FB", "MASK_PLL", "MASK_MC", "POST_CARD", "BEEP", "SAVE_REG",
-"RESTORE_REG", "SET_DATA_BLOCK", "XOR_REG", "XOR_PS", "XOR_WS", "XOR_FB",
-"XOR_PLL", "XOR_MC", "SHL_REG", "SHL_PS", "SHL_WS", "SHL_FB", "SHL_PLL",
-"SHL_MC", "SHR_REG", "SHR_PS", "SHR_WS", "SHR_FB", "SHR_PLL", "SHR_MC",
-"DEBUG", "CTB_DS",
+static const char * const atom_op_names[ATOM_OP_NAMES_CNT] = {
+	"RESERVED",
+	"MOVE_REG",
+	"MOVE_PS",
+	"MOVE_WS",
+	"MOVE_FB",
+	"MOVE_PLL",
+	"MOVE_MC",
+	"AND_REG",
+	"AND_PS",
+	"AND_WS",
+	"AND_FB",
+	"AND_PLL",
+	"AND_MC",
+	"OR_REG",
+	"OR_PS",
+	"OR_WS",
+	"OR_FB",
+	"OR_PLL",
+	"OR_MC",
+	"SHIFT_LEFT_REG",
+	"SHIFT_LEFT_PS",
+	"SHIFT_LEFT_WS",
+	"SHIFT_LEFT_FB",
+	"SHIFT_LEFT_PLL",
+	"SHIFT_LEFT_MC",
+	"SHIFT_RIGHT_REG",
+	"SHIFT_RIGHT_PS",
+	"SHIFT_RIGHT_WS",
+	"SHIFT_RIGHT_FB",
+	"SHIFT_RIGHT_PLL",
+	"SHIFT_RIGHT_MC",
+	"MUL_REG",
+	"MUL_PS",
+	"MUL_WS",
+	"MUL_FB",
+	"MUL_PLL",
+	"MUL_MC",
+	"DIV_REG",
+	"DIV_PS",
+	"DIV_WS",
+	"DIV_FB",
+	"DIV_PLL",
+	"DIV_MC",
+	"ADD_REG",
+	"ADD_PS",
+	"ADD_WS",
+	"ADD_FB",
+	"ADD_PLL",
+	"ADD_MC",
+	"SUB_REG",
+	"SUB_PS",
+	"SUB_WS",
+	"SUB_FB",
+	"SUB_PLL",
+	"SUB_MC",
+	"SET_ATI_PORT",
+	"SET_PCI_PORT",
+	"SET_SYS_IO_PORT",
+	"SET_REG_BLOCK",
+	"SET_FB_BASE",
+	"COMPARE_REG",
+	"COMPARE_PS",
+	"COMPARE_WS",
+	"COMPARE_FB",
+	"COMPARE_PLL",
+	"COMPARE_MC",
+	"SWITCH",
+	"JUMP",
+	"JUMP_EQUAL",
+	"JUMP_BELOW",
+	"JUMP_ABOVE",
+	"JUMP_BELOW_OR_EQUAL",
+	"JUMP_ABOVE_OR_EQUAL",
+	"JUMP_NOT_EQUAL",
+	"TEST_REG",
+	"TEST_PS",
+	"TEST_WS",
+	"TEST_FB",
+	"TEST_PLL",
+	"TEST_MC",
+	"DELAY_MILLISEC",
+	"DELAY_MICROSEC",
+	"CALL_TABLE",
+	"REPEAT",
+	"CLEAR_REG",
+	"CLEAR_PS",
+	"CLEAR_WS",
+	"CLEAR_FB",
+	"CLEAR_PLL",
+	"CLEAR_MC",
+	"NOP",
+	"EOT",
+	"MASK_REG",
+	"MASK_PS",
+	"MASK_WS",
+	"MASK_FB",
+	"MASK_PLL",
+	"MASK_MC",
+	"POST_CARD",
+	"BEEP",
+	"SAVE_REG",
+	"RESTORE_REG",
+	"SET_DATA_BLOCK",
+	"XOR_REG",
+	"XOR_PS",
+	"XOR_WS",
+	"XOR_FB",
+	"XOR_PLL",
+	"XOR_MC",
+	"SHL_REG",
+	"SHL_PS",
+	"SHL_WS",
+	"SHL_FB",
+	"SHL_PLL",
+	"SHL_MC",
+	"SHR_REG",
+	"SHR_PS",
+	"SHR_WS",
+	"SHR_FB",
+	"SHR_PLL",
+	"SHR_MC",
+	"DEBUG",
+	"CTB_DS",
 };
 
 #define ATOM_TABLE_NAMES_CNT 74
-static char *atom_table_names[ATOM_TABLE_NAMES_CNT] = {
-"ASIC_Init", "GetDisplaySurfaceSize", "ASIC_RegistersInit",
-"VRAM_BlockVenderDetection", "SetClocksRatio", "MemoryControllerInit",
-"GPIO_PinInit", "MemoryParamAdjust", "DVOEncoderControl",
-"GPIOPinControl", "SetEngineClock", "SetMemoryClock", "SetPixelClock",
-"DynamicClockGating", "ResetMemoryDLL", "ResetMemoryDevice",
-"MemoryPLLInit", "EnableMemorySelfRefresh", "AdjustMemoryController",
-"EnableASIC_StaticPwrMgt", "ASIC_StaticPwrMgtStatusChange",
-"DAC_LoadDetection", "TMDS2EncoderControl", "LCD1OutputControl",
-"DAC1EncoderControl", "DAC2EncoderControl", "DVOOutputControl",
-"CV1OutputControl", "SetCRTC_DPM_State", "TVEncoderControl",
-"TMDS1EncoderControl", "LVDSEncoderControl", "TV1OutputControl",
-"EnableScaler", "BlankCRTC", "EnableCRTC", "GetPixelClock",
-"EnableVGA_Render", "EnableVGA_Access", "SetCRTC_Timing",
-"SetCRTC_OverScan", "SetCRTC_Replication", "SelectCRTC_Source",
-"EnableGraphSurfaces", "UpdateCRTC_DoubleBufferRegisters",
-"LUT_AutoFill", "EnableHW_IconCursor", "GetMemoryClock",
-"GetEngineClock", "SetCRTC_UsingDTDTiming", "TVBootUpStdPinDetection",
-"DFP2OutputControl", "VRAM_BlockDetectionByStrap", "MemoryCleanUp",
-"ReadEDIDFromHWAssistedI2C", "WriteOneByteToHWAssistedI2C",
-"ReadHWAssistedI2CStatus", "SpeedFanControl", "PowerConnectorDetection",
-"MC_Synchronization", "ComputeMemoryEnginePLL", "MemoryRefreshConversion",
-"VRAM_GetCurrentInfoBlock", "DynamicMemorySettings", "MemoryTraining",
-"EnableLVDS_SS", "DFP1OutputControl", "SetVoltage", "CRT1OutputControl",
-"CRT2OutputControl", "SetupHWAssistedI2CStatus", "ClockSource",
-"MemoryDeviceInit", "EnableYUV",
+static const char * const atom_table_names[ATOM_TABLE_NAMES_CNT] = {
+	"ASIC_Init",
+	"GetDisplaySurfaceSize",
+	"ASIC_RegistersInit",
+	"VRAM_BlockVenderDetection",
+	"SetClocksRatio",
+	"MemoryControllerInit",
+	"GPIO_PinInit",
+	"MemoryParamAdjust",
+	"DVOEncoderControl",
+	"GPIOPinControl",
+	"SetEngineClock",
+	"SetMemoryClock",
+	"SetPixelClock",
+	"DynamicClockGating",
+	"ResetMemoryDLL",
+	"ResetMemoryDevice",
+	"MemoryPLLInit",
+	"EnableMemorySelfRefresh",
+	"AdjustMemoryController",
+	"EnableASIC_StaticPwrMgt",
+	"ASIC_StaticPwrMgtStatusChange",
+	"DAC_LoadDetection",
+	"TMDS2EncoderControl",
+	"LCD1OutputControl",
+	"DAC1EncoderControl",
+	"DAC2EncoderControl",
+	"DVOOutputControl",
+	"CV1OutputControl",
+	"SetCRTC_DPM_State",
+	"TVEncoderControl",
+	"TMDS1EncoderControl",
+	"LVDSEncoderControl",
+	"TV1OutputControl",
+	"EnableScaler",
+	"BlankCRTC",
+	"EnableCRTC",
+	"GetPixelClock",
+	"EnableVGA_Render",
+	"EnableVGA_Access",
+	"SetCRTC_Timing",
+	"SetCRTC_OverScan",
+	"SetCRTC_Replication",
+	"SelectCRTC_Source",
+	"EnableGraphSurfaces",
+	"UpdateCRTC_DoubleBufferRegisters",
+	"LUT_AutoFill",
+	"EnableHW_IconCursor",
+	"GetMemoryClock",
+	"GetEngineClock",
+	"SetCRTC_UsingDTDTiming",
+	"TVBootUpStdPinDetection",
+	"DFP2OutputControl",
+	"VRAM_BlockDetectionByStrap",
+	"MemoryCleanUp",
+	"ReadEDIDFromHWAssistedI2C",
+	"WriteOneByteToHWAssistedI2C",
+	"ReadHWAssistedI2CStatus",
+	"SpeedFanControl",
+	"PowerConnectorDetection",
+	"MC_Synchronization",
+	"ComputeMemoryEnginePLL",
+	"MemoryRefreshConversion",
+	"VRAM_GetCurrentInfoBlock",
+	"DynamicMemorySettings",
+	"MemoryTraining",
+	"EnableLVDS_SS",
+	"DFP1OutputControl",
+	"SetVoltage",
+	"CRT1OutputControl",
+	"CRT2OutputControl",
+	"SetupHWAssistedI2CStatus",
+	"ClockSource",
+	"MemoryDeviceInit",
+	"EnableYUV",
 };
 
 #define ATOM_IO_NAMES_CNT 5
-static char *atom_io_names[ATOM_IO_NAMES_CNT] = {
-"MM", "PLL", "MC", "PCIE", "PCIE PORT",
+static const char * const atom_io_names[ATOM_IO_NAMES_CNT] = {
+	"MM",
+	"PLL",
+	"MC",
+	"PCIE",
+	"PCIE PORT",
 };
 
-#else
-
-#define ATOM_OP_NAMES_CNT 0
-#define ATOM_TABLE_NAMES_CNT 0
-#define ATOM_IO_NAMES_CNT 0
-
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.c
index 2c2762..892eeb 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -91,17 +91,20 @@ static int atom_def_dst[8] = { 0, 0, 1, 2, 0, 1, 2, 3 };
 
 static int debug_depth = 0;
 #ifdef ATOM_DEBUG
-static void debug_print_spaces(int n)
-{
-	while (n--)
-		printk("   ");
-}
-
-#define DEBUG(...) do if (atom_debug) { printk(KERN_DEBUG __VA_ARGS__); } while (0)
-#define SDEBUG(...) do if (atom_debug) { printk(KERN_DEBUG); debug_print_spaces(debug_depth); printk(__VA_ARGS__); } while (0)
+#define DEBUG(fmt, ...)							\
+do {									\
+	if (atom_debug)							\
+		printk(KERN_DEBUG fmt, ##__VA_ARGS__);			\
+} while (0)
+#define SDEBUG(fmt, ...)						\
+do {									\
+	if (atom_debug)							\
+		printk(KERN_DEBUG "%*s" fmt,				\
+		       debug_depth * 3, "", ##__VA_ARGS__);		\
+} while (0)
 #else
-#define DEBUG(...) do { } while (0)
-#define SDEBUG(...) do { } while (0)
+#define DEBUG(fmt, ...)		no_printk(fmt, ##__VA_ARGS__)
+#define SDEBUG(fmt, ...)	no_printk(fmt, ##__VA_ARGS__)
 #endif
 
 static uint32_t atom_iio_execute(struct atom_context *ctx, int base,




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
